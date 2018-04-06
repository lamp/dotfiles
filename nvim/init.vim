call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'

Plug 'tpope/vim-eunuch'

Plug 'terryma/vim-multiple-cursors'

Plug 'roxma/nvim-completion-manager'
Plug 'clojure-vim/async-clj-omni'

Plug 'cocopon/iceberg.vim'

Plug 'vim-airline/vim-airline', "{{{
  let g:airline#extensions#tabline#enabled         = 1
  let g:airline#extensions#tabline#left_sep        = ' '
  let g:airline#extensions#tabline#left_alt_sep    = ' '
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline#extensions#tabline#formatter       = 'unique_tail'
  " let g:airline#extensions#tabline#fnamemod        = ':p:.'
  " let g:airline#extensions#tabline#fnamecollapse   = 0
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9

  let g:airline#extensions#bufferline#enabled = 0
  let g:airline#extensions#eclim#enabled      = 0
  let g:airline#extensions#nrrwrgn#enabled    = 0
  let g:airline#extensions#capslock#enabled   = 0
  let g:airline#extensions#windowswap#enabled = 0

  let g:airline_theme             = 'serene'

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_left_sep = '›'
  let g:airline_right_sep = '‹'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_symbols.branch = 'B'
"}}}
Plug 'vim-airline/vim-airline-themes'

Plug 'simeji/winresizer'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "{{{
	map <leader>n :NERDTreeToggle<CR>
	let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
	let NERDTreeShowHidden=1
	let NERDTreeMinimalUI=1
	let NERDTreeWinPos="left"
	let NERDTreeWinSize=30
	let NERDTreeDirArrows=1
	let NERDTreeHijackNetrw = 1
"}}}

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'airblade/vim-gitgutter'

" Plug 'unblevable/quick-scope'

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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'bronson/vim-trailing-whitespace'

call plug#end()

set rtp+=/usr/local/opt/fzf

colorscheme iceberg

augroup AuNERDTreeCmd
	autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
	autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

	function s:CdIfDirectory(directory)
		let explicitDirectory = isdirectory(a:directory)
		let directory = explicitDirectory || empty(a:directory)

		if explicitDirectory
			exe "cd " . fnameescape(a:directory)
		endif

		" Allows reading from stdin
		" ex: git diff | mvim -R -
		if strlen(a:directory) == 0
			return
		endif

		if directory
			NERDTree
			wincmd p
			bd
		endif

		if explicitDirectory
			wincmd p
		endif
	endfunction

	" NERDTree utility function
	function s:UpdateNERDTree(...)
		let stay = 0

		if(exists("a:1"))
			let stay = a:1
		end

		if exists("t:NERDTreeBufName")
			let nr = bufwinnr(t:NERDTreeBufName)
			if nr != -1
				exe nr . "wincmd w"
				exe substitute(mapcheck("R"), "<CR>", "", "")
				if !stay
					wincmd p
				end
			endif
		endif
	endfunction

" autocmd vimenter * NERDTree
" autocmd VimEnter * if !argc() | NERDTree | endif
" autocmd BufEnter * if !argc() | NERDTreeMirror | endif
" let g:NERDTreeHijackNetrw = 1

set number
set nowrap

nnoremap <C-S> :FZF<CR>

autocmd Filetype ruby set softtabstop=2
autocmd Filetype ruby set sw=2
autocmd Filetype ruby set ts=2

let switchbuf='usetab'

" set lazyredraw
" set synmaxcol=128
syntax sync minlines=256

let g:clojure_maxlines = 1

let g:sexp_enable_insert_mode_mappings = 0
