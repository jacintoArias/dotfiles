#!/usr/bin/env bash

# Backup files that are provided by the dotfiles into a ~/dotfiles-backup directory
DOTFILES=$HOME/.dotfiles
BACKUP_DIR=$HOME/.dotfiles-backup

echo -e "\n\nCreating backup directory at $BACKUP_DIR"
echo "=============================="
mkdir -p "$BACKUP_DIR"

rootfiles="$DOTFILES/zsh/zshrc $DOTFILES/tmux/tmux.conf $DOTFILES/git/gitconfig $DOTFILES/vim/vimrc $DOTFILES/vim"

for file in $rootfiles; do
    filename=".$( basename "$file" '.symlink' )"
    target="$HOME/$filename"
    if [ ! -L "$target" ]; then
        echo "backing up $filename"
        mv "$target" "$BACKUP_DIR"
    else
        echo -e "$filename does not exist at this location or is a symlink"
    fi
done

# Backing up vscode files
VSCODE=$HOME/Library/Application\ Support/Code/User
vscodefiles="settings.json keybindings.json snippets"

for filename in $vscodefiles; do
    if [ ! -L "$VSCODE/$filename" ]; then
        echo "backing up $filename"
        mv "$VSCODE/$filename" "$BACKUP_DIR"
    else
        echo -e "$filename does not exist at this location or is a symlink"
    fi
done