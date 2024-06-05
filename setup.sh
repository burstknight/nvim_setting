#!/bin/bash
###############################################################################
# Description: Initialize the setting for neovim.
###############################################################################

which sudo > /dev/null 2>&1
if [ $? -ne 0 ]; then
	alias sudo=': && '
fi

sudo apt-get update
sudo apt-get install -y git curl

echo "Copy the directory 'nvim' into '$HOME/.config' ..."
mkdir -p $HOME/.config/nvim
cp -r ./nvim/* $HOME/.config/nvim/
echo "Done!"

echo "Download the plug manager vim-plug ..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Done!"
