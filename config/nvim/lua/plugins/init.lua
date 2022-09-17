-- Bootstrap Packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

local present, packer = pcall(require, "packer")
if not present then
  return
end

-- Set up Packer
packer.init {
  auto_clean = true,
  compile_on_sync = true,
  git = {
    clone_timeout = 6000,
  },
  display = {
    working_sym = "ﲊ",
    error_sym = "✗ ",
    done_sym = " ",
    removed_sym = " ",
    moved_sym = "",
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

-- TODO: Add akinsho/bufferline.nvim (For buffer line)

packer.startup(function()
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"

  use "nvim-telescope/telescope.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use "norcalli/nvim-colorizer.lua"

  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/nvim-cmp"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"

  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"
  use "tpope/vim-commentary"
  use "tpope/vim-surround"

  use { "catppuccin/nvim", as = "catppuccin" }
  use "ellisonleao/gruvbox.nvim"
  use "ayu-theme/ayu-vim"
  use "navarasu/onedark.nvim"
end)

-- Start plugin configuration
local plugins = {
  "colorscheme",
  "telescope",
  "treesitter",
  "nvim_tree",
  "lualine",
  "toggleterm",
  "indent_blankline",
  "gitsigns",
  "colorizer",
  "mason",
  "lspconfig",
  "cmp",
}

for _, plugin in ipairs(plugins) do
  if not pcall(require, string.format("plugins.%s", plugin)) then
    print(string.format("Error: Loading %s failed", plugin))
  end
end
