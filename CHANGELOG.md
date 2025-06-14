# Change Log

## [Unreleased]
### [Added]
* Use the langauge server `marksman` to support markdown.

### [Changed]
* Change the setting file [mason.lua](./nvim/lua/lsp/mason.lua) to use the simple way for setting all lsp configurations.

### [Fixed]

### [Security]

### [Removed]

### [Deprecated]


----
## [0.5.0] - 2025/05/18
### [Added]
* Use the langauge server `mesonlsp` to support the build setting files for the build tool `meson`.
* Set `powershell` as the defualt shell on floating terminal for windows.
* Add some shortcuts for internal terminals because just using floating terminal cannot statisfy me.
* Use the langauge server `lemmix` for `xml`.
* Add the dap setting to support `C#`.

### [Changed]
* Change the source of the plugin `mason.nvim` to [mason-org/mason.nvim](https://github.com/mason-org/mason.nvim.git) because this plugin must be updated to `v2.0.0` for the plugin `nvim-lspconfig v2.0.0`.
* Change lsp settings for all langauges because the plugin `nvim-lspconfig` has been updated to `v2.0.0`.
* Change the shortcut for formatting code: `<leader>=` -> `<leader>l=`.

### [Fixed]
* Hold the version of the plugin `vim-vsnip` to `02a8e79295c9733434aab4e0e2b8c4b7cea9f3a9` because this plugin dosen't work for `C#`.

### [Deprecated]
* The plugin `DoxygenToolkit` will be deprecated because the plugins `vim-vsnip` and `friendly-snippets` can generate doxygen style comments for `C/C++`.


----
## [0.4.0] - 2024/12/08
### [Added]
* LSP supports `C#`.
* Add the plugin `vim-cursorword` to underline the word under the current cursor on neovim.
* The plugin `conform.nvim` can use `clang-format` to format `C#` code.

### [Changed]
* Change the theme to use `nerdtree_syntax_dark` for the plugin `chadtree`.
* Replace `ruff_lsp` with `ruff` to format python code because `ruff_lsp` will be deprecated by neovim lspconfig.
* Change shortcuts for the plugin `telescope.nvim`:
	* `<leader>ff`: `<cmd>telescope find_files`
	* `<leader>fg`: `<cmd>telescope live_grep`
	* `<leader>fr`: `<cmd>telescope oldfiles`
* Replace `csharp_ls` with `omnisharp` for `C#` langauge server because I need develop `C#` program on windows.
* Change the setting of the plugin `gitignore.nvim` to append new ignore rules into `.gitignore`.

### [Fixed]
* Change the source of the plugin `mason.nvim` to use my fork because I has been added some code to fix the bug. The bug is that the plugin `mason.nvim` couldn't install some langauge servers if I use `pyenv-win` on windows.
* Neovim alert the error about failing to use `clang-format` to format c/c++ code.
* Change the setting for the plugin `conform.nvim` because I used the wrong way to format code.

### [Removed]
* The file `setup.sh` has been removed because this repo offers `init.py` to setup the setting for neovim.


## [0.3.0] - 2024/10/25
### [Changed]
* Replace the plugin `nerdtree` with `chadtree` for the file browser.

### [Removed]
* Remove the plugin `nerdtree-git-plugin` because the plugin `nerdtree` has been removed.


----
## [0.2.0] - 2024/10/21
### [Added]
* Update LSP setting to support godot.

### [Changed]
* Change the update cache interval to 60 days for the plugin `leetcode.nvim`.
* I replace the plugin `vim-airline` with the plugin `lualine.nvim` to show the status bar on neovim.

### [Removed]
* Remove the plugin `vim-airline-themes` because I has removed the plugin `vim-airline`.


----
## [0.1.0] - 2024/09/03
### [Added]
* Add the plugins for LSP: `mason.nvim`, `mason-lspconfig.nvim`, `mason-registry`. So far support langauge:
    * [x] `C/C++`
    * [x] `Python 3.x`
    * [x] `cmake`
    * [x] `lua`
    * [x] `bash`
    * [x] `json`
    * [x] `yaml`
* Add the plugins for auto completions and LSP:
    * `nvim-cmp`
    * `cmp-nvim-lsp`
    * `cmp-path`
    * `cmp-cmdline`
    * `cmp-buffer`
    * `friendly-snippets`
    * `cmp-vsnip`
    * `vim-vsnip`
    * `nvim-lspconfig`
    * `mason.nvim`
    * `mason-lspconfig.nvim`
    * `mason-registry`
    * `friendly-snippets`
    * `lspkind.nvim`
    * `lspsafa.nvim`
    * `lsp_signature.nvim`
* Add the plugin `nerdtree` for file browser.
* Add the plugin `nerdtree-git-plugin` to show the git statuses for each file on `nerdtree`.
* Add the plugin `nvim-notify` to use cool UI to show information.
* Add the plugin `auto-pairs` to handle brackets, parens and quotes in pair.
* Add the plugins `vim-airline` and `vim-airline-themes` to show status bar on neovim.
* Add the plugin `DoxygenToolkit.vim` to insert doxygen style comments for `C/C++` code.
* Add the plugin `vim-code-dark` as the theme.
* Add the plugin `vim-ranbow` to use multiple colors to show nests brackets.
* Add the plugins `telescope.nvim` and `plenary.nvim` to offer fuzzy finder in order to find files.
* Add the plugin `nvim-treesitter` to highlighting texts.
* Add the plugin `tiny-inline-diagnostic.nvim` to show inline LSP information.
* Add the plugins for formatting source code:
    * `conform.nvim`
    * `mason-conform.nvim`
* Add the plugin `indent-blackline.nvim` to use cool UI to show the indents.
* Add the plugins for DAP(debug adapter protocol):
    * `nvim-dap`
    * `nvim-dap-virtual-text`
    * `nvim-nio`
    * `nvim-dap-ui`
    * `mason-nvim-dap.nvim`
* Add the plugin `which-key.nvim` to show the shortcuts on a floating dialog.
* Add the plugin `markdown-previw.nvim` to use web browser to preview makrdown files.
* Add the plugin `gitignore.nvim` to generate `.gitignore`.
* Add the plugin `startup.nvim` to show the welcome page on neovim.
* Add the plugin `leetcode.nvim` to practice `LeetCode` on neovim.

