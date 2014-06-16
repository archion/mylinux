syntax on
" my settings
" vundle plugin manager, use :BundleInstall to install new plugin
"filetype on
filetype off
if has("unix")
	set rtp+=~/.vim/bundle/vundle/ 
	call vundle#rc()
else
	set rtp+=$VIM/vimfiles/bundle/vundle/ 
	call vundle#rc('$VIM/vimfiles/bundle/')
endif
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Align'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/emmet-vim'
Bundle 'taglist.vim'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
"Bundle 'joeytwiddle/sexy_scroller.vim'
" end
" powerline plugin
if or(has("gui_running"),has("unix"))
	let g:Powerline_symbols = 'fancy'
	set laststatus=2
	if has("unix")
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
	else
		set guifont=Consolas\ for\ Powerline\ FixedD:h12
	endif
	set encoding=utf-8
	" end
	" solve the problem in display chinese characters
	set langmenu=zh_CN.utf-8
	set fileencodings=ucs-bom,utf-8,cp936,big5,gb18030,euc-jp,euc-kr,latin1
	language messages zh_CN.utf-8
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	" end
	" set better looking
	set background=dark
	colorscheme solarized
	set t_Co=256
	hi Normal ctermbg=NONE
endif
set number
set nobackup
set noswapfile
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
" others
"set spell
set ignorecase
set nowrapscan
vnoremap < <gv
vnoremap > >gv
let mapleader=","
set autochdir
set tags=./tags;
" worksession
set sessionoptions+=unix,slash
set sessionoptions-=options
" hide gui menu and toolbar
" set guioptions-=m
" set guioptions-=T
" just for better fortran program
set smartindent 
set shiftwidth=4
set tabstop=4
let fortran_more_precise=1
let fortran_have_tabs=1
let fortran_do_enddo=1
let fortran_fold=1
let fortran_fold_conditionals=1
set foldmethod=syntax
set foldlevelstart=99
"set textwidth=130
set colorcolumn=132
" end
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>t :TlistToggle<CR>
nmap <C-b>n :bnext<CR>
nmap <C-b>p :bprev<CR>
" my key-map for fortran gnuplot in microsoft windows system
if !has("unix")
	nmap <F12> :w<cr>:silent !start cmd /k gfortran -g -Wall -Wtabs % -o %:r & echo ===============compile successed, run?==============& pause & %:r.exe & pause & exit<cr>
	nmap <M-F12> :w<cr>:silent !start cmd /k gfortran -g -Wall -Wtabs % -o %:r -llapack & echo ===============compile successed, run?==============& pause & %:r.exe & pause & exit<cr>
	nmap <C-F12> :w<cr>:silent !start cmd /k gfortran -g -Wall -Wtabs % -o %:r -fopenmp & echo ===============compile successed, run?==============& pause & %:r.exe & pause & exit<cr>
	nmap <M-C-F12> :w<cr>:silent !start cmd /k gfortran -g -Wall -Wtabs % -o %:r -llapack -fopenmp & echo ===============compile successed, run?==============& pause & %:r.exe & pause & exit<cr>
	nmap <S-F12> :silent !start cmd /k gdb %:r.exe<cr>
	nmap <C-P> :w<cr>:silent !start cmd /k gnuplot %<cr>
	nmap <C-G> :silent !start cmd /k cd /d %:h & git commit -a<cr>
endif
" autocommand
au BufNewFile,BufRead *.plt,*.gnuplot,*.dat set ft=gnuplot
