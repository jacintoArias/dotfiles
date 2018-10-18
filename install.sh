#!/usr/bin/env bash
set -e

# only perform macos-specific install
if [ "$(uname)" == "Darwin" ]; then
  echo -e "\n\nRunning on OSX"
  echo "=============================="
  source setup/brew.sh
  source setup/osx.sh
else
  # only perform Linux-specific install
  echo -e "\n\nRunning on Linux" 
  echo "=============================="
  source setup/apt.sh
fi

echo -e "\n\nInstalling base16"
echo "=============================="
if [ ! -d "~/.config/base16-shell" ]; then
  sh -c "git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell"
else
  echo "base16 is already installed"
fi


echo -e "\n\nInstalling oh my zsh"
echo "=============================="
if ! [[ $SHELL =~ .*zsh.* ]]; then
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  sh -c "git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k"
else
  echo "Oh my zsh is already installed"
fi

source ./setup/backup.sh
source ./setup/link.sh

echo -e "\n\n"