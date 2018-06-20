call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'airblade/vim-rooter'

Plug 'tpope/vim-eunuch'

Plug 'terryma/vim-multiple-cursors'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'clojure-vim/async-clj-omni'

Plug 'cocopon/iceberg.vim'

Plug 'itchyny/lightline.vim',

Plug 'simeji/winresizer'

Plug 'justinmk/vim-dirvish'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'airblade/vim-gitgutter'

" Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-startify'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ddollar/nerdcommenter'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'matze/vim-move', "{{{
	let g:move_key_modifier = 'C'
"}}}

Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'bronson/vim-trailing-whitespace'

Plug 'w0rp/ale'

call plug#end()

set rtp+=/usr/local/opt/fzf

let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
" Auto close preview window when deoplete completion is done
autocmd CompleteDone * silent! pclose!

colorscheme iceberg

set number
set nowrap

nnoremap <C-S> :FZF<CR>

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1

let switchbuf='usetab'

set lazyredraw
set synmaxcol=128
syntax sync minlines=256
set inccommand=nosplit

set foldmethod=syntax
set nofoldenable

" ALE config
let g:ale_completion_enabled = 0
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'clojure': ['joker']
\}

" lightline config
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'OldHope',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'gitbranch', 'filename', 'modified' ] ],
      \   'right': [['percent', 'lineinfo'],
      \             ['filetype']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
