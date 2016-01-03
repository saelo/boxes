#!/bin/sh

echo "Setting up zsh..."

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh > /dev/null 2>&1
curl -s https://raw.githubusercontent.com/Gram21/boxes/master/ctfbox/.zshrc_std > ~/.zshrc

# needs sudo to work passwordless
sudo chsh -s $(which zsh) $(whoami)
