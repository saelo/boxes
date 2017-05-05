#!/bin/sh

echo "Setting up zsh..."

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
curl -s https://raw.githubusercontent.com/saelo/dotfiles/master/zshrc > ~/.zshrc

# needs sudo to work passwordless
sudo chsh -s $(which zsh) $(whoami)
