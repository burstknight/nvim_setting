#!/bin/bash
###############################################################################
# Description: Initialize the setting for neovim.
###############################################################################

which sudo > /dev/null 2>&1
if [ $? -ne 0 ]; then
	alias sudo=': && '
fi

sudo apt-get update
sudo apt-get install -y git curl ripgrep fd-find clangd python3 python3-pip python3-venv

echo "Copy the directory 'nvim' into '$HOME/.config' ..."
mkdir -p $HOME/.config/nvim
cp -r ./nvim/* $HOME/.config/nvim/
echo "Done!"

