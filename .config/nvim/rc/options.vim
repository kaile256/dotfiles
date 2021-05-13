scriptencoding utf-8
" From: init.vim

runtime! options/*.vim

" Over the time, `:syntax off` will run.
set redrawtime=100000

"set verbosefile=/tmp/nvim-log

" Note: EndOfBuffer is set of trailing '~' at end of buffer.
hi! link EndOfBuffer Ignore

" Vim sometimes unexpectedly detects options as modelines such as in snippets.
set modelines=1

" Time in ms to wait for a mapped sequence to complete.
set timeoutlen=2000
set previewheight=28
"set nomore

set synmaxcol=320
" 'autochdir': with it on, some plugins may not work, like vim-findroot
"set autochdir

" Plugin author should care about bell
set belloff=
" set errorbells
set visualbell

" Shell {{{1
" CAUTION: some plugins depends on bash, such as twiggy.vim.
"if executable('fish')
"   set shell=fish
"endif

" Grep {{{1
if executable('rg')
  " Ref: https://ktrysmt.github.io/blog/finish-work-early-with-cli-made-by-rust/
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" command! -nargs=+ -complete=file Grep silent tab grep --sort-files <args>

" Mouse {{{1
" 'mouse':
"   n: Normal mode
"   v: Visual mode
"   i: Insert mode
"   c: Command-line mode
"   h: all previous modes when editing a help file
"   a: all previous modes
"   r: for |hit-enter| and |more-prompt| prompt
set mouse=a

" View {{{1
set viewoptions=cursor,folds

" Shada {{{2
if has('nvim')
  " see doc by `:h 'shada'`; single-quote is required for options
  "   ': jumplist and changelist
  "   <: max number of lines for register
  "   h: disable 'hlsearch' after loading the shada
  "   s:
  " Default:
  "   Win32:  !,'100,<50,s10,h,rA:,rB:
  "   others: !,'100,<50,s10,h
  set shada='1000,<50,h,s10,

  augroup myAutoWriteShada
    " Note: shada only saves the data on VimLeave so that
    "       nothing won't be saved, when you start another process of neovim,
    "       i.e., no data won't share with the running neovim process then.
    au InsertLeave * wshada
    "au! FocusGained * rshada!
  augroup END

  "function! s:save_jumplists() abort
  " TODO: should share jumplist on multiple neovim processes.
  "  let l:shada_conf = execute('set shada')
  "  set shada='100
  "  wshada
  "  set shada=expand(l:shada_conf)
  "endfunction

endif

" Session {{{2
set sessionoptions=
set ssop+=blank
set ssop+=help
set ssop+=resize
set ssop+=tabpages
set ssop+=winpos
set ssop+=winsize
if exists('+terminal')
  set ssop+=terminal
endif
if has('win32') || has('win64')
  set ssop+=slash
endif
" Inc/Decrement {{{2
"set nrformats+=octal
" Fold {{{1
set nofoldenable
"set foldclose " when cursor is out of fold, close automatically.
" setglobal foldminlines=40 " open if the fold block is less than the size
" set foldmethod=syntax
" Note: 'foldlevel' is local to window
set foldlevelstart=1
set foldnestmax=10
" reduce block (e.g., [[,{)
set foldopen=hor,insert,mark,percent,quickfix,search,tag,undo
"set foldmarker={{{\\d*$,}}}\\d*$

" Appearance; Font {{{1
" set ambiwidth=double

" Appearance; Term GUI Colors {{{1
" Ref: *term-dependent-settings* or /usr/share/nvim/runtime/doc/term.txt
if $TERM =~# '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
  set termguicolors " Enables 24-bit RGB color in TUI.
elseif $ALACRITTY_LOG =~# '\.log$'
  set termguicolors

elseif $TERM =~# '^\(rxvt\|screen\|interix\|putty\)\(-.*\)\?$'
  set notermguicolors

elseif $TERM =~# '^\(xterm\)\(-.*\)\?$'
  if $XTERM_VERSION !=# ''
    set termguicolors
  elseif $KONSOLE_PROFILE_NAME !=# ''
    set termguicolors
  elseif $VTE_VERSION !=# ''
    set termguicolors
  else
    set notermguicolors
  endif
endif

" Appearance; transparency {{{1
" Note: it works dum CUI.
if exists('&pumblend')
  set pumblend=25
  set winblend=20
endif

" Pmenu {{{2
" shortmess: Shorter Message
" c-option: forbids to give |ins-completion-menu| messages.
set shortmess+=c
set pumheight=15
" set pumwidth=12

" Cursor {{{2
" shorter for CursorHold & CursorHoldI
set updatetime=300
"" Cursor; Disable
"set guicursor
" Line {{{2
set cursorline
" augroup myAutoToggleCursorLine
"   au WinEnter,InsertLeave * if &modifiable | setlocal cursorline | endif
"   au WinLeave,InsertEnter * if &modifiable | setlocal nocursorline | endif
" augroup END
"" to highlight only CursorLineNr if not linked.
"hi CursorLine NONE
" in diff mode, move cursorline in the other window as the corresponding line of the current window.
" Error?: it would work, even not in diff mode, but just there're two or more windows in a screen.
"set nocursorbind
" Column {{{2
" show line number on left
set number
set colorcolumn=80
" signcolumn is the line beside numbers.
set signcolumn=yes
" Statusbar {{{2
set title
set titlelen=30
set ruler
" 2: always show the current status.
set laststatus=2
set showtabline=2 " 2: always show tabline

" Invisible Charactars {{{2
" show space and CR
set list
"set list listchars=nbsp:¦_
"  augroup ListAutoToggle
"  au!
"  au BufLeave,CursorMovedI * if &l:list | setl nolist | endif
"  au BufEnter,CursorHold * if &l:list == 0 | setl list | endif
"augroup END
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
let &listchars = 'tab:  |'
set listchars+=trail:-,nbsp:+
set listchars+=extends:~,precedes:«
set listchars+=conceal:_

" Split; Multiple Windows {{{1
set splitbelow
set splitright
" set noequalalways

" Mode; Visual Mode {{{1
set virtualedit=block

" Mode; Commandline Mode {{{1
" set report=0 " report when more than the number of lines are changed.
set noshowcmd
set history=100 " default: 10000, history of ':' commands
" Cmdline; Completion
" set wildmenu wildmode=list:longest
set wildmenu wildmode=longest:full

set completeopt=
set cot+=menu " Enable popup menu for candidates if more than one match.
" set cot+=menuone " Enable popup menu even when there's only one match.
set cot+=preview " Only works with 'menu' or 'menuone'.
set cot+=longest

" " for `:substitute`
" if exists('+inccommand')
"   set inccommand=nosplit
" endif

" Edit; Macros {{{1
" lazyredraw: forbids to redraw screen while executing macros.
" Note: had caused a problem w/ fugitive;
"       expanded too wide a fugitive buffer's window.
set lazyredraw

" Insert; Imput Method {{{1
" 0: IM will be off, when lmap is off.
" lmap supports 3 modes: insert, commandline and lang-arg.
set iminsert=0
set imsearch=0
set imcmdline
"augroup FcitxRemoteToggle
"  if &imdisable == 0 " i.e., if IM is active on vim.
"    au!
"    au VimEnter    * nested call system('fcitx-remote -s ssk')
"    au InsertEnter * nested call system('fcitx-remote -o')
"    au InsertLeave * nested call system('fcitx-remote -c')
"  endif
"augroup END

" Insert; Completion {{{1
set complete-=i " i: included files
set complete-=t " t: tag

" Motion {{{1
set whichwrap=

" show match parens.
set showmatch
set matchtime=1 " 10 times the number sec.
set matchpairs+=<:>,「:」,『:』

" nostartofline: keep cursor column on jump, like `gg`, `M`.
set nostartofline
" hidden: ignore unwritten buffers to jump.
set hidden

" set switchbuf=
" set swb+=useopen " Use existing buffer if possible without new one.

" Motion; Search {{{1
set ignorecase
set smartcase
set incsearch hlsearch nowrapscan

