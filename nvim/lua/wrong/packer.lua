vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tab = '0.1.4',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'scottmckendry/cyberdream.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets'},
		}
	}
	use 'Diogo-ss/42-header.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'lewis6991/gitsigns.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'theprimeagen/harpoon'
	use 'tpope/vim-fugitive'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}
end)
