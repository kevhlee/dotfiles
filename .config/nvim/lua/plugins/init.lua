-- Bootstrap Packer
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
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

packer.startup(function()
  use "wbthomason/packer.nvim"

  -- Search
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"

  -- File
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "tpope/vim-commentary"
  use "nvim-lualine/lualine.nvim"

  -- Highlighting
  use "nvim-treesitter/nvim-treesitter"
  use "norcalli/nvim-colorizer.lua"

  -- LSP
  use "williamboman/mason.nvim"
  use "neovim/nvim-lspconfig"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"

  -- Themes
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "dracula/vim", as = "dracula" }
  use "romgrk/doom-one.vim"
  use "morhetz/gruvbox"
  use "joshdick/onedark.vim"
  use "chriskempson/vim-tomorrow-theme"
end)

-- Start plugin configuration
require("plugins.colorscheme")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.colorizer")
require("plugins.mason")
