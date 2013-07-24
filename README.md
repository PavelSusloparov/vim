My vim modules and settings.

Pre actions:
Install git, vim, ctags on your box.

CentOS:

sudo yum install vim

sudo yum install git

sudo yum install ctags


Ubuntu:

sudo apt-get install vim

sudo apt-get install git

sudo apt-get install ctags


On your box:

cd ~

mkdir vim

cd vim

git init

git pull https://github.com/psusloparov/vim

git submodule init

WORKAROUND: if you have problems with submodule index on your local machine use git update-index bundle/<submodule name>

git submodule update

git submodule foreach git pull origin master

cd ~

mv ~/vim/.bashrc .bashrc_old

mv ~/vim/.vimrc .vimrc_old

mv ~/vim/.vim .vim_old


ln -s ~/vim/.bashrc .bashrc

ln -s ~/vim/.vimrc .vimrc

ln -s ~/vim .vim

Reload your console.


WORKAROUND: If you have message:

CSApprox needs gui support - not loading.

Use gvim -v instead of vim or ignore this message.


Please enjoy:)
