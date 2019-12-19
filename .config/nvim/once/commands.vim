" From: init.vim
" Ref: cmaps.vim
" Ref: cabbrs.vim

command! -bar CursorCharIs
      \ :echo "'". getline('.')[col('.') - 1] ."' is the character under cursor, as getline('.')[col('.') - 1]"

command! -bar DiffOrig
      \ :vert above new | setl bt=nofile
      \ | r # | 0d_
      \ | diffthis | wincmd p | diffthis

"augroup ToggleLineNr
"  au!
"  au CmdwinEnter,CmdlineEnter * setl number
"  au CmdwinLeave,CmdlineLeave * setl nonumber
"augroup END

command! -bar SyntaxReset        :call s:syntax_reset() "{{{1
command! -bar HeavyBufferToReset :call s:syntax_reset()
" TODO: automatically call this function/command as needed
function! s:syntax_reset() abort
  let save_syn = &syn
  setl syntax=
  let &l:syntax = save_syn
endfunction

"augroup AutoMkdirSuggestionOnSave "{{{1
"  au!
"  au BufWritePre * call <SID>auto_suggest_mkdir(expand('<afile>:p:h'), v:cmdbang)
"  function! s:auto_suggest_mkdir(dir, force)
"    if !isdirectory(a:dir) && (a:force ||
"          \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
"      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
"    endif
"  endfunction
"augroup END
"}}}
" Open parent directory {{{1
command! E :e    %:p:h
command! V :vs   %:p:h
" Mnemonic: Horizontal (h muet)
command! O :sp   %:p:h
command! T :tabe %:p:h
command! -bang -bar -nargs=? Cd call s:cd_here(<q-bang>) "{{{2
command! -bang -bar -nargs=? CD call s:cd_here(<q-bang>)

function! s:cd_here(args) abort
  if a:args ==# ''
    cd %:p:h
  else
    !cd %:p:h
  endif
  pwd
endfunction

" TODO: make vint restricted to the range
command! -nargs=* -range Vint :w <bar> !vint --enable-neovim <args> %:p
command! -bar So :call s:source_buffer() "{{{1
command! -bar SO :call s:source_buffer()

if !exists('*s:source_buffer')
  function! s:source_buffer() abort
    " Note: :undojoin causes an error right after :undo.
    " Note: :undojoin with :w prevents to :undo before :w
    "silent! undojoin
    if expand('%:p') =~# '^/etc/systemd/logind.conf'
      !alacritty --title 'TMP' -e sudo systemctl restart systemd-logind
      return
    endif

    silent write
    if getline(1) =~# '^#!'
      !%:p
    elseif &ft ==# 'vim'
      so %:p
      echomsg v:statusmsg '& sourced.'
    elseif &ft =~# 'html'
      silent OpenBrowser %:p
      echomsg v:statusmsg
    elseif &ft ==# 'xmodmap'
      !xmodmap %:p
    elseif &ft ==# 'xdefault'
      !xrdb %:p
    elseif &ft ==# 'dosini' && expand('%:p:h') =~# '/polybar/'
      !${XDG_CONFIG_HOME}/polybar/launch.sh &
    elseif &ft ==# 'i3'
      !i3-msg restart &
    elseif expand('%:p') =~# '\.config/fcitx/'
      " -r: reload; no flag, '--reload'
      !fcitx-remote -r
    else
      !
    endif
  endfunction
endif

" Shell Scripts; Out of Vim "{{{1
command! -bar -nargs=* -complete=shellcmd
      \ Killall
      \ :silent !killall <args>

command! -bar XinputTouchpadEnable  :!xinput enable  Elan\ Touchpad
command! -bar TouchpadEnable        :!xinput enable  Elan\ Touchpad
command! -bar XinputTouchpadDisable :!xinput disable Elan\ Touchpad
command! -bar TouchpadDisable       :!xinput disable Elan\ Touchpad
