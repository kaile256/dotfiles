" Appearance; IME {{{
set ambiwidth=double
" Tell if IME is on.
hi CursorIM guibg=#fabd1f
"}}}
" Appearance; Pmenu {{{
" shortmess: Shorter Message
" c-option: forbids to give |ins-completion-menu| messages.
set shortmess+=c
set pumheight=30
"}}}
" Appearance; Format {{{
" wrap long text: s for space
set wrap whichwrap=s
" `breakindent` keeps visually indented according to the actual line.
set breakindent
set showbreak=>\
" Note: `breakat` ONLY works for ASCII characters.
set breakat+=
function! s:auto_format_if_modifiable() "{{{
  if &readonly == 0
    setlocal linebreak
  else
    setlocal nolinebreak
    if &textwidth != 0
      setlocal textwidth=0
    endif
  endif
endfunction "}}}
" modeline# accepts text format written on bottom of file {{{
if &modeline == 0
  set modeline
endif

if &modelineexpr == 0
  set modelineexpr
endif
"}}}
"}}}
" Appearance; Redraw "{{{
" lazyredraw: forbids to redraw screen while executing macros.
set lazyredraw
"}}}
" Appearance; Cursor {{{
" shorter for CursorHold & CursorHoldI
set updatetime=300
"}}}
" Appearance; Line {{{
set cursorline
" CAUTION: cursorline-highlight causes drawing corruption.
"augroup AutoToggleCursorLine "{{{
"  au!
"  " TODO: InsertLeave doesn't work!
"  au BufEnter,InsertLeave  *  setl cursorline
"  au BufLeave,CursorMovedI * if &cursorline == 1 | setl nocursorline
"augroup END "}}}
" to highlight only CursorLineNr
"hi CursorLine NONE
"}}}
" Appearance; Column {{{
" show line number on left
set number
set colorcolumn=81
" signcolumn is the line beside numbers.
set signcolumn=yes

"}}}
" Appearance; Statusbar {{{
set title
set ruler
" 2: always show the current status.
set laststatus=2
"}}}
" Appearance; Pair {{{
" show match parens.
set showmatch
" add '<' and '>' as a match pair
set matchpairs+=<:>
"}}}

"" Invisible Charactars
" show space and CR
set list
"" Quick Reference of 'listchar': which chars show instead.
"" eol: <CR>
"" extends: when window-width omits on right end.
"" precedes: when window-width omits on left.
"" nbsp: for space
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" Multiple Windows
set splitbelow
set splitright

" Speed
set matchtime=1

" Fold
"set foldmethod=syntax
set foldlevel=1
set foldnestmax=10

"augroup AutoAjustFoldMethod "{{{
"  au!
"  au InsertEnter * if &l:foldmethod !=# 'manual' | setlocal foldmethod=manual | endif
"  au InsertLeave * if &l:foldmethod ==# 'manual' | if &filetype = 'vim' || &filetype == 'toml' | setlocal foldmethod=marker | else setlocal foldmethod=syntax | endif
"augroup END
"}}}
"}}}
