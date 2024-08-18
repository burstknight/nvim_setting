#!/usr/bin/env python

from os import system
from os.path import exists, join
from shutil import copytree, rmtree
from pathlib import Path
import platform
from typing import Dict, List

class myNvimIniter:
    def __init__(self) -> None:
        self.__m_sPlatform = platform.system()
        self.__m_dctPackage:Dict[str, List[str]] = {}
        self.__m_dctPackage["Linux"] = ["curl", "ripgrep", "fd-find", "clangd", "luarocks", "npm", "nodejs", "python3-venv", "python3", "python3-pip"]
        self.__m_dctPackage["Windows"] = ["curl", "ripgrep", "fd-find", "nerd-fonts-hack", "nodejs", "pwsh", "unzip", "yarn", "ripgrep", "7zip.install", "fd"]
    # End of constructor

    def __installRequirements(self):
        if self.__m_sPlatform not in self.__m_dctPackage.keys():
            raise RuntimeError("Not support the platform: %s" %(self.__m_sPlatform))
        # End of if-condition

        print("We need install the packages for neovim:")
        for sPackage in self.__m_dctPackage[self.__m_sPlatform]:
            print("\t* %s" %(sPackage))
        # End of for-loop

        if "Linux" == self.__m_sPlatform:
            system("sudo apt-get update")
            sRequirements = ""
            for sPackage in self.__m_dctPackage[self.__m_sPlatform]:
                sRequirements += sPackage + " "
            # End of for-loop

            system("sudo apt-get install -y %s" %(sRequirements))
            system("sudo npm install -g yarn")
        elif "Windows" == self.__m_sPlatform:
            for sPackage in self.__m_dctPackage[self.__m_sPlatform]:
                system("choco install --yes %s" %(sPackage))
            # End of for-loop
        # End of if-condition
    # End of myNvimIniter::installRequirements

    def __copySettingFiles(self):
        if "Windows" == self.__m_sPlatform:
            sTargetPath = join(Path.home(), "AppData/Local/nvim")
        else:
            sTargetPath = join(Path.home(), ".config/nvim")
        # End of if-condition

        if True is exists(sTargetPath):
            rmtree(sTargetPath)
        # End of if-condition

        print("Copy the directory 'nvim' into '%s' ..." %(sTargetPath))
        copytree("./nvim/", sTargetPath)
    # End of myNvimIniter::copySettingFiles
    
    def run(self):
        self.__installRequirements()
        self.__copySettingFiles()
    # End of myNvimIniter::run
# End of class myNvimIniter

def main():
    oNvimIniter = myNvimIniter()
    oNvimIniter.run()
# End of main

if "__main__" == __name__:
	main()
# End of if-condition
