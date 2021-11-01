
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'airblade/vim-rooter'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'kaicataldo/material.vim', { 'branch': 'main' }

Plug 'itchyny/lightline.vim',

Plug 'simeji/winresizer'

Plug 'lambdalisue/fern.vim'

Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-startify'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdcommenter'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'matze/vim-move', "{{{
  let g:move_key_modifier = 'C'
"}}}

" Rails/ruby
Plug 'tpope/vim-rails', {'for': 'ruby'}

" LSP
Plug 'neovim/nvim-lspconfig'
" Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Autocompletion for vim-iced
Plug 'lamp/cmp-iced'

" Clojure development
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'liquidz/vim-iced-project-namespaces', {'for': 'clojure', 'on': 'IcedBrowseNamespace'}
Plug 'liquidz/vim-iced-function-list', {'for': 'clojure', 'on': 'IcedBrowseFunction'}
Plug 'liquidz/vim-iced-kaocha', {'for': 'clojure'}

Plug 'liquidz/vim-iced-fern-debugger', {'for': 'clojure'}
" Clojure Autocompletion

Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}

Plug 'bronson/vim-trailing-whitespace'

" Auto pair
Plug 'cohama/lexima.vim'

Plug 'vim-test/vim-test'
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
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.4 }}
let g:fzf_preview_window = ['right:30%']

if (has("termguicolors"))
  set termguicolors
endif
set background=dark

let g:material_theme_style = 'ocean'

colorscheme material

set hidden
set number
set nowrap
set splitright

" FZF mappings
nnoremap <C-S> :FZF<CR>
nnoremap <leader>g :Ag<CR>
nnoremap <leader>k :Commands<CR>
nnoremap <leader>f :Fern . -drawer -toggle -reveal=%<CR>

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

let g:rooter_patterns = ['.git/']

let switchbuf='usetab'

set lazyredraw
set synmaxcol=256
syntax sync minlines=30
set relativenumber
" set re=1
set ttyfast
set nocursorline
set nocursorcolumn

set nofoldenable
set foldmethod=syntax
let g:clojure_fold = 1

let g:loaded_python_provider = 0
let g:python3_host_prog = "/usr/local/opt/python@3.9/bin/python3.9"

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

" Use neovim strategy for testing
let test#strategy = 'neovim'

" LSP config
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlight_references_enabled = 1

" LSP setup
lua <<EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end


local servers = { 'clojure_lsp', 'tsserver', 'rls', 'solargraph' }
local cmp = require'cmp'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clojure_lsp', 'tsserver', 'rls', 'solargraph' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" Autocomplete setup
set completeopt=menu,menuone,noselect
lua <<EOF
-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'iced' },
    }, {
      { name = 'buffer' },
    })
  })
EOF
