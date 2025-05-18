# nvim_setting
This repo is my neovim setting.

## Requirements
Neovim version must be `0.11.x+`.

Some plugins need use `nerd font`, so we need download a font from [this web](https://www.nerdfonts.com/font-downloads). And then decompress the downloaded compressed file. Finally, please copy `*.ttf` files into the path `/usr/local/share/fonts`.

You can read [INSTALL.md](./INSTALL.md) to get more information to setup neovim.

If you want to use neovim to write `gdscript` for godot, you have to install [godot 4.x](https://godotengine.org/).

## Used plugins
### For common functions
* [chadtree](https://github.com/ms-jpq/chadtree.git): I use this plugin as the file explorer.
* [nvim-notify](https://github.com/rcarriga/nvim-notify.git): It can use cool dialog to show message.
* [auto-pairs](https://github.com/jiangmiao/auto-pairs.git): It can automatically brackets, parens and quotes in pair.
* [DoxygenToolkit.vim](https://github.com/vim-scripts/DoxygenToolkit.vim.git): It can insert doxygen style comments for `C/C++`.
* [vim-code-dark](https://github.com/tomasiser/vim-code-dark.git): I use this plugin to set the color scheme for neovim.
* [vim-ranbow](https://github.com/frazrepo/vim-rainbow.git): This plugin can use multiple colors to show nest parentheses.
* [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim.git): I need use these plugins to show the status bar on neovim.
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git): This plugin can offer a fuzzy file finder.
* [indent-blackline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim.git): It can show indentation line.
* [which-key.nvim](https://github.com/folke/which-key.nvim.git): It can show the shortcuts on a floating dialog.
* [markdown-previw.nvim](https://github.com/iamcco/markdown-preview.nvim.git): It can use web browser to preview markdown files.
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git): It can highlight keywords for each file type.
* [gitignore.nvim](https://github.com/wintermute-cell/gitignore.nvim.git): It can generate `.gitignore`.
* [startup.nvim](https://github.com/max397574/startup.nvim.git): It can show the welcome page on neovim.
* [leetcode.nvim](https://github.com/kawre/leetcode.nvim.git): It can use neovim to practice `LeetCode`.
* [vim-cursorword](https://github.com/itchyny/vim-cursorword.git): It can use underline to show the word under the current cursor.

### For LSP(Language Server Protocol) functions
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
* [nvim-nio](https://github.com/nvim-neotest/nvim-nio.git): It can handle ansynchronous IO for neovim.

### For auto completion
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp.git): It is a completion engine.
* [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp.git): It can offer information from LSP server to the plugin `nvim-cmp` for auto completion.
* [cmp-path](https://github.com/hrsh7th/cmp-path.git): The plugin `nvim-cmp` need use it for auto completion filesystem paths.
* [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline.git): The plugin `nvim-cmp` need use it to implement the completion for command mode.
* [cmp-buffer](https://github.com/hrsh7th/cmp-buffer.git): The plugin `nvim-cmp` need use it to implement the completion for buffer words.
* [vim-vsnip](https://github.com/hrsh7th/vim-vsnip.git): It can insert vscode style snippets during typing code for auto completion.
* [cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip.git): The plugin `vim-vsnip` need use it to insert vscode style snippets for auto completion.
* [friendly-snippets](https://github.com/burstknight/friendly-snippets.git): This plugin has defined many snippets for auto completion.

### For DAP(Debug Adapter Protocol)
* [nvim-dap](https://github.com/mfussenegger/nvim-dap.git): It is implemented for DAP(Debug Adapter Protocol) client.
* [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text.git): It can show debug information on neovim during debugging using neovim.
* [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui.git): It can offer cool UI on neovim for DAP.
* [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim.git): It can use the plugin `mason.nvim` to automatically install DAP servers.

## Keymaps
I use `space key` as the leader key for neovim.

### Keymaps for common functions
| Keymaps | Description |
| -------------- | --------------- |
| `<F2>` | Open the file browser. |
| `<F8>` | Insert the doxygen style comment for a function signature. |
| `<leader>ff` | Fuzzy search the file from the current project. |
| `<leader>fg` | Use `grep` to search keyword from the current project. |
| `<leader>fr` | Fuzzy search the recent opened files. |
| `<leader>mp` | Open the web browser to preview the current markdown file. |
| `<leader>ms` | Stop previewing the current markdown file. |
| `<leader>mt` | Toggle to preview the current markdown file. |
| `<leader>G` | Use the plugin `gitignore.nvim` to generate `.gitignore`. |

### Keymaps for internal terminal.
| Keymaps | Description |
| -------------- | --------------- |
| `<leader>tf` | Open the floating terminal on neovim. |
| `<leader>tt` | Open a tab to run a terminal on neovim. |
| `<leader>ts` | Horizontally split window to open a terminal on neovim. |
| `<leader>tv` | Vertically split window to open a terminal on neovim. |
| `Ctrl` + `k` | Return normal mode for the floating terminal on neovim. |

### Keymaps for LSP
| Keymaps | Description |
| -------------- | --------------- |
| `<leader>lr` | Rename for variable or function. |
| `<leader>la` | Perform code action. |
| `<leader>ld` | Go to definition for variable or function. |
| `<leader>lf` | Find the definition, reference or implementation for the keyword. |
| `<F3>` | Open the outline for the currrent file. |
| `<leader>lh` | Hover the document for variable or function. |
| `<leader>l=` | Format the currrent code. |

### Keymaps for completion
| Keymaps | Description |
| -------------- | --------------- |
| `Alt` + `j` | Toggle for completion. |
| `Alt` + `k` | Abort for completion. |
| `Tab` | Move the next item of the candidate list for completion. |
| `Shift` + `Tab` | Move the previous item of the candidate list for completion. |
| `Enter` | Select the current item of the candidate list for completion. |

### Keymaps for DAP
| Keymaps | Description |
| -------------- | --------------- |
| `<leader>db` | Add or remove the break point. |
| `<leader>dc` | Continue running for debugging. |
| `<leader>dd` | Disconnect for DAP. |
| `<leader>dn` | Run the next statement for debugging. |
| `<leader>dq` | Close DAP. |
| `<leader>ds` | Run a step into the currrent function for debugging. |
| `<leader>dx` | Terminate DAP. |

### Keymaps for `leetcode.nvim`
| Keymaps | Description |
| -------------- | --------------- |
| `<leader>LL` | Open the plugin `leetcode.nvim`. |
| `<leader>Lq` | Close the plugin `leetcode.nvim`. |
| `<leader>Lm` | Return the menu. |
| `<leader>Ld` | Open the question of the today. |
| `<leader>Ll` | Open a problem list picker. |
| `<leader>LR` | Open a random question. |
| `<leader>Lr` | Run the currently opened question. |
| `<leader>La` | Change the language for the currently opened question. |
| `<leader>Ls` | Submit the currently opened question. |

### Keymaps for `chadtree`
| Keymaps | Description |
| -------------- | --------------- |
| `q` | Close the file browser. |
| `L` | Show the status for a file or directory. |
| `i` | Open the selected file in horizontal split. |
| `I` | Open the selected file in vertical split. |
| `c` | Collpase all subdirectories for the directory at the currrent cursor on the file browser. |
| `W` | Change the current working directory for neovim. |
| `a` | Create a new file or a new directory at the location under the current cursor on the file browser. |
| `r` | Rename a file or a directory. |
| `c` | Copy the selected files for directories to the location under the current cursor on the file browser. |
| `x` | Move the selected files or directories to the location under the current cursor on the files browser. |
| `d` | Delete the selected files. |

## Try it on docker
### For linux
If you want to try my configuration for neovim, you can run [docker](https://www.docker.com/) or [podman](https://podman.io/) with my dockerfiles.

First, you need run this command to build the image.
```bash
# For docker.
docker build -t neovim -f ./docker/Dockerfile.ubuntu .

# For podman
podman build -t neovim -f ./docker/Dockerfile.ubuntu .
```

Now, you can use this command to run the image as a container.
```bash
# For docker
docker run --rm -it neovim

# For podman
podman run --rm -it neovim
```

