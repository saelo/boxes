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
Plugin 'gmarik/Vundle.vim'

"
" Plugins
"
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
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
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null 2>&1

# Install plugins
vim -c PluginInstall -c qa > /dev/null 2>&1

# Finish YouCompleteMe installation
cd ~/.vim/bundle/YouCompleteMe
# requires python2 .....
python install.py --clang-completer --gocode-completer

# Fetch real vimrc
curl -s https://gist.githubusercontent.com/saelo/da3e5ad7c6885472b1f0/raw/.vimrc > ~/.vimrc
