"========================================== " Author:  wklken
" Version: 1.0
" Email: wdw828@gmail.com
" ReadMe: README.md
" Last_modify: 2016-05-23
" Sections:
"       -> Initial Plugin
"       -> General Settings
"       -> Display Settings
"       -> FileEncode Settings
"       -> Others
"       -> HotKey Settings
"       -> FileType Settings
"       -> Theme Settings
"
"==========================================

"==========================================
" Initial Plugin
"==========================================

" change leader
" the value of mapleader is used at the moment when mapping is defined
" changing mapleader after that has no effect
" the default value of mapleader is \
let mapleader = ','
let g:mapleader = ','

" syntax highlight
syntax on

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
	source ~/.vimrc.bundles
endif

" read the settings for cscope
"source ~/.cscope_map.vim

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

"==========================================
" General Settings
"==========================================

" cscope settings begin
"if has("cscope")
"    set csprg=/usr/bin/cscope
"    set csto=0
"    set cst
"    set nocsverb
"    " add any database in current directory
"        if filereadable("cscope.out")
"                 cs add cscope.out
"                         " else add database pointed to by environment
"                             elseif $CSCOPE_DB != ""
"        cs add $CSCOPE_DB
"    endif
"endif

"set nohlsearch
" cscope settings end

" font and size
"set guifont=Monaco:h20


" history size
set history=2000

" test the type of file
" filetype on
"deploy different indent according to the type of file
filetype indent on
"enable plugins
filetype plugin on
"enable completation automatically
filetype plugin indent on

set autoread          " auto read after the file saved
set shortmess=atI       " remove the charity prompt

" back up to another place
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

" canceal backup
set nobackup

" close swap file
set noswapfile

"create undo file
if has('persistent_undo')
	set undolevels=1000         " How many undos
	set undoreload=10000        " number of lines to save for undo
	set undofile                " So is persistent undo ...
	set undodir=/tmp/vimundo/
endif

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

"highlight current line
"set cursorcolumn
set cursorline          "highlight current line

" add the indent line for different level of code indentation
"set list lcs=tab:\|\ 
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

" show content of file at screen after close vim
"set t_ti= t_te=

"set mouse-=a             " disable mouse
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing

"set selection=exclusive
set selection=inclusive
set selectmode=mouse,key

" No annoying sound on errors
set title                " change the terminal's title
"set novisualbell         " don't beep
"set noerrorbells         " don't beep
set t_vb=
set tm=500

" Remember info about open buffers on close"
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==========================================
" Display Settings
"==========================================
"
"show current line number and  column number
set ruler
"show the inputing command at status line
set showcmd
"show the mode of vim at corner of leftbottom
set showmode

" keep the minimum number of lines when move cursor
set scrolloff=15

" set winwidth=79

" the height of command line( default is 1, here is set to 2)
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

"show line number
set number

"cancel wrap
"set nowrap

"highlight and jump to paired brackets
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

"highlight the search result
set hlsearch
"start incremental search mode: searching while inputing
set incsearch
"ignore upper case and lower case while searching
set ignorecase
" sensitive for at least one capitalized letter
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
"line fold
set foldenable

"method of fold
" manual    manually fold
" indent    fold by indent
" expr      fold by expression
" syntax    fold by syntax
" diff      fold for unchanged file
" marker    fold by marks, the default is {{{ and  }}}
set foldmethod=indent
set foldlevel=100

" code folder hotkey
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
	if g:FoldMethod == 0
		exe "normal! zM"
		let g:FoldMethod = 1
	else
		exe "normal! zR"
		let g:FoldMethod = 0
	endif
endfun

"indent settings
set smartindent   " Smart indent
set autoindent    " start auto indent
" never add copyindent, case error   " copy the previous indentation on autoindenting

" tab settings
set tabstop=4     "width of one tap, equals to the number of space
set shiftwidth=4  "corresponding number of indent for one indent
set softtabstop=4 "delete 4 spaces when backspace
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
"set expandtab		" convert <tab> to <space>
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" increase/decrease number with decimal
set nrformats=

" relative number of a line, we can use nj, nk to jump the line we want
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
"
" absolute line number at insert mode and relative line number at normal mode
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber number
	else
		set relativenumber
	endif
endfunc

" enable/disable relative line number
nnoremap <C-n> :call NumberToggle()<CR>

" custimize color for special symbles
autocmd FileType * call <SID>def_base_syntax()
function! s:def_base_syntax()
	syntax match commonOperator "\(+\|=\|-\|\^\|\*\|>\|<\|?\|:\|&\)"
	syntax match baseDelimiter ","
	syntax match baseDelimiter ":"
	hi link commonOperator Operator
	hi link baseDelimiter Special
endfunction


"==========================================
" FileEncode Settings
"==========================================
"set encoding is UTF-8
set encoding=utf-8

" automatically test encoding, and try follows
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030

" only take effect at normal mode
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" wrap no need to wait until 'space' when the value of unicode is greater than
" 255
set formatoptions+=m
" no sapce when merge two lines of Chinese
set formatoptions+=B



"==========================================
" others settings
"==========================================
" automatically load vimrc after modified in windows
autocmd! bufwritepost _vimrc source %

"automatically load vimrc after modified in linux
autocmd! bufwritepost .vimrc source %

"settings for auto completation
set completeopt=longest,menu
"finish operation automatically at incremental mode
set wildmenu
" close compatible mode
" be improved, required
"set nocompatible

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

"close preview windows after leave insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" enter to select
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" behavior of navigation button
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"==========================================
" HotKey Settings self defination
"==========================================

"redefine for some important keys

"close <left><right><up><down>
"map <Left> <Nop>
"map <Right> <Nop>
"map <Up> <Nop>
"map <Down> <Nop>

"Treat long lines as break lines (useful when moving around in them)
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" F1 disable F1
" F2 close line number
" F3 show print characters
" F4 switch to wrap
" F5 switch for paste_mode
" F6 syntax on and off to accelerate the load of big file

" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"

" F2 to open/close line number
function! HideNumber()
	if(&relativenumber == &number)
		set relativenumber! number!
	elseif(&number)
		set number!
	else
		set relativenumber!
	endif
	set number?
endfunc

" hide line number
nnoremap <F2> :call HideNumber()<CR>
" show line end symble, it is '$' in linux
nnoremap <F3> :set list! list?<CR>
" cancel highlight of search results
nnoremap <F4> :set nohlsearch!<CR>
"nnoremap <F4> :set wrap! wrap?<CR>
nnoremap <F5> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

"set paste
set pastetoggle=<F6>            "    when in insert mode, press <F5> to go to
"    paste mode, where you can paste mass data
"    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste


" fuzzy input
command! WQ wq
command! W w
command! Q q


"Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H ^
noremap L $


"Map ; to : and save a million keystrokes
" ex mode commands made easy
"nnoremap ; :

" incremental mode
" ctrl - a: start of a line
" ctrl - e: end of a line
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" search related

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /

" Use sane regexes"
"nnoremap / /\v
"vnoremap / /\v

" hot key for replace
"nnoremap <c-r> :%s/

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" switch # *
nnoremap # *
nnoremap * #

" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

" no highlight in search
noremap <silent><leader>/ :nohls<CR>

" --------tab/buffer

"Use arrow key to change buffer"
" :b1 :b2   :bf :bl
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
noremap <left> :bp<CR>
noremap <right> :bn<CR>


" tab
" TODO: ctrl + n
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim
"map <C-2> 2gt
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>


" new tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" TODO:
" nnoremap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :tabnext<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>

" in normal mode: switch among tags
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
vnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()


"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

" auto jump to end of select
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" select all
map <Leader>sa ggVG

" select block/paragraph
nnoremap <leader>v V`}

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" kj for Esc
inoremap kj <Esc>

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

"Jump to start and end of line using the home row keys
"nmap t o<ESC>k
"nmap T O<ESC>j

" Quickly close the current window
nnoremap <leader>q :q<CR>
" Quickly save the current file
nnoremap <leader>w :w<CR>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
"nnoremap ' `
"nnoremap ` '

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Quickly edit/reload the vimrc file
"nmap <silent> <leader>ev :e $MYVIMRC<CR>
"nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Automatically set paste mode in Vim when pasting in insert mode
function! WrapForTmux(s)
	if !exists('$TMUX')
		return a:s
	endif

	let tmux_start = "\<Esc>Ptmux;"
	let tmux_end = "\<Esc>\\"

	return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"==========================================
" FileType Settings
"==========================================

" general settings for Python, for example no tab
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd


"delete extra space while saving python file
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


"define a function of AutoSetFileHead, to insert the header file automatically
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
	"if the type of a file is .sh
	if &filetype == 'sh'
		call setline(1, "\#!/bin/bash")
	endif

	"if the type of a file is python
	if &filetype == 'python'
		call setline(1, "\#!/usr/bin/env python")
		call append(1, "\# encoding: utf-8")
	endif

	normal G
	normal o
	normal o
endfunc


" set some keyword to highlight
if has("autocmd")
	" Highlight TODO, FIXME, NOTE, etc.
	if v:version > 701
		autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
		autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
	endif
endif

"==========================================
" Theme Settings
"==========================================

" Set extra options when running in GUI mode
if has("gui_running")
	set guifont=Monaco:h14
	if has("gui_gtk2")   "GTK2
		set guifont=Monaco\ 12,Monospace\ 12
	endif
	set guioptions-=T
	set guioptions+=e
	set guioptions-=r
	set guioptions-=L
	set guitablabel=%M\ %t
	set showtabline=1
	set linespace=2
	set noimd
	set t_Co=256
endif

" allows cursor change in tmux mode
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" theme
set background=dark
set t_Co=256
"colorscheme delek
"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Bright
colorscheme molokai
"colorscheme solarized
"colorscheme desert

hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal highlight SpellLocal term=underline cterm=underline

" auto generate ctags file when buffer write
function! DelTagOfFile(file)
	let fullpath=a:file
	let cwd=getcwd()
	let tagfilename=cwd . "/tags"
	let f = substitute(fullpath, cwd . "/", "", "")
	let f = escape(f, './')
	let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
	let resp = system(cmd)
endfunction

function! UpdateTags()
	let f= expand("%:p")
	let cwd = getcwd()
	let tagfilename = cwd . "/tags"
	let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
	call DelTagOfFile(f)
	let resp = system(cmd)
endfunction
autocmd BufWritePost *.cpp,*.h,*.c,*.cc call UpdateTags()
