-- adding Packer as a package to NeoVim
vim.cmd [[packadd packer.nvim]]

-- use this callback as a list of plugins
return require('packer').startup(function()
		-- plugin manager
		use 'wbthomason/packer.nvim'

		-- startup screen
    use {
        'startup-nvim/startup.nvim',
        requires = {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim'},
        config = function()
						vim.g.startup_disable_on_startup = true,
          	require('startup').setup(require('plugins/startup_nvim'))
				end
      }

		-- theme
		use({
  	'olivercederborg/poimandres.nvim',
  	config = function()
    		require('poimandres').setup({
      				bold_vert_split = false,
      				dim_nc_background = false,
      				disable_background = true,
      				disable_float_background = false,
      				disable_italics = false,
    		})
    				vim.cmd('colorscheme poimandres')
  			end
		})

		-- file explorer
		use {
				'nvim-tree/nvim-tree.lua',
				requires = {'nvim-tree/nvim-web-devicons'},
				config = function()
						require('nvim-tree').setup(require('plugins/nvim_tree'))
				end
		}

		-- buffer line
		use {
				'akinsho/bufferline.nvim',
				tag = 'v3.*',
				config = function()
						require('bufferline').setup()
				end
		}

		-- status line
		use {
				'nvim-lualine/lualine.nvim',
				config = function()
						require('lualine').setup(require('plugins/lualine'))
				end
		}

		-- LSP
		use {
				'neoclide/coc.nvim', 
				branch = 'release'
		}

		-- debug adapter protocol
		-- use 'mfussenegger/nvim-dap'

		-- cmake integration
		use 'cdelledonne/vim-cmake'
end)