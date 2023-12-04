"""
""" ---- Globals ----
"""

let g:mapleader=' '
let g:maplocalleader=' '

let g:netrw_banner=0
let g:netrw_fastbrowse=0

"""
""" ---- Options ----
"""

set autoindent
set background=dark
set noerrorbells
set expandtab
set history=1000
set nohlsearch
set incsearch
set number
set relativenumber
set scrolloff=8
set shiftwidth=4
set smartindent
set splitbelow
set splitright
set noswapfile
set tabstop=4
set termguicolors
set undodir=~/.vim/undodir
set undofile
set nowrap

set rtp+=/usr/local/opt/fzf
set laststatus=2

"""
""" ---- Plugins ----
"""

call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'

call plug#end()

"""
""" ---- Keymaps ----
"""

nmap <leader>ff <cmd>Files<cr>
nmap <leader>fg <cmd>Rg<cr>
nmap <leader>fb <cmd>Buffers<cr>
nmap <leader>fk <cmd>Map<cr>

nmap <C-n> <cmd>Explore<cr>
