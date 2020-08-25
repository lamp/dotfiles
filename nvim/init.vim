
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

Plug 'kaicataldo/material.vim', { 'branch': 'main' }

Plug 'itchyny/lightline.vim',

Plug 'simeji/winresizer'

Plug 'justinmk/vim-dirvish'

Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-startify'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ddollar/nerdcommenter'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'matze/vim-move', "{{{
	let g:move_key_modifier = 'C'
"}}}
Plug 'kshenoy/vim-signature'

" Rails/ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

" Autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ncm2/ncm2-vim-lsp'
Plug 'ryanolsonx/vim-lsp-javascript'
Plug 'ncm2/ncm2-tagprefix'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-path'
Plug 'fgrsnau/ncm2-otherbuf'

" Clojure development
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'liquidz/vim-iced-project-namespaces', {'for': 'clojure', 'on': 'IcedBrowseNamespace'}
Plug 'liquidz/vim-iced-function-list', {'for': 'clojure', 'on': 'IcedBrowseFunction'}
Plug 'liquidz/vim-iced-kaocha'
" Clojure Autocompletion
Plug 'nbardiuk/vim-iced-ncm2'

Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
" Only in Neovim:
Plug 'radenling/vim-dispatch-neovim'

Plug 'bronson/vim-trailing-whitespace'

" Plug 'w0rp/ale'

" Auto pair everything except for clj
Plug 'jiangmiao/auto-pairs', { 'for': ['ruby', 'javascript', 'sql', 'python', 'rust']}

Plug 'JamshedVesuna/vim-markdown-preview'

" Handle all the languages, easily
Plug 'sheerun/vim-polyglot', "{{{
  let g:polyglot_disabled = ['elm']
"}}}
"
" Tags plugin
if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags', "{{{
    let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ },
      \ }
  "}}}
endif

" Elm
Plug 'elmcast/elm-vim'

call plug#end()

set rtp+=/usr/local/bin/fzf

let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = ''

if (has("termguicolors"))
  set termguicolors
endif
set background=dark

let g:material_theme_style = 'darker'

colorscheme material

set hidden
set number
set nowrap
set splitright

nnoremap <C-S> :FZF<CR>

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1
let g:rooter_cd_cmd="lcd"

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
" let g:ale_completion_enabled = 0
" let g:ale_set_highlights = 0
" " let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_delay = 50
" let g:ale_sign_column_always = 0
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'clojure': ['joker','clj-kondo'],
" \   'JSON': ['jq'],
" \   'ruby': ['ruby'],
" \   'SQL': ['sqlint']
" \}

let g:python_host_prog = "/Users/" . trim(system('whoami')) . "/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = "/Users/" . trim(system('whoami')) . "/.pyenv/versions/neovim3/bin/python"

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

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" LSP config
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlight_references_enabled = 1
" Rust
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'allowlist': ['rust'],
        \ })
endif
" Ruby
if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'allowlist': ['ruby'],
        \ })
endif

au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
      \ 'allowlist': ['javascript', 'javascript.jsx', 'javascriptreact'],
      \ })

if executable('clj-kondo')
  " in home directory
  " wget -o clj-kondo-lsp https://github.com/borkdude/clj-kondo/releases/download/v2020.07.29/clj-kondo-lsp-server-2020.07.29-standalone.jar
  au User lsp_setup call lsp#register_server({
    \ 'name': 'clj-kondo',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'java -jar ~/clj-kondo-lsp']},
    \ 'allowlist': ['clojure', 'clojurescript']
    \ })
endif
