call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'airblade/vim-rooter'

Plug 'tpope/vim-eunuch'

Plug 'terryma/vim-multiple-cursors'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'clojure-vim/async-clj-omni'
Plug 'fszymanski/deoplete-emoji'

Plug 'cocopon/iceberg.vim'

Plug 'vim-airline/vim-airline', "{{{

  let g:airline_theme             = 'violet'
  let g:airline#extensions#default#layout = [
      \ [ 'a', 'c' ],
      \ [ 'z' ]
  \ ]
  let g:airline_section_z = '%3p%% %l'
  let g:airline_powerline_fonts = 1
  let g:airline_extensions = []
  let g:airline_highlighting_cache = 1
"}}}
Plug 'vim-airline/vim-airline-themes'

Plug 'simeji/winresizer'

" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "{{{
"   map <leader>n :NERDTreeToggle<CR>
"   let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
"   let NERDTreeShowHidden=1
"   let NERDTreeMinimalUI=1
"   let NERDTreeWinPos="left"
"   let NERDTreeWinSize=30
"   let NERDTreeDirArrows=1
"   let NERDTreeHijackNetrw = 1
" "}}}
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

call plug#end()

set rtp+=/usr/local/opt/fzf

let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
" Auto close preview window when deoplete completion is done
autocmd CompleteDone * silent! pclose!

colorscheme iceberg

" augroup AuNERDTreeCmd
"         autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
"         autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

"         function s:CdIfDirectory(directory)
"                 let explicitDirectory = isdirectory(a:directory)
"                 let directory = explicitDirectory || empty(a:directory)

"                 if explicitDirectory
"                         exe "cd " . fnameescape(a:directory)
"                 endif

"                 " Allows reading from stdin
"                 " ex: git diff | mvim -R -
"                 if strlen(a:directory) == 0
"                         return
"                 endif

"                 if directory
"                         NERDTree
"                         wincmd p
"                         bd
"                 endif

"                 if explicitDirectory
"                         wincmd p
"                 endif
"         endfunction

"         " NERDTree utility function
"         function s:UpdateNERDTree(...)
"                 let stay = 0

"                 if(exists("a:1"))
"                         let stay = a:1
"                 end

"                 if exists("t:NERDTreeBufName")
"                         let nr = bufwinnr(t:NERDTreeBufName)
"                         if nr != -1
"                                 exe nr . "wincmd w"
"                                 exe substitute(mapcheck("R"), "<CR>", "", "")
"                                 if !stay
"                                         wincmd p
"                                 end
"                         endif
"                 endif
"         endfunction

" autocmd vimenter * NERDTree
" autocmd VimEnter * if !argc() | NERDTree | endif
" autocmd BufEnter * if !argc() | NERDTreeMirror | endif
" let g:NERDTreeHijackNetrw = 1

set number
set nowrap

nnoremap <C-S> :FZF<CR>


" autocmd Filetype ruby set softtabstop=2
" autocmd Filetype ruby set sw=2
" autocmd Filetype ruby set ts=2
" set tabstop=2 softtabstop=2 shiftwidth=2 
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

let switchbuf='usetab'

set lazyredraw
set synmaxcol=128
syntax sync minlines=256
set inccommand=nosplit

" let g:clojure_maxlines = 1

set foldmethod=syntax
set nofoldenable
