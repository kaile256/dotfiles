" From: init.vim

augroup myRestoreCursor
  " Note: `:normal` regards following `| endif` as its argument.
  au BufReadPost * if &ft !~# 'commit'
       \ && line("'\"") >= 1 && line("'\"") <= line('$') |
       \ exe 'norm! g`"'
       \ | endif
augroup END

augroup myWindowAutoResize
  " Note: `VimResized` causes agonizing lag to redraw.
  au WinNew * call s:resize_window()
augroup END
function! s:resize_window() abort
  if &winfixwidth | return | endif

  const min_width = max([&columns / 3, 120])
  if &columns < min_width * 3 | return | endif

  const winnrs = range(1, winnr('$'))
  if len(winnrs) == 1 | return | endif

  let save_view = winsaveview()
  for wn in winnrs[1:-1]
    let pos = win_screenpos(wn)
    if pos[1] == 1 | continue | endif

    let winnrs_parallel = filter(deepcopy(winnrs),
         \ 'v:val < wn && win_screenpos(v:val)[0] == pos[0]')
    let cnts_para_wins = len(winnrs_parallel)
    if cnts_para_wins == 0 | continue | endif

    let col = &columns - min_width * cnts_para_wins
    if col < min_width | continue | endif

    " The window has possibly been deleted just before being resized.
    if winbufnr(wn) == -1 | continue | endif

    exe 'vertical' wn 'resize' col
  endfor

  call winrestview(save_view)
endfunction

augroup mySetReadonly
  au BufWinEnter *.{ico,icns} setlocal readonly nomodifiable
  au BufWinEnter *.{jpg,jpeg,png,gif} setlocal readonly nomodifiable
augroup END

augroup myAutoUpdateColorColumn
  au OptionSet textwidth let &colorcolumn = (&tw > 50 ? &tw : &g:tw) + 1
augroup END

augroup myWriteImmidiatelyOnRead
  au FileReadPost * if filewritable(expand('%:p')) | w | endif
augroup END

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
augroup END
