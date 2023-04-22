# KatzVim
| [sceenshots](#screenshots)      |
| [installation](#installation)   |
| [list plugins](#list-plugins)   |
| [configuration](#configuration) |

## Screenshots
![Startup Screen](https://raw.github.com/libkatz-cxx/KatzVim/main/screenshots/startup_screen.png)
![Code SS](https://raw.github.com/libkatz-cxx/KatzVim/main/screenshots/code.png)
![Error SS](https://raw.github.com/libkatz-cxx/KatzVim/main/screenshots/lsp.png)

## Installation
#### clone repository:
> git clone https://github.com/libkatz-cxx/KatzVim/ ~/.config/nvim/

#### install [packer](https://github.com/wbthomason/packer.nvim) (plugin manager):
> git clone --depth 1 https://github.com/wbthomason/packer.nvim\   
> ~/.local/share/nvim/site/pack/packer/start/packer.nvim

#### install nodejs for [coc.nvim](https://github.com/neoclide/coc.nvim) and nerdfonts for ui:   
debian-based:   
> apt install nodejs nerdfonts

fedora linux:   
> dnf install nodejs nerdfonts   

#### run the ":PackerSync" in NeoVim(after that restart it):    
> nvim -c ":PackerSync"

## List plugins   
**total plugins - 12 (13 with nvim-dap)**  

#### [ appearence ]:   
* ['startup-nvim/startup.nvim'](https://github.com/startup-nvim/startup.nvim)   
* ['olivercederborg/poimandres.nvim'](https://github.com/olivercederborg/poimandres.nvim)   
* ['onsails/lspkind-nvim'](https://github.com/onsails/lspkind-nvim)   
* ['nvim-tree/nvim-web-devicons'](https://github.com/nvim-tree/nvim-web-devicons)   

#### [ ui ]:   
* ['nvim-tree/nvim-tree.lua'](https://github.com/nvim-tree/nvim-tree.lua)    
* ['akinsho/bufferline.nvim'](https://github.com/akinsho/bufferline.nvim)     
* ['nvim-lualine/lualine.nvim'](https://github.com/nvim-lualine/lualine.nvim)   

#### [ LSP, DAP, CMake ]:   
* ['neoclide/coc.nvim'](https://github.com/neoclide/coc.nvim)   
* ['mfussenegger/nvim-dap'](https://github.com/mfussenegger/nvim-dap)   // disabled by default   
* ['cdelledonne/vim-cmake'](https://github.com/cdelledonne/vim-cmake)   

#### [ other ]:   
* ['wbthomason/packer.nvim'](https://github.com/wbthomason/packer.nvim)   
* ['nvim-telescope/telescope.nvim'](https://github.com/nvim-telescope/telescope.nvim)   
* ['nvim-lua/plenary.nvim'](https://github.com/nvim-lua/plenary.nvim)   


## Configuration   
#### I recomended to install coc-pairs for auto close pairs   
> :CocInstall coc-pairs   

#### config structure:
![Error SS](https://raw.github.com/libkatz-cxx/KatzVim/main/screenshots/tree.png)
        
all keymaps should be in keys/keymaps   
all settings should be in settings/settings   
all plugins configuration should be in plugins/   
