" From: init.vim
" Ref: cmaps.vim
" Ref: cabbrs.vim

command! -bar DiffOrig
      \ :vert above new | setl bt=nofile
      \ | r # | 0d_
      \ | diffthis | wincmd p | diffthis

command! -bar XinputTouchpadEnable  :!xinput Enable  Elan\ Touchpad
command! -bar XinputTouchpadDisable :!xinput disable Elan\ Touchpad
command! -bar TouchpadEnable  :!xinput Enable  Elan\ Touchpad
command! -bar TouchpadDisable :!xinput disable Elan\ Touchpad
command! -bar MonitorTry :!xrandr |
      \ grep "HDMI2 connected"
      \ && xrandr --output eDP1 --auto
      \ --output "HDMI2" --auto --above eDP1

command! -bar CursorChar :echo "getline('.')[col('.') - 1] is '". getline('.')[col('.') - 1] ."'"
"augroup ToggleLineNr
"  au!
"  au CmdwinEnter,CmdlineEnter * setl number
"  au CmdwinLeave,CmdlineLeave * setl nonumber
"augroup END
"augroup AutoMkdirSuggestionOnSave "{{{1
"  au!
"  function! s:auto_suggest_mkdir(dir, force) "{{{
"    if !isdirectory(a:dir) && (a:force ||
"          \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
"      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
"    endif
"  endfunction "}}}
"  au BufWritePre * call <SID>auto_suggest_mkdir(expand('<afile>:p:h'), v:cmdbang)
"augroup END
"}}}
" command; :source {{{1
command! -bar So :call s:source_buffer()
command! -bar SO :call s:source_buffer()
function! s:source_buffer() abort "{{{2
  " Note: :undojoin causes an error right after :undo.
  silent! undojoin
  silent write
  if &ft ==# 'vim'
    so %:p
    echomsg v:statusmsg '& sourced.'
  elseif &ft =~# 'html'
    silent OpenBrowser %:p
    echomsg v:statusmsg
  elseif &ft ==# 'xdefault'
    !xrdb %:p
  else
    !
  endif
endfunction

" Command; Open parent directory {{{1
command! E :e    %:p:h
command! V :vs   %:p:h
" Mnemonic: Horizontal (h muet)
command! O :sp   %:p:h
command! T :tabe %:p:h
command! -bang -bar -nargs=? Cd call s:cd_here(<bang>)
command! -bang -bar -nargs=? CD call s:cd_here(<bang>)
function! s:cd_here(args) abort
  if a:args ==# ''
    cd %:p:h
  else
  "elseif a:args ==# "<lt>bang>"
    " TODO: get <bang>
    !cd %:p:h
  "else
  "  cd a:args
  endif
endfunction

command! -nargs=* Vint :w <bar> !vint --enable-neovim <args> %:p
