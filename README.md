# m2g
Mercurial to git migration with https://github.com/frej/fast-export

# System Requirements
  - Git for Windows
  - Python 2.7
  - Mercurial >= 4.6
### Usage authors.map
* "Name Surname <<name.surname@mail.com>>"="Name Surname <<nameto.surnameto@mailto.com>>"
* "Name Surname <<name-second.surname-second@mail.com>>"="Name Surname <<name-second-to.-second-to@mailto.com>>"
Single chracter "<" , ">"
### Usage
```sh
$ m2g.sh
```
### Inputs
* Please enter source repository address: e.g ssh://hg@bitbucket.org/{team}/{repositoryname}
* Please enter target repository address: e.g https://{username}@bitbucket.org/{team}/{repositoryname}.git
* Please enter master branchname: e.g master
* Please enter encoding: e.g ascii https://docs.python.org/2.4/lib/standard-encodings.html

### Importants
* If your commits contains not asccii chracters,You have to use encoding
* If your author names contains double "<" or double ">",You have to use authors.map

### Using fast-export
https://github.com/frej/fast-export

### After completed note
Don't forget to change the .hgignore to .gitignore
```sh
$ git mv .hgignore .gitignore
```