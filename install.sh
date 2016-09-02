ln -s ~/gitrepos/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/gitrepos/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/gitrepos/dotfiles/.vimrc ~/.vimrc

mkdir ~/.vim
mkdir ~/.vim/bundle
mkdir ~/.vim/backup
mkdir ~/.vim/undo
mkdir ~/.vim/swp

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
