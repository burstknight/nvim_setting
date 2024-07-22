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

