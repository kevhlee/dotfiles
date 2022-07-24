-- Bootstrap Packer if necessary
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
		install_path })
end

require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'nvim-telescope/telescope-ui-select.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-commentary'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'joshdick/onedark.vim'
	use 'morhetz/gruvbox'
	use 'ayu-theme/ayu-vim'
	use 'romgrk/doom-one.vim'
	use 'chriskempson/vim-tomorrow-theme'
	use 'crivotz/nvim-colorizer.lua'
end)

require('plugins/treesitter')
require('plugins/telescope')
require('plugins/lualine')
require('plugins/gitsigns')
require('plugins/colorizer')
require('plugins/lsp')
