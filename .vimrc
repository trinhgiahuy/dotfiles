" turn hybrid line numbers on
:set number relativenumber
:set nu rnu
"
" " turn hybrid line numbers off
:set nonumber norelativenumber
:set nonu nornu
"
" " toggle hybrid line numbers
:set number! relativenumber!
:set nu! rnu!


set autoindent

n for command mode
nnoremap <S-Tab> <<" 
" for insert mode
inoremap <S-Tab> <C-d>

"Remap for Esc insert mode to normal mode
inoremap ii <Esc>

"Remap Save in insert/normal/visual mode
inoremap <C-s> <C-\><C-o>:w<CR>
:nmap <C-s> :w<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>


" Move in insert mode like normal mode
inoremap <c-j> <down>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

" Go beging of line in insert mode
inoremap <C-i> <Home>

" Go ending of line in insert mode
inoremap <C-e> <End>


"Delete word after in normal mode
inoremap <C-q> <ESC>ldei

"====================================END OF MY CONFIG======================
" Sets how many lines of history VIM has to remember
set history=500
"
" " Enable filetype plugins
filetype plugin on
filetype indent on


" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

let mapleader = ","

nmap <leader>w :w!<cr>

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

set so=7

set wildmenu

set ruler

set cmdheight=1

set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase

set hlsearch

set incsearch

set lazyredraw

set magic

set showmatch

set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1

syntax enable

set regexpengine=0

if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

try
	colorscheme desert
catch
endtry

set background=dark


if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
"
" " Use Unix as the standard file type
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile


set expandtab

set smarttab

set shiftwidth=4
set tabstop=4

set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

map <space> /
map <C-space> ?
