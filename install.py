# /// script
# requires-python = ">=3.8"
# dependencies = []
# ///

import platform
from os import system
from os.path import exists, join
from pathlib import Path
from shutil import copytree, rmtree
from typing import Dict, List
from time import sleep


class myNvimIniter:
    def __init__(self) -> None:
        self.__m_sPlatform = platform.system()
        self.__m_dctInstallCmd: Dict[str, List[str]] = {}
        self.__m_dctInstallCmd["Linux"] = [
            "curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -",
            "sudo apt-get update",
            "sudo apt-get install -y curl ripgrep fd-find clangd clang-format luarocks nodejs python3-venv python3 python3-pip xclip dotnet-sdk-10.0 rustup",
            "curl -qL https://www.npmjs.com/install.sh | sh",
            "sudo npm install -g yarn",
            "sudo npm install -g tree-sitter-cli",
        ]

        self.__m_dctInstallCmd["Windows"] = [
            "scoop bucket add main",
            "scoop bucket add versions",
            "scoop bucket add extras",
            "scoop bucket add nerd-fonts",
            "scoop update",
            "scoop install main/pwsh",
            "scoop install main/7zip",
            "scoop install main/wget",
            "scoop install main/unzip",
            "scoop install main/luarocks",
            "scoop install main/luajit",
            "scoop install main/gzip",
            "scoop install main/nodejs",
            "scoop install main/yarn",
            "scoop install main/tree-sitter",
            "scoop install main/ripgrep",
            "scoop install main/fd",
            "scoop install main/cmake",
            "scoop install main/clangd",
            "scoop install Hack-NF",
            "scoop install main/mingw",
            "scoop install versions/dotnet-sdk-lts",
			"scoop install main/omnisharp",
            "scoop install main/rustup",
        ]

        self.__m_vsPythonPackages =[
			"uv tool install pynvim",
			"uv tool install yapf",
            "uv tool install debugpy",
		]
    # End of constructor

    def __installRequirements(self):
        if self.__m_sPlatform not in self.__m_dctInstallCmd.keys():
            raise RuntimeError("Not support the platform: %s" % (self.__m_sPlatform))
        # End of if-condition

        print("Installing necessary requirements...")
        for sCmd in self.__m_dctInstallCmd[self.__m_sPlatform]:
            iResponse = system(sCmd)
            if 0 != iResponse:
                print("Warning: Failed to run the command '%s'!" % (sCmd))
            # End of if-condition
        # End of for-loop

        for sCmd in self.__m_vsPythonPackages:
            iResponse = system(sCmd)
            if 0 != iResponse:
                print("Warning: Failed to run the command '%s' to install python package!" %(sCmd))
            # End of if-condition
        # End of for-loop
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
        isSkipInstall = False
        try:
            sUserInput = input("Do you want to just copy all neovim setting files [y/n]? ")
            if sUserInput.lower() not in ("y", "n"):
                raise ValueError()
            # End of if-condition

            if "y" == sUserInput:
                isSkipInstall = True
            # End of if-condition
        except ValueError:
            print("Warning: You give the invaild input, so we will install all requirements!")
            sleep(1.5)
        # End of try-catch

        if True == isSkipInstall:
            print("Ok, we skip installing requirements, and then just copy all neovim setting files...")
        else:
            self.__installRequirements()
        # End of if-condition

        self.__copySettingFiles()
        system("nvim --headless 'Lazy! sync' +qa")

        print("Done!")
    # End of myNvimIniter::run
# End of class myNvimIniter


def main():
    oNvimIniter = myNvimIniter()
    oNvimIniter.run()
# End of main

if "__main__" == __name__:
    main()
# End of if-condition
