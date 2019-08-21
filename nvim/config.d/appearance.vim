"""" From: nvim/init.vim

"""" ColorScheme
""" Ref: dein.vimrc

""" Redraw
"" Indent
nnoremap <S-TAB> gg=G''zz

" CAUTION: <c-l> should be run at LAST so that no corruption.
" CAUTION: zR (open all fold) makes vim FREEZE.
"" Ref: showmarks.vimrc
inoremap <silent> <c-l>         <c-o>:<c-u>noh <cr><c-o><c-l>
nnoremap <silent> <c-space><space>   :<c-u>noh <cr><c-l>
nnoremap <silent> <c-space><c-space> :<c-u>noh <cr><c-l>
" <a-space> gets along with <a-hjkl>.
nmap <silent> <space><space>     :cclose <cr> :retab <cr>

"" Move Window
nnoremap <c-w>h <c-w>H
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L

""" Resize
nnoremap <A-left>  <c-w>>
nnoremap <A-down>  <c-w>-
nnoremap <A-up>    <c-w>+
nnoremap <A-right> <c-w><
nnoremap <C-left>  <c-w>>
nnoremap <C-down>  <c-w>-
nnoremap <C-up>    <c-w>+
nnoremap <C-right> <c-w><
" another-resize commands
nnoremap <a->> <c-w>>
nnoremap <a--> <c-w>-
nnoremap <a-+> <c-w>+
nnoremap <a-<> <c-w><
" agressive resize
nnoremap <c-w>m     <c-w>_
nnoremap <c-w><c-m> <c-w>_<c-w>|
" neutralize
nnoremap <c-w>0 <c-w>=

"""" GENERAL
" shorter for CursorHold & CursorHoldI
set updatetime=300
" signcolumn is the line beside numbers.
set signcolumn=yes
"" shortmess: Shorter Message
" c-option: forbids to give |ins-completion-menu| messages.
set shortmess+=c
set pumheight=30

""" Redraw "{{{
" lazyredraw: forbids to redraw screen while executing macros.
set lazyredraw
"}}}

""" Color
set termguicolors

""" Column
" show line number on left
set number
set colorcolumn=81

""" Charactars
set ambiwidth=double
"" Wrap
" wrap long text: s for space
set wrap whichwrap=s
augroup ConfirmSetWrap "{{{
  au!
  au BufRead * if &diff | setlocal wrap
set breakindent

""" Line
" CAUTION: cursorline-highlight causes drawing corruption.
augroup AutoToggleCursorLine
  au!
  au BufRead,WinEnter,InsertLeave * silent setlocal cursorline
  au WinLeave,InsertEnter * silent setlocal nocursorline
augroup END
" highlight only CursorLineNr
"hi CursorLine NONE

""" Statusbar
set title
set ruler
" 2: always show the current status.
set laststatus=2

""" Pair
" show match parens.
set showmatch
" add '<' and '>' as a match pair
set matchpairs+=<:>

"" Invisible Charactars
" show space and CR
set list
"" Quick Reference of 'listchar': which chars show instead.
"" eol: <CR>
"" extends: when window-width omits on right end.
"" precedes: when window-width omits on left.
"" nbsp: for space
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"" Multiple Windows
set splitbelow
set splitright

"" Speed
set matchtime=1

""" Fold
"set foldmethod=syntax
set foldlevel=1
set foldnestmax=10
"hi Folded gui=bold guifg=#fabd1f
hi CursorIM guibg=#fabd1f

"augroup AutoAjustFoldMethod "{{{
"  au!
"  au InsertEnter * if &l:foldmethod !=# 'manual' | setlocal foldmethod=manual | endif
"  au InsertLeave * if &l:foldmethod ==# 'manual' | if &filetype = 'vim' || &filetype == 'toml' | setlocal foldmethod=marker | else setlocal foldmethod=syntax | endif
"augroup END
"}}}
