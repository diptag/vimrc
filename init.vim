call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'simnalamburt/vim-mundo'
Plug 'kien/ctrlp.vim'

" Python plugins
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'numirias/semshi'

" Colorschemes
Plug 'zeis/vim-kolor'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'jacoborus/tender.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do':':UpdateRemotePlugins'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

let g:python3_host_prog = '/usr/bin/python3'

""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Go Configurations
""""""""""""""""""""""""""""""""""""""""""""""""
"let g:go_fmt_command = "goimports"
let g:go_term_mode = "split"
let g:go_term_height = 8

""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete Configurations
""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

""""""""""""""""""""""""""""""""""""""""""""""""
" ALE Configurations
""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
	\ 'python': ['yapf'],
	\}
let g:ale_fix_on_save = 1

""""""""""""""""""""""""""""""""""""""""""""""""
" Mundo Configurations
""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F6> :MundoToggle<CR>
"set undofile
"set undodir=~/.local/share/nvim/undo
"set undolevels=50

""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Configurations
""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
noremap <C-n> :NERDTreeToggle<CR>
" NERDTree auto open
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | wincmd p | ene | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"autocmd VimEnter * exe 'NERDTree' | wincmd p
" Automatically Close NERDTree on file close
function! CheckLeftBuffers()
	if tabpagenr('$') == 1
		let i = 1
		while i <= winnr('$')
			if getbufvar(winbufnr(i), '&buftype') == 'help' ||
			\ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
			\ exists('t:NERDTreeBufName') &&
			\   bufname(winbufnr(i)) == t:NERDTreeBufName ||
			\ bufname(winbufnr(i)) == '__Tag_List__'
				let i += 1
			else
				break
			endif
		endwhile
		if i == winnr('$') + 1
			qall
		endif
		unlet i
	endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP Configurations
""""""""""""""""""""""""""""""""""""""""""""""""
" Open file in new tab on <CR>
let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("e")': ['<c-v>'],
\ 'AcceptSelection("v")': ['<cr>', '<2-LeftMouse>'],
\ }

""""""""""""""""""""""""""""""""""""""""""""""""
" Airline Configurations
""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline_theme='ouo'
let g:airline_theme = 'angr'
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline_exclude_preview = 1

""""""""""""""""""""""""""""""""""""""""""""""""
" General Configuration
""""""""""""""""""""""""""""""""""""""""""""""""
" Change split position
set splitright
set splitbelow

" turn off search highlight with ,-<space>
nnoremap <leader><space> :nohlsearch<CR>

" Automatically update a file if it is changed externally
set autoread

" Height of the command bar
set cmdheight=2

set hlsearch	    " highlight search matches
set incsearch	    " search while characters are entered

" search is case-insensitive by default
"set ignorecase

" Show linenumbers
set number
set showcmd	" show last command in the bottom right

set ruler	" always show current position

" Line wrap (number of cols)
set wrap	    " wrap lines only visually
set linebreak	    " wrap only at valid characters
set textwidth=0	    " prevent vim from inserting linebreaks
set wrapmargin=0    "   in newly entered text


" show matching braces
match

set wildmenu	    " visual autocomplete for command menu

"""""""""""""""""""""""""""""""""""""""""""""""""
" Backups, Swap Files
"""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

set cursorline	" highlight current active line

colorscheme onehalfdark
"colorscheme kolor
"let g:kolor_inverted_matchparen=1
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""
" Text and Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""
" Use smart tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

set ai " Auto indent
set si " Smart indent

" modern backspace behavior
set backspace=indent,eol,start

" Set terminal mapping
nnoremap <silent> <leader>t :8sp<CR> <bar> :terminal<CR> <bar> :set nonumber<CR>

filetype indent on	" enable filetype specific indentation
