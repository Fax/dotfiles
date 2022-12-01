
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'romgrk/doom-one.vim'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

Plug 'ggandor/leap.nvim'
"Plug 'SirVer/ultisnips'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'rafcamlet/nvim-luapad'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'Mofiqul/vscode.nvim'
 Plug 'romgrk/barbar.nvim'

Plug 'euclidianAce/BetterLua.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-docker', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}

" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.
Plug 'folke/tokyonight.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'OmniSharp/omnisharp-vim'
" Plug 'dense-analysis/ale'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'OrangeT/vim-csharp'
Plug 'nvim-lualine/lualine.nvim'
Plug 'rcarriga/nvim-notify'
" Plug 'ellisonleao/gruvbox.nvim'
Plug 'folke/which-key.nvim'
Plug 'APZelos/blamer.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
Plug 'numToStr/Comment.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'saecki/crates.nvim', {'tag':'v0.2.1'}
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-dap'
"Plug 'rust-lang/rust.vim'

call plug#end()
