" From: init.vim

augroup myAugroups
  " AutoWinResize "{{{1
  au VimResized * wincmd =

  au BufEnter */dotfiles/*vifm/* set modelineexpr
  au BufLeave */dotfiles/*vifm/* set nomodelineexpr

  " Open QuickFix on some commands {{{1
  " FIXME: Close the window where cursor has gone.
  au QuickFixCmdPost cexpr :bot copen | au WinLeave <buffer> :cclose
  au QuickFixCmdPost lexpr :bot lopen | au WinLeave <buffer> :lclose
  au QuickFixCmdPost grep,helpgrep cwindow
  au QuickFixCmdPost lhelpgrep lwindow

  " XinputToggle "{{{1
  " TODO: disable only the touchpad except mouse buttons
  exe 'au InsertEnter,'. TermOpen "* call system('xinput disable Elan\\ TrackPoint')"
  exe 'au InsertEnter,'. TermOpen "* call system('xinput disable Elan\\ Touchpad')"
  au FocusLost,VimLeave * call system('xinput enable  Elan\ TrackPoint')

  " WinfixBufLocal "{{{1

  au OptionSet wfw,wfh let b:fixwidth = &wfw | let b:fixheight = &wfh
  au BufWinLeave,BufWinEnter * call s:adjust_winfix()

  function! s:adjust_winfix() abort
    " Note: bothe wfw and wfh are local to window
    exe get(b:, 'fixwidth',  0) ? 'set wfh' : 'set nowfh'
    exe get(b:, 'fixheight', 0) ? 'set wfw' : 'set nowfw'
  endfunction

  " SpellLangForJapanese "{{{1
  " this one is which you're most likely to use?
  autocmd OptionSet spell if &spl ==# 'en' | setl spl=en_us,cjk | endif
  " end

  " FcitxRemote "{{{1

  if executable('fcitx-remote')
    " -e: ask fcitx to exit
    " -r: reload fcitx config
    " -c: inactivate input method
    " -o: activate input method
    " Note: 'FocusLost' to `fcitx-remote -o` will activate fcitx when switching
    "   to another vim
    "au FocusLost   * call system('fcitx-remote -o')
    au FocusGained * call system('fcitx-remote -c')
  endif

  " RegisterModify "{{{1
  au FocusGained *.toml if @+ !~# '^https://' && @+ !~# "\<NL>$" | let @+ .= "\<NL>" | endif
augroup END
