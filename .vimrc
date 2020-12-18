set nocompatible              " be iMproved, required
""VUNDLE"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
"
"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

"Initial Settings"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set encoding=utf-8
set background=dark               " dark background
set timeoutlen=1000 ttimeoutlen=0 " set a 1 sec timout for map leader
set backspace=indent,eol,start    " make backspace work
set shell=/bin/bash
set visualbell

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

" " set 'updatetime' to 15 seconds when in insert mode
" au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
" au InsertLeave * let &updatetime=updaterestore
" " automatically leave insert mode after 'updatetime' milliseconds of inaction
" au CursorHoldI * stopinsert

"Maps"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
"Window navigation
nnoremap <tab>              <c-w>
nnoremap <tab>q             <c-w>w
nnoremap <tab><up>          <c-w>j
nnoremap <tab><down>        <c-w>k
nnoremap <tab><left>        <c-w>h
nnoremap <tab><right>       <c-w>l
"Tab navigation
nnoremap <leader><tab>      :tabn<cr>
nnoremap <leader><s-tab>    :tabp<cr>
"Buffer navigation
imap     OA               <esc>kli
imap     OB               <esc>jli
imap     OC               <esc>lli
imap     OD               <esc>i
imap     <c-h>              <left>
imap     <c-j>              <down>
imap     <c-k>              <up>
imap     <c-l>              <right>
nnoremap K                  H
nnoremap J                  L
nnoremap H                  <home>
nnoremap L                  <end>
nnoremap <c-k>              <pageup>H
nnoremap <c-j>              <pagedown>H
vnoremap K                  H
vnoremap J                  L
vnoremap H                  <home>
vnoremap L                  <end>
nnoremap <leader>M          :set mouse=a<cr>
nnoremap <leader>m          :set mouse=""<cr>
"Comment/Uncomment
nnoremap <leader>c          I//<esc>
nnoremap <leader>u          ^dw
nnoremap <leader>b          O/*<esc>
nnoremap <leader>e          o*/<esc>
"Misc
nnoremap <leader>N          :set relativenumber!<cr>
nnoremap <leader>T          :set expandtab!<cr>:set expandtab?<cr>
nnoremap <leader>t          :%s/\t/    /g<cr>
nnoremap <leader>p          :set paste!<cr>
nnoremap <leader>w          mc:%s/  *$//ge<cr>'c:noh<cr>
nnoremap <leader>n          :noh<cr>
nnoremap <leader><cr>       o<esc>k
nnoremap <leader>{          o{<cr>}<esc>O
nnoremap S                  :%s//gc<left><left><left>
nnoremap <leader>-          i-<esc>vy79p<home>R
nnoremap <leader>=          i=<esc>vy79pyypO<tab>
nnoremap <leader>s          :source ~/.vimrc<cr>:noh<cr>
nnoremap <leader>i          ii<esc>==s
nnoremap cd                 /\%<c-r>=virtcol(".")<cr>v\S<cr>:noh<cr>
nnoremap cu                 ?\%<c-r>=virtcol(".")<cr>v\S<cr>:noh<cr>

"Display""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hlsearch            " Highlight search
set hidden              " Hide buffers when they are abandoned
set laststatus=2        " Always show the status bar with mode, file name, etc.
set wrap                " Show long lines as multipule lines
set scrolloff=5         " Whenever possible, show +/-10 lines around cursor

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set splitbelow          " sp creates below
set splitright          " vsp creates to the right

set t_Co=256            " Pretty Colors

highlight comment ctermfg=lightblue
highlight include ctermfg=lightmagenta

"Line number options
set number              " Show line numbers
set numberwidth=3       " Make room for a three digit line number

"80 Character line
set colorcolumn=81      " Colors column 81
"set tw=80               " Automatically newlines at a new word that passes 80
hi ColorColumn ctermbg=8
hi LineNr ctermfg=15 ctermbg=0

"Highlight extra whitespace as red
" highlight ExtraWhitespace ctermbg=white guibg=white
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=white guibg=white
" match ExtraWhitespace /\s\+\%#\@<!$/

"Formatting"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tabbing
set expandtab
set shiftround
set nosmartindent
set autoindent
set smarttab

set tabstop=2           " Tab length of 4 characters
set shiftwidth=2        " Normal mode tabbing to match ^
set softtabstop=2

set list
set listchars=tab:>-    " Show tabs as >-

"C++ Format
"let g:airline_powerline_fonts = 1
"let mapleader=","
"autocmd FileType c,cpp,objc,cc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc,cc vnoremap <buffer><Leader>cf :ClangFormat<CR>
"autocmd FileType c,cpp,objc,cc nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd Filetype c,cpp,objc,cc set cindent
"command CF ClangFormat

