#!/usr/bin/env bash

echo "Reloading dotfiles."

echo "Backing up existing dotfiles."
echo "=============================="
source setup/backup.sh

echo "Installing dotfiles."
echo "=============================="
source setup/link.sh

