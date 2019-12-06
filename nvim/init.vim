
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

Plug 'cocopon/iceberg.vim'
Plug 'sickill/vim-monokai'
Plug 'kaicataldo/material.vim'
Plug 'gregsexton/Muon'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'arcticicestudio/nord-vim'
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

" Autocompletion
Plug 'prabirshrestha/asyncomplete-tags.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" Clojure development
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'liquidz/vim-iced-project-namespaces', {'for': 'clojure', 'on': 'IcedBrowseNamespace'}
Plug 'liquidz/vim-iced-function-list', {'for': 'clojure', 'on': 'IcedBrowseFunction'}
" Clojure Autocompletion
Plug 'liquidz/vim-iced-asyncomplete', {'for': 'clojure'}

Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
" Only in Neovim:
Plug 'radenling/vim-dispatch-neovim'
Plug 'clojure-vim/async-clj-highlight'

Plug 'bronson/vim-trailing-whitespace'

Plug 'w0rp/ale'

" Auto pair everything except for clj
Plug 'jiangmiao/auto-pairs', { 'for': ['ruby', 'javascript', 'sql', 'python', 'rust']}

Plug 'JamshedVesuna/vim-markdown-preview'

" Handle all the languages, easily
Plug 'sheerun/vim-polyglot'
" Tags plugin
if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'prabirshrestha/asyncomplete-tags.vim'
endif


call plug#end()

set rtp+=/usr/local/bin/fzf

let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~40%' }

if (has("termguicolors"))
  set termguicolors
endif
set background=dark

let g:material_theme_style = 'ocean'
let g:material_theme_style = 'palenight'
let g:material_theme_style = 'default'
let g:material_theme_style = 'darker'

" let g:material_terminal_italics = 1
colorscheme material
" colorscheme monokai
" colorscheme muon

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
set relativenumber
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

let g:python_host_prog = "/Users/" + system('whoami') + "/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = "/Users/" + system('whoami') + "/.pyenv/versions/neovim3/bin/python"

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

" Markdown preview configuration
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_github=1

" Iced vim default keybindings enable
let g:iced_enable_default_key_mappings = v:true

" Asyncomplete config
" Rust
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif
" Ruby
if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif
