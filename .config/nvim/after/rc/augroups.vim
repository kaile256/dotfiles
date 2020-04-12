" From: init.vim

augroup myAugroups
  if exists('#myAugroups') | au! myAugroups
  endif
  " AutoWinResize "{{{1
  au VimResized * wincmd =

  " Open QuickFix on some commands {{{1
  au QuickFixCmdPost grep,helpgrep cwindow
  au QuickFixCmdPost lhelpgrep lwindow

  " XinputToggle "{{{1
  " TODO: disable only the touchpad except mouse buttons
  exe 'au InsertEnter,'. $TermOpen "* call system('xinput disable Elan\\ TrackPoint')"
  exe 'au InsertEnter,'. $TermOpen "* call system('xinput disable Elan\\ Touchpad')"
  au FocusLost,VimLeave * call system('xinput enable  Elan\ TrackPoint')

  " FileTypeAdjustment "{{{1
  " Note: `:setfiletype` cannot override filetype;
  "   no consideration to use it instead

  " FIXME: set ft=xdefaults
  au BufNewFile,BufRead {.Xresources.d,X11}**/* setl ft=xdefaults

  au BufNewFile,BufRead .vmailrc setl ft=yaml

  au BufWinEnter .*
        \ if &ft ==# ''
        \ && search('fi$\|esac$', 'cwn')
        \ | setl ft=sh | endif

  au BufNewFile,BufRead **/*conf*
        \ if (&ft ==# '' || &ft ==# 'conf')
        \ && &ft !=# 'tmux'
        \ | setl ft=dosini |
        \ endif

  " SyntaxAdjustment "{{{1

  au BufNewFile,BufRead *.txt      setl syn=help
  au BufNewFile,BufRead .gitignore setl syn=netrw
  "au FileType sh if getline(1) =~# 'bash$' | setl ft=bash syn=sh | endif

  " BufTypeAdjustment "{{{1

  au BufRead $XDG_DATA_HOME/Trash**/* setl bt=nofile
  " Ref: https://twitter.com/_tyru_/status/1209126520511315969
  au BufRead *.log,/tmp**/* setl backupcopy=yes

  " FoldAdjustment "{{{1

  " Note: fdm=syntax on json sometimes shows only '{ <blank>' line.
  au FileType json setl fdm=syntax

  au FileType yaml if expand('%:p') =~# 'qutebrowser' | setl fdl=3 | endif

  au BufRead * if line('w$') < line('$') | setl fdl=0 | endif
  au BufRead * norm! zv
  au BufWinEnter,InsertLeave,TextChanged * call s:set_fdm_marker()
  function! s:set_fdm_marker() abort "{{{2
    if !&modifiable | return | endif

    if &fdm =~# 'diff\|expr' | return | endif

    if &diff && &fdm !=# 'diff'
      setl fdm=diff
      call s:update_undo_fdm()
      return

    elseif &foldexpr =~# '\(#\)\|\(^\u\).*)$' && &fdm !=# 'expr'
      " FIXME: set fdm=expr reasonably
      "   !&foldexpr sets fdm=expr
      "   &foldexpr =~# '#\|\(^\u\).*)$' sets fdm=expr
      setl fdm=expr
      call s:update_undo_fdm()
      return
    endif

    if &fdm !=# 'marker'
      if search('{{{\%[\d]$', 'cwn')
        setl fdm=marker
        call s:update_undo_fdm()
      endif
    elseif &fdm !=# &g:fdm && &fdm ==# 'marker'
          \ && !search('{{{\%[\d]', 'cwn')
      setl fdm<
    endif
  endfunction

  function! s:update_undo_fdm() abort "{{{2
    if exists('b:undo_ftplugin')
      let b:undo_ftplugin .= ' | '
    else
      let b:undo_ftplugin = ''
    endif
    let b:undo_ftplugin .= 'setl fdm<'
  endfunction

  " IsFileNameAdjustment "{{{1

  au FileType dosini setl isfname-==

  " Alert "{{{1
  " checktime: check if any buffers are changed out of the process.
  "   With 'autoread', it will update the buffer w/o asking.
  set noautoread
  " au FocusGained * checktime
  au BufRead /etc/{sudoers,sudoers.d/*} setl nomodifiable
        \ | echoerr " You'd better edit by $ visudo"

  " FindAlternate "{{{1
  au BufWinEnter .config/*vim**/* call s:find_alternate()
  function! s:find_alternate() abort "{{{2
    if v:hlsearch | return | endif

    let alter = expand('#:t')
    if empty(alter) || !search(alter, 'cWn') | return | endif

    call search(alter, 'cW')
    norm! zv
    let @/ = alter
    "au FindAlternate BufLeave * if exists('s:alter') | call s:hist_remove(s:alter) | endif
    "function! s:hist_remove(word) abort "{{{3
    "  silent! if !search(a:word, 'cWn') && histget('/') ==# a:word
    "  call histdel('/', -1)
    "  let @/ = histget('/', -1)
    "  silent! unlet alter
    "  endif
    "endfunction
  endfunction

  "}}}2

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
  " " AutoColorColumn "{{{1
  "
  "  au BufRead * call s:set_colorcolumn()
  "  function! s:set_colorcolumn() abort
  "    if &tw == 0 | return | endif
  "    exe 'setl colorcolumn=' &tw + 1
  "  endfunction
  " " followSymbolicLinkhome "{{{1
  " FIXME: be available
  "
  "   " BufReadPre *cannot* read another buffer
  "   au BufReadCmd * call s:reread(resolve(expand('<afile>')))

  " function! s:reread(path) abort "{{{2
  "   " Ref: http://takegue.hatenablog.com/entry/2014/12/15/053320
  "   if a:path ==# bufname('%') | return | endif

  "   let pos = getpos('.')
  "   " this function is to be used by BufReadCmd, use `:new` instead of `:enew`.
  "   new
  "   " unless `:bwipeout`, `:e` only reopens current buffer.
  "   exe 'bw' bufname('%')
  "   exe 'e'   a:path
  "   call setpos('.', pos)
  " endfunction
augroup END
