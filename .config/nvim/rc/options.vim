scriptencoding utf-8
" From: init.vim

"set foldmarker={{{\\d*$,}}}\\d*$

if executable('rg')
  " Ref: https://ktrysmt.github.io/blog/finish-work-early-with-cli-made-by-rust/
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
command! -nargs=+ -complete=file Grep tab silent grep --sort-files <args>

" Time in ms to wait for a mapped sequence to complete.
" For: made me notice if any mappings are in Caleene's way.
set timeoutlen=3000
set previewheight=28
"set nomore

set synmaxcol=320
" 'autochdir': with it on, some plugins may not work
set autochdir

" Appearance {{{1
" Set; Font {{{2
set ambiwidth=double

" Term GUI Colors {{{2
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

" transparency {{{1
" Note: it works dum CUI.
if exists('&pumblend')
  set pumblend=35
  set winblend=40
endif

" Pmenu {{{2
" shortmess: Shorter Message
" c-option: forbids to give |ins-completion-menu| messages.
set shortmess+=c
set pumheight=15
" Format {{{2
"set noemoji
" wrap long text: s for space
set wrap whichwrap=h,l
augroup NoWrapWithinAWord
  au! FileType * if !&modifiable | setl linebreak showbreak= | endif
augroup END
" `breakindent` keeps visually indented according to the actual line.
set breakindent
set showbreak=>\
" Note: `breakat` ONLY works for ASCII characters.
set breakat+=
function! s:auto_format_if_modifiable() "{{{
  if &readonly == 0
    setl linebreak
  else
    setl nolinebreak
    if &textwidth != 0
      setl textwidth=0
    endif
  endif
endfunction "}}}
"set indentkeys+=
" modeline; force format as written at top/bottom of file
set modeline
set modelineexpr
" Cursor {{{2
" shorter for CursorHold & CursorHoldI
set updatetime=300
"" Cursor; Disable
"set guicursor
" Line {{{2
set cursorline
" CAUTION: cursorline-highlight causes drawing corruption.
augroup AutoToggleCursorLine
  au!
  " Note: InsertEnter & WinLeave used to be useless.
  au WinEnter,InsertLeave * setl cursorline
  au WinLeave,InsertEnter * setl nocursorline
augroup END
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
set signcolumn=auto
" Statusbar {{{2
set title
set ruler
" 2: always show the current status.
set laststatus=2
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

" Method; Shell {{{1
" CAUTION: some plugins depends on bash, such as twiggy.vim.
"if executable('fish')
"   set shell=fish
"endif
" Insert {{{1
" Method; Imput Method {{{2
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
" Method; Tab&Indent {{{2
"" Tab-Char
" Insert spaces, instead of a tab-char.
set expandtab
" number of spaces, inserted by <TAB>, that a tab-char counts for.
set tabstop=2
" number of spaces, inserted by <TAB>, next to tab-chars.
set softtabstop=2
"" Tab&Indent; Indent
" indent depends on the first char of the prev line.
set autoindent
" indent depends on the last char of the prev line.
"set smartindent
" indent setting for c-lang.
"set cindent
" number of spaces inserted by autoindent.
set shiftwidth=2
" for manual indent, insert spaces according to &l:shiftwidth.
set smarttab
" for '</>' indent, insert spaces according to &l:shiftwidth.
set shiftround
" Method; Pair {{{2
" show match parens.
set showmatch
set matchtime=1 " 10 times the number sec.
" add '<' and '>' as a match pair
set matchpairs+=<:>,「:」,『:』
" Method; Completion {{{2
set complete-=i " i: included files

" Edit {{{1
" Method; Visual Mode {{{2
set virtualedit=block

" Method; Commandline Mode {{{2
set noshowcmd
set history=100 " default: 10000
" Cmdline; Completion
set wildmenu wildmode=list:longest
"set wildmenu wildmode=longest:full
" 'wildcharm' works exactly like 'wildchar', which is <TAB> in vim as default,
" but it keeps to work in cnoremap.
set wildcharm=<c-y>
" for `:substitute`
if exists('+inccommand')
  set inccommand=nosplit
endif
" Method; Macros "{{{2
" lazyredraw: forbids to redraw screen while executing macros.
" Note: had caused a problem w/ fugitive;
"       expanded too wide a fugitive buffer's window.
set lazyredraw
" Method; Fold {{{2
"set foldenable " default: on
set foldmethod=syntax
" Note: 'foldlevel' is local to window
set foldlevelstart=0
set foldnestmax=10
" reduce block (e.g., [[,{)
set foldopen=hor,insert,mark,percent,quickfix,search,tag,undo

set formatoptions=jmB1cql " default: tcqj

" 'mouse':
"   n: Normal mode
"   v: Visual mode
"   i: Insert mode
"   c: Command-line mode
"   h: all previous modes when editing a help file
"   a: all previous modes
"   r: for |hit-enter| and |more-prompt| prompt
set mouse=a
augroup myForceFormatOptions
  au!
  au BufWinEnter * if &fo =~# 'r\|o' | set fo-=r | set fo-=o | endif
  au InsertEnter * if &tw =~# ''     | set textwidth=0       | endif
  "au FileType * if getline(1, '$') ==# [] | startinsert | endif
augroup END
"set foldclose " when cursor is out of fold, close automatically.

"augroup MyAutoView
"" Note: may cause trouble with shada in such caches as jumplist.
"  function! s:is_view_available() abort "{{{
"    if !&buflisted || &bt !=# ''
"      return 0
"    elseif !filewritable(expand('%:p'))
"      return 0
"    endif
"    return 1
"  endfunction "}}}
"  function! s:mkview() abort "{{{
"    if s:is_view_available()
"      silent! mkview
"    endif
"  endfunction "}}}
"  function! s:loadview() abort "{{{
"    if s:is_view_available()
"      silent! loadview
"    endif
"  endfunction "}}}
"  au BufWinLeave ?* call s:mkview()
"  au BufReadPost ?* call s:loadview()
"augroup END
" Method; Shada {{{2
if has('nvim')
  " see doc by `:h 'shada'`; single-quote is required for options
  " -': jumplist and changelist
  " -<: max number of lines for register
  " -h: disable 'hlsearch' after loading the shada
  " -s:
  set shada='200,<50,h,s10,

  augroup myAutoWriteShada
    " Note: shada only saves the data on VimLeave so that
    "       nothing won't be saved, when you start another process of neovim,
    "       i.e., no data won't share with the running neovim process then.
    au! InsertLeave * wshada
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

" Method; Session {{{2
" terminal is regarded as an invalid argument
" buffers,tabpages
set sessionoptions=folds,globals
set sessionoptions+=help,localoptions,options
set sessionoptions+=slash,winsize
" Method; Inc/Decrement {{{2
"set nrformats+=octal
" Leap; Multiple Windows {{{1
set splitbelow
set splitright

" Leap; Jump {{{1
" nostartofline: keep cursor column on jump, like `gg`, `M`.
set nostartofline
" hidden: ignore unwritten buffers to jump.
set hidden

" Leap; Search {{{1
set noignorecase
"set ignorecase smartcase
"set smartcase
set incsearch hlsearch nowrapscan
" fold all lines unmatched on {pattern}.
" CAUTION: foldable is apt to collapse format.

