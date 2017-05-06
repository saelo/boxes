#!/bin/sh

echo "Setting up vim..."

# Grab vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Fetch vimrc
curl -s https://raw.githubusercontent.com/saelo/dotfiles/master/vimrc > ~/.vimrc

# Install plugins
vim +PlugInstall +qall > /dev/null
