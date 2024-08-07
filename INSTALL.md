# Install Tutorial
This document can show how to use this repo to setup for neovim.

## For linux
You should run these commands to install necessary tools.
```bash
sudo apt-get update
sudo apt-get install -y git build-essential cmake
```

You need install neovim `0.10.0+` first. You can clone [neovim](https://github.com/neovim/neovim), and then build by yourself.

### Python environment
This repo uses `pyenv` to manage python verisons and `poetry` to manage the virtual environment.

#### Install pyenv
Please clone `pyenv` into `$HOME/.pyenv`.
```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

And then you should add the lines into `~/.bashrc`:
```bash
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv > /dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

Please use `pyenv` to install a python as the global python.
```bash
pyenv install 3.10.12
pyenv global 3.10.12
```

#### Install poetry
Please run this command to install `poetry`.
```bash
curl -sSL https://install.python-poetry.org | python3 -
```

Please add this line into `~/.bashrc`:
```bash
export PATH=$PATH:$HOME/.local/bin/
```

We need change the setting of `poetry` to create `.venv` for each python project, so we should run this command.
```bash
poetry config virtualenvs.in-project true
```

### Run `init.py`
This repo offers the python file `init.py`. It can install all necessary packages, and then copy all setting files to suitable location. You just run this command.
```bash
python3 init.py
```

If you don't get any error message, you succeed to setup the neovim.

## For windows
### Install chocolatey
`chocolatey` is a package manager on windows. We need use `chocolatey` to install all necessary packages for neovim.

Please use supervisor right to open `powershell`. And then use this command to the limits of the current authority.
```bash
Get-ExecutionPolicy
```

If you get the message `Restricted`, you can select one of the commands to get the higher authority.
```bash
Set-ExcutionPolicy AllSigned

// or

Set-ExcutionPolicy Bypass -Scope Process
```

Please run this command to install `chocolatey`.
```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Here gives a suggestion. You can use `chocolatey` to install `gsudo` that can easily switch to supervisor right on `powershell`.
```bash
choco install gsudo
```

### Install `msys2`
We need use `msys2` to offer C/C++ develop environment. Please download the installer from [this web](https://www.msys2.org/). And then run the installer. `msys2` will be installed to `C:\`.

Please change the line `db home: cygwin desc` in the file `C:\msys2\etc\nsswitch.conf` to this line:
```
db home: windows desc
```

Please open `ucrt64` terminal, and then run this commands and follow the hint message to upgrade `msys2`
```bash
pacman -Syu
```

Please run this command to install `git` on `ucrt64` terminal.
```bash
pacman -S git
```

You can use my other repo [msys2_steup](https://github.com/burstknight/msys2_setup.git) to install all necessary packages. First, you need clone the repo:
```bash
git clone https://github.com/burstknight/msys2_setup.git
```

And then run the commands:
```bash
cd msys2_setup
sh setup.sh
```

Now, please follow the commands to add the paths to set your environment variable `User PATH` on `powershell`.
```bash
[System.Environment]::SetEnvironmentVariable('path', [System.Environment]::GetEnvironmentVariable('path', "User") + "C:\msys64;" + "C:\msys64\usr\bin;" + "C:\msys64\ucrt64\bin;", "User")
```

### Python environment
#### Install pyenv
`pyenv` cannot support windows, but we can use [pyenv-win(https://github.com/pyenv-win/pyenv-win.git) to manage python verisons.

You can run this command to get `pyenv-win` on `powershell`.
```bash
git clone https://github.com/pyenv-win/pyenv-win.git "%USERPROFILE%\.pyenv"
```

Or, you can use this command to get `pyenv-win` on `bash` of `msys2`.
```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

And then please run the commands on `powershell` to set the environment variables `PYENV`, `PYENV_ROOT` and `PYENV_HOME`.
```bash
[System.Environment]::SetEnvironmentVariable('PYENV',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")

[System.Environment]::SetEnvironmentVariable('PYENV_ROOT',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")

[System.Environment]::SetEnvironmentVariable('PYENV_HOME',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
```

Finally, please run this command to sset the environment variable `User PATH`.
```bash
[System.Environment]::SetEnvironmentVariable('path', $env:USERPROFILE + "\.pyenv\pyenv-win\bin;" + $env:USERPROFILE + "\.pyenv\pyenv-win\shims;" + [System.Environment]::GetEnvironmentVariable('path', "User"),"User")
```

Please use `pyenv-win` to install python.
```bash
pyenv install 3.10.11
```

And then set the global python.
```bash
pyenv global 3.10.11
```

#### Install poetry
Please run this command on `powershell` with the supervisor right in order to install `poetry`.
```bash
(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | python -
```

And then you need use this command to add `poetry` add the environment variable `User PATH`.
```bash
[System.Environment]::SetEnvironmentVariable('path', $env:USERPROFILE + "\AppData\Roaming\Python\Scripts" + [System.Environment]::GetEnvironmentVariable('path', "User"), "User")
```

We need change the setting of `poetry` to create `.venv` for each python project, so we should run this command.
```bash
poetry config virtualenvs.in-project true
```

