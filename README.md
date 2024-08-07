# nvim_setting
This repo is my neovim setting.

## Requirements
Neovim version must be `0.10+`. 

Some plugins need use `nerd font`, so we need download a font from [this web](https://www.nerdfonts.com/font-downloads). And then decompress the downloaded compressed file. Finally, please copy `*.ttf` files into the path `/usr/local/share/fonts`.

You can read [INSTALL.md](./INSTALL.md) to get more information to setup neovim.

## Used plugins
### For common functions
* [nerdtree](https://github.com/preservim/nerdtree.git): I use this plugin as the file explorer. 
* [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin.git): The plugin `nerdtree` need use this plugin to show git status for each files.
* [nvim-notify](https://github.com/rcarriga/nvim-notify.git): It can use cool dialog to show message. 
* [auto-pairs](https://github.com/jiangmiao/auto-pairs.git): It can automatically brackets, parens and quotes in pair.
* [DoxygenToolkit.vim](https://github.com/vim-scripts/DoxygenToolkit.vim.git): It can insert doxygen style comments for `C/C++`.
* [vim-code-dark](https://github.com/tomasiser/vim-code-dark.git): I use this plugin to set the color scheme for neovim.
* [vim-ranbow](https://github.com/frazrepo/vim-rainbow.git): This plugin can use multiple colors to show nest parentheses.
* [vim-airline](https://github.com/vim-airline/vim-airline.git) and [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes.git): I need use these plugins to show the status bar on neovim. 
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git): This plugin can offer a fuzzy file finder. 
* [indent-blackline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim.git): It can show indentation line.
* [which-key.nvim](https://github.com/folke/which-key.nvim.git): It can show the shortcuts on a floating dialog.
* [markdown-previw.nvim](https://github.com/iamcco/markdown-preview.nvim.git): It can use web browser to preview markdown files.
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git): It can highlight keywords for each file type.

