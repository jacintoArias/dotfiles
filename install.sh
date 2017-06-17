#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Installing dotfiles."
echo "=============================="

echo "Initializing submodule(s)"
echo "=============================="
git submodule update --init --recursive

source setup/link.sh

: <<'END'
# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"

    source setup/brew.sh

    source setup/osx.sh
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

if ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Installing oh my zsh"
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
else
    echo "Oh my zsh is already installed"
fi
END
