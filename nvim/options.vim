scriptencoding utf-8
" From: init.vim

if executable("rg")
  " Ref: https://ktrysmt.github.io/blog/finish-work-early-with-cli-made-by-rust/
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
command! -nargs=+ -complete=file Grep :tabnew | :silent grep --sort-files <args>

" Time in ms to wait for a mapped sequence to complete.
" For: made me notice if any mappings are in Caleene's way.
set timeoutlen=3000
"set shada=!,'100,<50,s10,h,
augroup AutoWriteShada
  " Topic: When shada file is updated?
  " Shada only saves the data on VimLeave so that
  " nothing won't be saved, when you start another process of neovim,
  " i.e., no data won't share with the running neovim process then.
  au! InsertLeave * wshada
augroup END
"function! s:save_jumplists() abort
" TODO: should share jumplist on multiple neovim processes.
"  let l:shada_conf = execute('set shada')
"  set shada='100
"  wshada
"  set shada=expand(l:shada_conf)
"endfunction

set synmaxcol=320
" Appearance; Blend {{{
if exists('&pumblend')
  set pumblend=30
  set winblend=30
endif
"}}}
" Appearance; Pmenu {{{
" shortmess: Shorter Message
" c-option: forbids to give |ins-completion-menu| messages.
set shortmess+=c
set pumheight=15
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
" modeline; force format as written at top/bottom of file
if &modeline == v:true
  set nomodeline
endif
if &modelineexpr == v:true
  set nomodelineexpr
endif
"}}}
" Appearance; Cursor {{{
" shorter for CursorHold & CursorHoldI
set updatetime=300
"" Cursor; Disable ?fail
set guicursor=
"}}}
" Appearance; Line {{{
set cursorline
" CAUTION: cursorline-highlight causes drawing corruption.
"augroup AutoToggleCursorLine
"  au!
"  " Note: InsertEnter & WinLeave doesn't work.
"  au WinEnter,InsertLeave * setl cursorline
"  au WinLeave,InsertEnter * setl nocursorline
"augroup END
" to highlight only CursorLineNr if not linked.
"hi CursorLine NONE
" in diff mode, move cursorline in the other window as the corresponding line of the current window.
" Error?: it would work, even not in diff mode, but just there're two or more windows in a screen.
"set nocursorbind
"}}}
" Appearance; Column {{{
" show line number on left
set number
set colorcolumn=81
" signcolumn is the line beside numbers.
set signcolumn=auto
"}}}
" Appearance; Statusbar {{{
set title
set ruler
" 2: always show the current status.
set laststatus=2
"}}}
" Appearance; Invisible Charactars {{{
" show space and CR
set list
"set list listchars=nbsp:¦_
"  augroup ListAutoToggle
"  au!
"  au BufLeave,CursorMovedI * if &l:list | setl nolist | endif
"  au BufEnter,CursorHold * if &l:list == 0 | setl list | endif
"augroup END
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"}}}

" Method; Shell {{{1
" CAUTION: some plugins depends on bash, such as twiggy.vim.
"if executable('fish')
"   set shell=fish
"endif
" Method; Imput Method {{{
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
"}}}
" Method; Tab&Indent {{{
"" Tab-Char
" Insert spaces, instead of a tab-char.
set expandtab
" number of spaces, inserted by <TAB>, that a tab-char counts for.
set tabstop=2
" number of spaces, inserted by <TAB>, next to tab-chars.
set softtabstop=2
"" Tab&Indent; Indent
" copy indent dependent on first char of current line.
set autoindent
" copy indent dependent on last char of current line.
set smartindent
" indent setting for c-lang.
"set cindent
" number of spaces inserted by autoindent.
set shiftwidth=2
" for manual indent, insert spaces according to &l:shiftwidth.
set smarttab
" for '</>' indent, insert spaces according to &l:shiftwidth.
set shiftround
"}}}
" Method; Pair {{{
" show match parens.
set showmatch
set matchtime=1 " 10 times the number sec.
" add '<' and '>' as a match pair
set matchpairs+=<:>,「:」,『:』
"}}}
" Method; Visual Mode {{{
set virtualedit=block
"}}}
" Method; Commandline Mode {{{
set noshowcmd
"set history=10000
" Cmdline; Completion
set wildmenu wildmode=list:longest
" for `:substitute`
if exists('+inccommand')
  set inccommand=nosplit
endif
"}}}
" Method; Macros "{{{
" lazyredraw: forbids to redraw screen while executing macros.
" Note: has caused a problem w/ fugitive;
"       had expanded too wide a fugitive buffer's window.
set lazyredraw
"}}}
" Method; Fold {{{
set foldenable
set foldlevel=1
set foldnestmax=10
"augroup MyAutoView
"" Note: may cause trouble with shada in such caches as jumplist.
augroup FoldMyConfigsAtMarker
  au!
  au BufWinEnter dotfiles/**,.config/** setl fdm=marker
augroup END
"  function! s:is_view_available() abort " {{{
"    if !&buflisted || &bt !=# ''
"      return 0
"    elseif !filewritable(expand('%:p'))
"      return 0
"    endif
"    return 1
"  endfunction " }}}
"  function! s:mkview() abort " {{{
"    if s:is_view_available()
"      silent! mkview
"    endif
"  endfunction " }}}
"  function! s:loadview() abort " {{{
"    if s:is_view_available()
"      silent! loadview
"    endif
"  endfunction " }}}
"  au BufWinLeave ?* call s:mkview()
"  au BufReadPost ?* call s:loadview()
"augroup END
augroup SetFdmDotfiles
  au!
  au BufNewFile,BufRead,BufWinEnter dotfiles/** if &fdm !=# 'marker' | set fdm=marker
  " TODO: Understand :mkview
  " mkview: save a file condition according to `:viewoptions`
augroup END
"}}}
" Method; Session {{{
set sessionoptions+=localoptions
set sessionoptions-=blank,buffers
"}}}
" Method; Inc/Decrement {{{
"set nrformats+=octal
"}}}
" Method; Completion
set complete-=i " i: included files

" CAUTION: :DiffOrig ruins diff syntax.
"command! DiffOrig vert above new | setl bt=quickfix | r # | 0d_ | diffthis
"      \ | wincmd p | diffthis

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

