
echo "Welcome to m2g"

# e.g. ssh://hg@bitbucket.org/{team}/{repositoryname}
read -p 'Please enter source repository address: ' SourceRepositoryAddress

# e.g https://{username}@bitbucket.org/{team}/{repositoryname}.git
read -p 'Please enter target repository address: ' TargetRepositoryAddress

# e.g master
read -p 'Please enter master branchname: ' BranchName

# e.g ascii
read -p 'Please enter encoding: ' Encoding

rm fast-export -rf
mkdir fast-export
git clone https://github.com/frej/fast-export.git fast-export

rm source -rf
mkdir source

rm target -rf
mkdir target


hg clone $SourceRepositoryAddress source

cd target
git init
git config core.ignoreCase false
../fast-export/hg-fast-export.sh -r ../source -e $Encoding -A ../authors.map -M $BranchName
git checkout $BranchName

git remote add origin $TargetRepositoryAddress
git push --all origin

cd ..
rm fast-export -rf
rm source -rf
rm target -rf

echo "Migration successfully completed"
echo Source repository address "$SourceRepositoryAddress"
echo Target repository address "$TargetRepositoryAddress"
echo Master branch name "$BranchName"
echo Encoding "$Encoding"

read -p "Press any key to continue... " -n1 -s