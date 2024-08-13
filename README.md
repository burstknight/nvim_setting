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

### For LSP(Language Server protocol) functions
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig.git): It offers a easy way to set configurations for LSP.
* [tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim.git): It can show inline message from LSP server.
* [mason.nvim](https://github.com/williamboman/mason.nvim.git): It can manage LSP servers.
* [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim.git): It can automatically install LSP servers.
* [mason-registry](https://github.com/mason-org/mason-registry.git): The plugin `mason.nvim` need use it to manage LSP servers.
* [lspkind.nvim](https://github.com/onsails/lspkind.nvim.git): It can show cool LSP icons.
* [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim.git): It can improve LSP experences in neovim.
* [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim.git): It can show function signature when I type code.
* [conform.nvim](https://github.com/stevearc/conform.nvim.git): It can LSP to format code.
* [mason-conform.nvim](https://github.com/zapling/mason-conform.nvim.git): The plugin `conform.nvim` need use it to automatically install LSP server via `mason.nvim` for formatting code.

### For auto completion
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp.git): It is a completion engine.
* [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp.git): It can offer information from LSP server to the plugin `nvim-cmp` for auto completion.
* [cmp-path](https://github.com/hrsh7th/cmp-path.git): The plugin `nvim-cmp` need use it for auto completion filesystem paths.
* [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline.git): The plugin `nvim-cmp` need use it to implement the completion for command mode.
* [cmp-buffer](https://github.com/hrsh7th/cmp-buffer.git): The plugin `nvim-cmp` need use it to implement the completion for buffer words.
* [vim-vsnip](https://github.com/hrsh7th/vim-vsnip.git): It can insert vscode style snippets during typing code for auto completion.
* [cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip.git): The plugin `vim-vsnip` need use it to insert vscode style snippets for auto completion.

