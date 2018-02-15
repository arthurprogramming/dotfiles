"No compatible with vi
set nocompatible

"Line number
set number

"Relative number
set relativenumber

"Enable ruler
set ruler

"Tab size
set tabstop=4

"Tab size on autoindent
set shiftwidth=4

"Converts tab in spaces
set expandtab

"Tab delele on backspace
set smarttab

"Code indent
set smartindent
set autoindent
filetype plugin indent on

"Enable syntax
syntax on

"No Wrap
set nowrap

"Disabling Arrow Keys
nnoremap <LEFT> <nop>
nnoremap <DOWN> <nop>
nnoremap <UP> <nop>
nnoremap <RIGHT> <nop>

"Makes jk work as ESC key
inoremap jk <esc>

"Enabling 256 colors
set t_Co=256

"No backup files
set nobackup
set nowritebackup

"set noswapfile
set directory=$HOME/.vim/swap//

"Persistent undo
set undofile                " Save undos after file closes
set undodir=~/.vim/undo     " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

"Search
set hlsearch
set incsearch
set ignorecase

"Path
set path+=**
set wildmenu
set wildmode=list:longest,full

"Netrw as tree
let g:netrw_liststyle = 3

"Netrw no banner
let g:netrw_banner = 0

"Open files in vertical split by default
let g:netrw_browse_split = 4
"let g:netrw_browse_split = 3

"Open file to the right
let g:netrw_altv = 1

"Width at 25% of the page
let g:netrw_winsie = 25

"Fix bug with bracketed past mode in terminal
 set t_BE = 

"""Mappings"""
let mapleader = " "
"Vertical Explorer
nnoremap <leader>e :Vex<CR>
"Enclose word with single quotes
noremap <leader>' <esc>ciw'<C-R>"'
"Enclose word with double quotes
noremap <leader>" <esc>ciw"<C-R>""

"Status line always on
set laststatus=2

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ \ %f
set statusline+=%m
set statusline+=\ %=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
