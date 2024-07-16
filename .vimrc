set nocompatible              " be iMproved, required

" Initial Settings""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on         " use filetype settings
set encoding=utf-8
set background=dark               " dark background
set timeoutlen=1000 ttimeoutlen=0 " set a 1 sec timout for map leader
set backspace=indent,eol,start    " make backspace work
set shell=/bin/bash
set noesckeys
set noerrorbells 

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

" " set 'updatetime' to 15 seconds when in insert mode
" au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
" au InsertLeave * let &updatetime=updaterestore
" " automatically leave insert mode after 'updatetime' milliseconds of inaction
" au CursorHoldI * stopinsert
"

" Vim Native Package Manager""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd YouCompleteMe
let g:ycm_global_ycm_extra_conf = '/home/k99vivek/.vim/pack/YouCompleteMe/opt/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

" Formatting""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabbing
set expandtab
set shiftround
set nosmartindent
set autoindent

set tabstop=2           " Tab length of 2 characters
set shiftwidth=2        " Normal mode tabbing to match ^
set softtabstop=2
set smarttab

set list
set listchars=tab:>-    " Show tabs as >-

" C-Style Language Specific Formatting
autocmd Filetype c,cpp,objc,cc set cindent tabstop=2 shiftwidth=2

" Python Specific Formatting
autocmd Filetype py set tabstop=2 shiftwidth=2

" Matlab Formatting
autocmd Filetype m set tabstop=2 shiftwidth=2

" Maps""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
" Window navigation
nnoremap <tab>              <c-w>
nnoremap <tab>q             <c-w>w
nnoremap <tab><up>          <c-w>j
nnoremap <tab><down>        <c-w>k
nnoremap <tab><left>        <c-w>h
nnoremap <tab><right>       <c-w>l
" Tab navigation
nnoremap <leader><tab>      :tabn<cr>
nnoremap <leader><s-tab>    :tabp<cr>
" Buffer navigation
"imap     OA               <esc>kli
"imap     OB               <esc>jli
"imap     OC               <esc>lli
"imap     OD               <esc>i
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
nnoremap <leader>'          '[
nnoremap <leader>M          :set mouse=a<cr>
nnoremap <leader>m          :set mouse=""<cr>
" Comment/Uncomment
nnoremap <leader>c          I//<esc>
nnoremap <leader>u          ^dw
nnoremap <leader>b          O/*<esc>
nnoremap <leader>e          o*/<esc>
" Misc
nnoremap <leader>q          :mks!<cr>:wqa<cr>
nnoremap <leader>s          :source ~/.vimrc<cr>:noh<cr>
                            " Source .vimrc to easily implement changes
nnoremap S                  :%s//gc<left><left><left>
                            " Search and Replace, whole file, ask first
nnoremap <leader>N          :set relativenumber!<cr>
                            " Sets line numbers to be relative to current line
nnoremap <leader>T          :set expandtab!<cr>:set expandtab?<cr>
                            " Toggle tab expansion
nnoremap <leader>t          :%s/\t/    /g<cr>
                            " Swap tab characters with four spaces
vnoremap <leader>c          :w !clip.exe<cr>q
                            " Send to system clipboard on WSL
nnoremap <leader>p          :set paste!<cr>
                            " Toggle paste mode
nnoremap <leader>w          m':%s/  *$//ge<cr>'':noh<cr>
                            " Eliminate trailing whitespace
nnoremap <leader>n          :noh<cr>
                            " Stop highlighting (e.g. after a search)
nnoremap <leader>f          :YcmCompleter FixIt<cr>
                            " Try to YCM fix on the current line
nnoremap <leader><cr>       o<esc>k
                            " Add an empty line without leaving normal mode
nnoremap <leader>-          i-<esc>vy79p<home>R
                            " Subheader for .txt notes
nnoremap <leader>=          i=<esc>vy79pyypO<tab>
                            " Header for .txt notes
inoremap {<cr>              {<cr>}<esc>O
                            " Uses auto indenting to create a new code block

" Display"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hlsearch            " Highlight search
set hidden              " Hide buffers when they are abandoned
set laststatus=2        " Always show the status bar with mode, file name, etc.
set wrap                " Show long lines as multipule lines
set scrolloff=5         " Whenever possible, show N lines around cursor
set t_Co=256            " Pretty Colors

"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set splitbelow          " sp creates below
set splitright          " vsp creates to the right

" Cursor color
hi Cursor ctermbg=white ctermfg=black

" Highlight current vert position
set cursorline
hi clear CursorLine
hi CursorLine ctermbg=235

" 80 Character line
set colorcolumn=81      " Colors column 81
"set tw=80               " Automatically newlines at a new word that passes 80
hi ColorColumn ctermbg=233
hi LineNr ctermfg=15 ctermbg=233

" Column for breakpoints and YCM >> signs
hi SignColumn ctermbg=234
" YCM links YcmErrorSign to Error
hi Error ctermbg=1
" YCM links YcmErrorSection to SpellBad
hi SpellBad ctermbg=52
" YCM links YcmWarningSign to Todo
hi Todo ctermbg=228
" YCM links YcmWarningSection to SpellCap
hi SpellCap ctermbg=58

" Menu (used by YCM for suggestions)
hi Pmenu ctermbg=237 ctermfg=255

" General syntax colors
hi comment ctermfg=lightblue
hi include ctermfg=176
hi constant ctermfg=201
hi statement ctermfg=228
hi special ctermfg=219

" Line number options
set number              " Show line numbers
set numberwidth=3       " Make room for a three digit line number

" Highlight extra whitespace as red
"highlight ExtraWhitespace ctermbg=white guibg=white
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=white guibg=white
"match ExtraWhitespace /\s\+\%#\@<!$/
