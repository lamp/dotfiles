call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'airblade/vim-rooter'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" Plug 'tpope/v-projectionist'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'terryma/vim-multiple-cursors'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'clojure-vim/async-clj-omni'

" Plug 'cocopon/iceberg.vim'
Plug 'kaicataldo/material.vim'

Plug 'itchyny/lightline.vim',

Plug 'simeji/winresizer'

Plug 'justinmk/vim-dirvish'

" Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-startify'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ddollar/nerdcommenter'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'matze/vim-move', "{{{
	let g:move_key_modifier = 'C'
"}}}

" Clojure development
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
" Plug 'tpope/vim-salve'

Plug 'bronson/vim-trailing-whitespace'

Plug 'w0rp/ale'

call plug#end()

set rtp+=/usr/local/opt/fzf

let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': 'belowright split enew', 'down': '~40%' }

let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
" Auto close preview window when deoplete completion is done
autocmd CompleteDone * silent! pclose!

if (has("termguicolors"))
  set termguicolors
endif

colorscheme material
let g:material_theme_style = 'dark'
set background=dark

set number
set nowrap
set splitright

nnoremap <C-S> :FZF<CR>

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1

let switchbuf='usetab'

set lazyredraw
set synmaxcol=128
syntax sync minlines=30
set norelativenumber
set re=1
set ttyfast
set nocursorline
set nocursorcolumn
" set inccommand=nosplit

" set foldmethod=syntax
set nofoldenable

" ALE config
let g:ale_completion_enabled = 0
let g:ale_set_highlights = 0
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_delay = 50
let g:ale_sign_column_always = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'clojure': ['joker'],
\   'JSON': ['jq'],
\   'ruby': ['ruby'],
\   'SQL': ['sqlint']
\}

" lightline config
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'material_vim',
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
