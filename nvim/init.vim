call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'airblade/vim-rooter'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'terryma/vim-multiple-cursors'

Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-syntax'
" Plug 'clojure-vim/async-clj-omni'

Plug 'cocopon/iceberg.vim'
Plug 'kaicataldo/material.vim'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'jdsimcoe/abstract.vim'
Plug 'tjammer/blayu.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'koirand/tokyo-metro.vim'
Plug 'dunstontc/vim-vscode-theme'

Plug 'itchyny/lightline.vim',

Plug 'simeji/winresizer'

Plug 'justinmk/vim-dirvish'

Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-startify'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ddollar/nerdcommenter'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'matze/vim-move', "{{{
	let g:move_key_modifier = 'C'
"}}}
Plug 'kshenoy/vim-signature'

" Clojure development
" Plug 'tpope/vim-fireplace'
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'liquidz/vim-iced-project-namespaces', {'for': 'clojure', 'on': 'IcedBrowseNamespace'}
Plug 'liquidz/vim-iced-function-list', {'for': 'clojure', 'on': 'IcedBrowseFunction'}
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
" Only in Neovim:
Plug 'radenling/vim-dispatch-neovim'
Plug 'clojure-vim/async-clj-highlight'

Plug 'bronson/vim-trailing-whitespace'

Plug 'w0rp/ale'

" Auto pair everything except for clj
Plug 'jiangmiao/auto-pairs', { 'for': ['ruby', 'javascript', 'sql', 'python']}

Plug 'JamshedVesuna/vim-markdown-preview'

" Handle all the languages, easily
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

set rtp+=/usr/local/opt/fzf

let g:fzf_buffers_jump = 1
" let g:fzf_layout = { 'window': 'belowright split enew', 'down': '~40%' }
let g:fzf_layout = { 'down': '~40%' }

if (has("termguicolors"))
  set termguicolors
endif

let g:material_theme_style = 'default'
let g:material_terminal_italics = 1
colorscheme material

set hidden
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
set synmaxcol=256
syntax sync minlines=30
set norelativenumber
set re=1
set ttyfast
set nocursorline
set nocursorcolumn

set foldmethod=syntax
set nofoldenable
let g:clojure_fold = 1

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
\   'clojure': ['joker','clj-kondo'],
\   'JSON': ['jq'],
\   'ruby': ['ruby'],
\   'SQL': ['sqlint']
\}

let g:deoplete#enable_at_startup = 1
" let g:deoplete#keyword_patterns = {}
" let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
call deoplete#custom#option('keyword_patterns', {
                        \   'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#+]*'
                        \})
call deoplete#custom#option('sources' , {
      \ '_' : ['tags', 'ale', 'buffer']
      \})
call deoplete#custom#option('auto_refresh_delay', 300)
call deoplete#custom#option('prev_completion_mode', 'false')

" Auto close preview window when deoplete completion is done
autocmd CompleteDone * silent! pclose!

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

let g:python_host_prog = '/Users/matthew.gradidge/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/matthew.gradidge/.pyenv/versions/neovim3/bin/python'

" Markdown preview configuration
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_github=1

" Iced vim default keybindings enable
let g:iced_enable_default_key_mappings = v:true

