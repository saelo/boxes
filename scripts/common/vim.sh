#!/bin/sh

echo "Setting up vim..."

# Write bootstrap vimrc
cat > ~/.vimrc <<EOF
set nocompatible        " be IMproved
filetype off            " required, reverted below

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"
" Plugins
"
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'rking/ag.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
EOF

# Grab vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install plugins
vim +PluginInstall +qall > /dev/null

# Finish YouCompleteMe installation
cd ~/.vim/bundle/YouCompleteMe
if vim --version | grep -q +python3; then
    python3 install.py --clang-completer
else
    python install.py --clang-completer
fi

# Fetch real vimrc
curl -s https://gist.githubusercontent.com/saelo/da3e5ad7c6885472b1f0/raw/.vimrc > ~/.vimrc
