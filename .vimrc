" Vundle
filetype off
if has("unix")
	set rtp+=~/.vim/bundle/Vundle.vim/ 
	call vundle#begin()
else
	set rtp+=$VIM/vimfiles/bundle/Vundle.vim/ 
	call vundle#begin('$VIM/vimfiles/bundle/')
endif
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Align'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'taglist.vim'
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'rking/ag.vim'
Plugin 'phildawes/racer'
"Plugin 'LanguageTool'
Plugin 'rust-lang/rust.vim'
call vundle#end()
filetype plugin indent on

" airline
if !exists('g:airline_symbols')	
	let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled=0
"let g:airline#extensions#tabline#enabled = 1
set laststatus=2

if or(has("gui_running"),has("unix"))
	if has("unix")
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
	else
		set guifont=Consolas\ for\ Powerline\ FixedD:h12
	endif

	" solve the problem in display chinese characters
	set langmenu=zh_CN.utf-8
	language messages zh_CN.utf-8
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	" hide gui menu and toolbar
	" set guioptions-=m
	" set guioptions-=T
endif

let g:solarized_termcolors=256
let g:solarized_termtrans=0
set t_Co=256
colorscheme solarized
"colorscheme darkblue
set background=dark
syntax on

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,big5,gb18030,euc-jp,euc-kr,latin1
set title
set number
set nobackup
set noswapfile
set omnifunc=syntaxcomplete#Complete
set ignorecase
set nowrapscan
set autochdir
set tags=./tags;
set sessionoptions+=unix,slash
set sessionoptions-=options
set smartindent 
set shiftwidth=4
set tabstop=4

" just for better fortran program
let fortran_more_precise=1
let fortran_have_tabs=1
let fortran_do_enddo=1
let fortran_fold=1
let fortran_fold_conditionals=1
let fortran_fold_multilinecomments=1
set colorcolumn=132
"set textwidth=130

"set foldmethod=syntax  "may slow the vim
set foldmethod=indent
set foldlevelstart=99
"set foldmethod=manual
let $LANGUAGE = 'c'

" latex
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats = 'dvi'
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $* '
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi '
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps ; killall -SIGHUP llpp'
let g:Tex_ViewRule_pdf = 'llpp'
let g:Tex_IgnoredWarnings =
			\'Underfull'."\n".
			\'Overfull'."\n".
			\'specifier changed to'."\n".
			\'You have requested'."\n".
			\'Missing number, treated as zero.'."\n".
			\'There were undefined references'."\n".
			\'Latex Warning:'."\n".
			\'Citation %.%# undefined'
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
let tlist_make_settings  = 'make;m:makros;t:targets'

let mapleader=","
let g:agprg = "ag --nogroup --nocolor --column"
vnoremap < <gv
vnoremap > >gv
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>t :TlistToggle<CR>
nmap <C-b>n :bnext<CR>
nmap <C-b>p :bprev<CR>
nmap mk :make<CR>
nmap cp :cp<CR>
nmap cn :cn<CR>
nmap <ESC><ESC> :nohl<CR>

" racer 
set hidden
let g:racer_cmd = "/usr/bin/racer"
let $RUST_SRC_PATH= expand("~/.multirust/src")

" horizontal scroll
set sidescroll=1
set sidescrolloff=15
map <silent><expr> <C-S> ':set wrap! go'.'-+'[&wrap]."=b\r"

"languagetool
"let g:languagetool_jar = "/usr/share/java/languagetool/languagetool-commandline.jar"
"let g:languagetool_lang = "en-US"

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
au BufNewFile,BufRead *.plt,*.gnuplot set ft=gnuplot
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
"au BufNewFile,BufRead *.plt,*.gnuplot,*.dat nmap <leader>p :w<cr> <C-w>j :!plot %:r.dat<cr> :call Close()<cr>
au BufNewFile,BufRead *.plt,*.gnuplot,*.dat nmap <leader>p :w<cr> <C-w>j :!plot %:r.dat<cr>
autocmd FileType tex,pandoc setlocal spell spelllang=en_us
au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow
"au BufReadPre * colorscheme solarized
"au BufReadPre * set background=dark

function Close()
	if winnr()==1
		q
	endif
endfunction
