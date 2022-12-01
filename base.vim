
" =Basics=
nnoremap <Space> <Nop>
let mapleader = ","
map <Space> <Leader>
colorscheme doom-one
set background=dark
set termguicolors
"set number


nnoremap c "_c
set nocompatible
if !exists('g:syntax_on') | syntax enable | endif
set rnu
nnoremap <silent> <A-Down> :move +1<cr>
nnoremap <silent> <A-Up> :move -2<cr>
" remember: spaces ARE characters, so <Esc> :move and <Esc>:move are 2 different commands
inoremap <silent> <A-Down> <Esc>:move +1 <cr>i
inoremap <silent> <A-Up> <Esc>:move -2<cr>i

vnoremap <silent> <A-Down> :move '>+1<cr>gv
vnoremap <silent> <A-Up>  :move '<-2<cr>gv


filetype indent plugin on
syntax on
set backspace=indent,eol,start
set shiftwidth=4
set softtabstop=-1
set tabstop=8
set textwidth=80
set title
set go=a
set mouse+=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set hlsearch
set incsearch
set laststatus=2
set noruler
set noshowmode
set signcolumn=yes
set updatetime=1000
set wildmode=longest,list,full
set completeopt=menuone,noinsert,noselect
set timeoutlen=500
"set hidden
set ignorecase
set smartcase
" =Customs=
