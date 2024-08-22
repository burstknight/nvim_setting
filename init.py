#!/usr/bin/env python

import platform
from os import system
from os.path import exists, join
from pathlib import Path
from shutil import copytree, rmtree
from typing import Dict, List


class myNvimIniter:
    def __init__(self) -> None:
        self.__m_sPlatform = platform.system()
        self.__m_dctInstallCmd: Dict[str, List[str]] = {}
        self.__m_dctInstallCmd["Linux"] = [
            "curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -",
            "sudo apt-get update",
            "sudo apt-get install -y curl ripgrep fd-find clangd clang-format luarocks nodejs python3-venv python3 python3-pip",
            "curl -qL https://www.npmjs.com/install.sh | sh",
            "sudo npm install -g yarn",
            "sudo npm install -g tree-sitter-cli",
        ]
        self.__m_dctInstallCmd["Windows"] = [
            "curl",
            "ripgrep",
            "fd-find",
            "nerd-fonts-hack",
            "nodejs",
            "pwsh",
            "unzip",
            "yarn",
            "ripgrep",
            "7zip.install",
            "fd",
        ]
    # End of constructor

    def __installRequirements(self):
        if self.__m_sPlatform not in self.__m_dctInstallCmd.keys():
            raise RuntimeError("Not support the platform: %s" % (self.__m_sPlatform))
        # End of if-condition

        if "Linux" == self.__m_sPlatform:
            for sCmd in self.__m_dctInstallCmd[self.__m_sPlatform]:
                iResponse = system(sCmd)
                if 0 != iResponse:
                    print("Warning: Failed to run the command '%s'" %(sCmd))
                # End of if-condition
            # End of for-loop
        elif "Windows" == self.__m_sPlatform:
            for sCmd in self.__m_dctInstallCmd[self.__m_sPlatform]:
                system("choco install --yes %s" % (sCmd))
            # End of for-loop
        # End of if-condition

        system("pip install pynvim")
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

        print("Copy the directory 'nvim' into '%s' ..." % (sTargetPath))
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
