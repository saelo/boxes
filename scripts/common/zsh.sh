#!/bin/sh

echo "Setting up zsh..."

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
curl -s https://raw.githubusercontent.com/Gram21/boxes/master/ctfbox/.zshrc_std > ~/.zshrc

# needs sudo to work passwordless
sudo chsh -s $(which zsh) $(whoami)
