" Path; Runtime Path {{{
set rtp+=~/.config/nvim/rc/
set rtp+=~/.config/nvim/data/
set rtp+=~/.config/nvim/lazy/
set rtp+=~/.config/nvim/toml/
set rtp+=~/.config/nvim/keymap/
"}}}
" Path: for `:find` {{{
set path+=../**
set path+=~/.config/**
set path+=~/.cache/dein/repos/github.com/**
set path+=~/.local/nvim/**
set path+=/etc/**

set path-=~
set path-=.git/**
set path-=*yarn*/**
set path-=*node*/**
"}}}
" Path; Provider {{{
"let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
"let g:python_host_prog = '/home/linuxbrew/.linuxbrew/bin/python'
"let g:ruby_host_prog = '/home/linuxbrew/.linuxbrew/bin/ruby'

if has('python3')
  let g:python3_host_prog = '/usr/bin/python3'
  "let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python3)/bin/python") || echo -n $(which python3)')
endif

if has('python2')
let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin/python") || echo -n $(which python2)')
endif

let g:ruby_host_prog = '/usr/bin/ruby'
"}}}
" Path; Backup {{{
" Write, on path,vim, the file directory paths.
set nobackup
set nowritebackup
set noswapfile
set noundofile
"augroup PersistentUndo
"  au! BufWritePre /tmp/* setlocal noundofile
"augroup END
" XDG Base Repository
"set undodir=~/.local/share/nvim/undo
"set directory="~/.local/share/nvim/swap
"set backupdir=~/.local/share/nvim/backup
"set viminfo='1000,n~/.local/share/nvim/info
"set runtimepath=$XDG_CONFIG_HOME/vim,http://eleclog.quitsq.com/2014/10/arch-on-x220.html?m=1$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
let g:netrw_home = "~/.local/share/nvim"
"}}}

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
set matchtime=1 " 10 times the number sec.
" add '<' and '>' as a match pair
set matchpairs+=<:>
"}}}

"" Edit; Invisible Charactars {{{
" show space and CR
set list
"" Quick Reference of 'listchar': which chars show instead.
"" eol: <CR>
"" extends: when window-width omits on right end.
"" precedes: when window-width omits on left.
"" nbsp: for space
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"}}}

" Multiple Windows
set splitbelow
set splitright

"" Edit; Fold {{{
set foldlevel=1
set foldnestmax=10
"}}}

"augroup AutoAjustFoldMethod "{{{
"  au!
"  au InsertEnter * if &l:foldmethod !=# 'manual' | setlocal foldmethod=manual | endif
"  au InsertLeave * if &l:foldmethod ==# 'manual' | if &filetype = 'vim' || &filetype == 'toml' | setlocal foldmethod=marker | else setlocal foldmethod=syntax | endif
"augroup END
"}}}
"}}}
