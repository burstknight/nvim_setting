#!/usr/bin/env python

from os import system
from os.path import exists, join
from shutil import copytree, rmtree
from pathlib import Path
import platform


def installRequirements():
	"""
	Description:
	=======================================================
	Install all requirements for neovim.
	"""
	if "Linux" == platform.system():
		system("sudo apt-get update")
		system("sudo apt-get install -y git curl ripgrep fd-find clangd python3 python3-pip python3-venv")
	else:
		system("choco install --yes luarocks tree-sitter nerd-fonts-hack nodejs pwsh unzip yarn ripgrep 7zip.install fd")
	# End of if-condition
# End of installRequirements

def copySettingFiles():
    if "Windows" == platform.system():
        sTargetPath = join(Path.home(), "AppData/Local/nvim")
    else:
        sTargetPath = join(Path.home(), ".config/nvim")
    # End if-condition

    if True == exists(sTargetPath):
        rmtree(sTargetPath)
    # End of if-condition

    print("Copy the directory 'nvim' into '$HOME/.config' ...")
    copytree("./nvim/", sTargetPath)
    print("Done!")
# End of copySettingFiles


def main():
    installRequirements()
    copySettingFiles()
# End of main

if "__main__" == __name__:
	main()
# End of if-condition
