#!/bin/bash
###############################################################################
# Description: Initialize the setting for neovim.
###############################################################################

sudo apt-get update
sudo apt-get install -y git curl

echo "Copy the directory 'nvim' into '~/.config' ..."
cp -R ./nvim ~/.config/
echo "Done!"

