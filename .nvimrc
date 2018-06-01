if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'romainl/flattened'
  Plug 'scrooloose/nerdcommenter'
  Plug 'vim-scripts/Align'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'scrooloose/nerdtree'
  Plug 'mattn/emmet-vim'
  Plug 'majutsushi/tagbar'
  "Plug 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
  Plug 'rking/ag.vim'
  Plug 'racer-rust/vim-racer'
  Plug 'rust-lang/rust.vim'
  Plug 'xolox/vim-misc'
  Plug 'vim-scripts/lua.vim'
  Plug 'JuliaLang/julia-vim'
  Plug 'benekastah/neomake'
  Plug 'jiangmiao/auto-pairs'
  Plug 'carbonscott/vim-smartfold'
  Plug 'vim-scripts/renamer.vim'
  Plug 'vim-syntastic/syntastic'
  Plug 'lervag/vimtex'
call plug#end()

filetype plugin indent on
syntax enable

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


" support chinese charactor Align
let g:Align_xstrlen= 3

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

syntax on
set t_Co=256
set mouse=a
colorscheme flattened_dark

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,big5,gb18030,euc-jp,euc-kr,latin1
set title
set number
set relativenumber
set nobackup
set noswapfile
set omnifunc=syntaxcomplete#Complete
set ignorecase
set nowrapscan
set autochdir
"set tags=./tags;
set sessionoptions+=unix,slash
set sessionoptions-=options
set smartindent 
set shiftwidth=4
set tabstop=4
set nospell

let g:tagbar_sort = 0
" just for better fortran program
let fortran_more_precise=1
let fortran_have_tabs=1
let fortran_do_enddo=1
let fortran_fold=1
let fortran_fold_conditionals=1
"let fortran_fold_multilinecomments=1 "slow down vim when have large block of comment
set colorcolumn=132
set synmaxcol=256
"set textwidth=130

"lua
let g:lua_complete_omni = 1
let g:lua_check_syntax = 1

""set foldmethod=syntax  "may slow the vim
"set foldmethod=indent
set foldlevelstart=99
set foldmethod=manual
let $LANGUAGE = 'c'

" latex
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-verbose',
    \   '-pdf',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options
			\ = '--unique --instance latex @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique --instance latex'
let g:vimtex_compiler_progname = 'nvr'


let mapleader=","
let maplocalleader=","
let g:agprg = "ag --nogroup --nocolor --column"
vnoremap < <gv
vnoremap > >gv
nmap <leader>d :NERDTreeToggle<CR>
nmap <C-b>n :bnext<CR>
nmap <C-b>p :bprev<CR>
nmap mk :Neomake!<CR>
nmap cp :cp<CR>
nmap cn :cn<CR>
nmap <ESC><ESC> :nohl<CR>
let g:neomake_open_list = 2
let g:neomake_verbose = 1
let g:neomake_list_height = 4

" tagbar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_type_tex = {
			\ 'ctagstype' : 'latex',
			\ 'kinds'     : [
			\ 's:sections',
			\ 'g:graphics:0:0',
			\ 'l:labels',
			\ 'r:refs:1:0',
			\ 'p:pagerefs:1:0'
			\ ],
			\ 'sort'    : 0,
			\ }
let g:tagbar_type_pandoc = {
			\ 'ctagstype' : 'markdown',
			\ 'kinds' : [
			\ 'h:Heading_L1',
			\ 'i:Heading_L2',
			\ 'k:Heading_L3'
			\ ]
			\ }

" racer 
set hidden
"let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

"" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
"let g:syntastic_rust_rustc_exe = 'cargo check'
"let g:syntastic_rust_rustc_fname = ''
"let g:syntastic_rust_rustc_args = '--'
"let g:syntastic_rust_checkers = ['rustc']
"map <leader>s :SyntasticToggleMode<CR>


" horizontal scroll
set sidescroll=1
set sidescrolloff=15
map <silent><expr> <C-S> ':set wrap! go'.'-+'[&wrap]."=b\r"
set splitbelow
set splitright

nmap <A-r> :5sp term://./%:r.out<cr>
tnoremap <Esc> <C-\><C-n>

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
au BufNewFile,BufRead *.plt,*.gnuplot,*.dat nmap <leader>p :e<cr> :w<cr> <C-w>j :silent !plot %:r.dat 2>/tmp/ploterr<cr>
"autocmd FileType tex,pandoc setlocal spell spelllang=en_us
au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow
"autocmd! BufWritePost * Neomake!

highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
"autocmd FileType tex setlocal spell spelllang=en_us,cjk
