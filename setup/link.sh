#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

echo -e "\n\nCreating dotfiles home root symlinks"
echo "=============================="

rootfiles="$DOTFILES/zsh/zshrc $DOTFILES/tmux/tmux.conf $DOTFILES/git/gitconfig $DOTFILES/vim/vimrc $DOTFILES/vim"

for file in $rootfiles ; do
    filename=".$( basename "$file")"
    if [[ -e "$HOME/$filename" || -L "$HOME/$filename" ]]; then
      echo "~/$filename already exists... Skipping."
    else
      echo "Creating symlink for $file"
      ln -s $file $HOME/$filename
    fi
done


echo -e "\n\nCreating vscode symlinks"
echo "=============================="

VSCODE=$HOME/Library/Application\ Support/Code/User
vscodefiles="settings.json keybindings.json snippets"

for filename in $vscodefiles; do
  file="$DOTFILES/vscode/$filename"
  target="$VSCODE/$filename"
  if [ -e "$target" ]; then
    echo "$target already exists... Skipping."
  else
    echo "Creating symlink for $filename"
    ln -s $target $VSCODE
  fi
done

# echo -e "\n\ninstalling to ~/.config"
# echo "=============================="
# if [ ! -d $HOME/.config ]; then
#     echo "Creating ~/.config"
#     mkdir -p $HOME/.config
# fi

# for config in $DOTFILES/config/*; do
#     target=$HOME/.config/$( basename $config )
#     if [ -e $target ]; then
#         echo "~${target#$HOME} already exists... Skipping."
#     else
#         echo "Creating symlink for $config"
#         ln -s $config $target
#     fi
# done

# create vim symlinks
# As I have moved off of vim as my full time editor in favor of neovim,
# I feel it doesn't make sense to leave my vimrc intact in the dotfiles repo
# as it is not really being actively maintained. However, I would still
# like to configure vim, so lets symlink ~/.vimrc and ~/.vim over to their
# neovim equivalent.

# echo -e "\n\nCreating vim symlinks"
# echo "=============================="
# VIMFILES=( "$HOME/.vim:$DOTFILES/config/nvim"
#         "$HOME/.vimrc:$DOTFILES/config/nvim/init.vim" )

# for file in "${VIMFILES[@]}"; do
#     KEY=${file%%:*}
#     VALUE=${file#*:}
#     echo $KEY
#     echo $VALUE
#     if [ -e ${KEY} ]; then
#         echo "${KEY} already exists... skipping."
#     else
#         echo "Creating symlink for $KEY"
#         ln -s ${VALUE} ${KEY}
#     fi
# done
