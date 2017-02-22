cd /d %~d0%~p0

del %UserProfile%\.bashrc
del %UserProfile%\.gitconfig
del %UserProfile%\.gitignore_global
del %UserProfile%\.vimrc
del %UserProfile%\.gvimrc

mklink /h %UserProfile%\.bashrc .bashrc
mklink /h %UserProfile%\.gitconfig .gitconfig
mklink /h %UserProfile%\.gitignore_global .gitignore_global
mklink /h %UserProfile%\.vimrc .vimrc
mklink /h %UserProfile%\.gvimrc .gvimrc

mkdir %UserProfile%\.vim
mkdir %UserProfile%\.vim\bundle
mkdir %UserProfile%\.vim\backup
mkdir %UserProfile%\.vim\undo
mkdir %UserProfile%\.vim\swp
