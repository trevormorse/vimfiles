" enable pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" tabs are 4 characters
set tabstop=4
set softtabstop=4

" convert tabs to spaces
set shiftwidth=4
set shiftround
set expandtab

" Indent based on shiftwidth not tabstop
set smarttab

" turn off word wrap
set nowrap

" show matching parenthesis
" set showmatch

" Telling command line its 256
set t_Co=256

" set the default theme
" colors slate
" colors ir_black
" colors molokai
" colors busybee
" colors github
" colors rdark
" colors peaksea
" colors wombat
" colors relaxedgreen
let g:solarized_style="dark"
colorscheme solarized

" turn on auto indent so next line is automatically indented
set autoindent
set copyindent

" We don't need to compatible with vi
set nocompatible

" lets you backspace past start of edit, indent, line
set backspace=start,indent,eol

" turn off swap/backup
set nobackup
set noswapfile

" case insensitive search
set ignorecase

" Write file on exit if no save
set autowrite

" hightlight searches
set hls

" So search as you type
set incsearch

" utf-8 by default
set enc=utf-8

" show poisition at bottom of screen
set ruler

" undo goodness
set history=1000
set undolevels=1000

" set "make" command when editing php files
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" Set default font
" set gfn=Liberation\ Mono\ 9 
set gfn=Consolas:h10

" set the default size of the window
"set lines=50 columns=130

" turn off menu bar, tool bar and scroll bar
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
endif

" automatically chdir to the directory of open buffer
set autochdir

" .module files are php
syntax on
filetype on
filetype plugin on
filetype indent on
au BufNewFile,BufRead *.module set filetype=php

" .install files are php
syntax on
filetype on 
au BufNewFile,BufRead *.install set filetype=php

" .inc files are php
syntax on
filetype on 
au BufNewFile,BufRead *.inc set filetype=php

" Autcomplete php 
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
autocmd FileType php let php_sql_query=1

" does exactly that. highlights html inside of php strings
autocmd FileType php let php_htmlInStrings=1

" discourages use oh short tags. c'mon its deprecated remember
autocmd FileType php let php_noShortTags=1

" automagically folds functions & methods. this is getting IDE-like isn't it?
autocmd FileType php let php_folding=1

" Trim trailing spaces on saving specific file types
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.module :%s/\s\+$//e
autocmd BufWritePre *.install :%s/\s\+$//e
autocmd BufWritePre *.inc :%s/\s\+$//e
autocmd BufWritePre *.tpl :%s/\s\+$//e

" Autoclose for [, (, {, " and '
source ~/.vim/bundle/autoclose/autoclose.vim

" F6 toggles line numbers
map <F6> :set invnumber number?<CR>

" change the mapleader from \ to ,
let mapleader=","

" Working with tabs 
set tabpagemax=10    " use at most 10 tabs
nmap <leader>t <Esc>:tabnew 
nmap gt <C-w>gf
nmap gT <C-w>gF
nmap <leader>1 :tabn 1<CR>
nmap <leader>2 :tabn 2<CR>
nmap <leader>3 :tabn 3<CR>
nmap <leader>4 :tabn 4<CR>
nmap <leader>5 :tabn 5<CR>
nmap <leader>6 :tabn 6<CR>
nmap <leader>7 :tabn 7<CR>
nmap <leader>8 :tabn 8<CR>
nmap <leader>9 :tabn 9<CR>
nmap <leader>0 :tabn 10<CR>
nmap <leader><Left> :tabprevious<CR>
nmap <leader><Right> :tabnext<CR>

" Simplifying copy and paste globally
nmap <leader>gp "+gp
vmap <leader>gy "+y

" Simplifying tabulator command
vmap <leader>t :<backspace><backspace><backspace><backspace><backspace>Tab/=<CR>

" Simplifying open/close folds
nmap <leader>o zo
nmap <leader>c zc

" Convert ESC to jj
map! jj <Esc>

" "save"
nmap <leader>s :w<CR>

" "quit"
nmap <leader>q :q<CR>

" "edit"
nmap <leader>e :e .<CR>

" search php documentation for current word
nmap <leader>pd :let searchCommand = ":Man " . expand("<cword>")<CR>:execute searchCommand<CR>

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Store the bookmarks file in perforce
let NERDTreeBookmarksFile="~/NERDTreeBookmarks"

" Toggle window
nmap <leader>w <C-w>w

" remap : to ; so we don't need to use shift when doing commands in normal
" mode
nnoremap ; :

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" make (check syntax in php)
nmap <silent> <leader>m :make %<CR>

" Clear search buffer with ,/
nmap <silent> <leader>/ :let @/=""<CR>

" Get rid of help key so I don't hit it constantly
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Use jj instead of ESC to leave insert mode 
inoremap jj <ESC>

" toggle task status
map <silent> <leader>ts <ESC>:call Toggle_task_status()<CR>

" Show unecessary whitespace and newlines 
set list
set listchars=tab:▸\ ,nbsp:.,eol:¬,trail:.,precedes:.

" Here we are adding the tab number to the tab in the gui, much easier then
" guessing what tab to jump to
set showtabline=2 " always show tabs in gvim, but not vim

" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)

  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor

  " Append the tab number
  let label .= v:lnum.': '

  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name

  " Append the number of windows in the tab page
  return label
endfunction

set guitablabel=%{GuiTabLabel()}

" Cross hair
set cursorline
set cursorcolumn

" Open all buffers in tabs
:au BufAdd,BufNewFile * nested tab sball
