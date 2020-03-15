" From: init.vim

augroup myAutoWinResize "{{{1
  au! VimResized * wincmd =
augroup END

augroup myXinputToggle "{{{1
  au!
  exe 'au InsertEnter,'. $TermOpen "* call system('xinput disable Elan\\ TrackPoint')"
  exe 'au InsertEnter,'. $TermOpen "* call system('xinput disable Elan\\ Touchpad')"

  au FocusLost,VimLeave * call system('xinput enable  Elan\ TrackPoint')
augroup END

augroup myFileTypeAdjustment "{{{1
  " Note: `:setfiletype` cannot override filetype;
  "   no consideration to use it instead
  au!
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
augroup END

augroup mySyntaxAdjustment "{{{1
  au!
  au BufNewFile,BufRead *.txt      setl syn=help
  au BufNewFile,BufRead .gitignore setl syn=netrw
  "au FileType sh if getline(1) =~# 'bash$' | setl ft=bash syn=sh | endif
augroup END

augroup myBufTypeAdjustment "{{{1
  au!
  au BufRead $XDG_DATA_HOME/Trash**/* setl bt=nofile
  " Ref: https://twitter.com/_tyru_/status/1209126520511315969
  au BufRead *.log,/tmp**/* setl backupcopy=yes
augroup END

augroup myFoldAdjustment "{{{1
  au!
  " Note: fdm=syntax on json sometimes shows only '{ <blank>' line.
  au FileType json setl fdm=syntax

  au FileType yaml if expand('%:p') =~# 'qutebrowser' | setl fdl=3 | endif

  au BufRead * if line('w$') < line('$') | setl fdl=0 | endif
  au BufRead * norm! zv
  au BufWinEnter,InsertLeave,TextChanged * call s:set_fdm_marker()
augroup END
function! s:set_fdm_marker() abort "{{{2
  if !&modifiable | return | endif

  if &diff && &fdm !=# 'diff'
    setl fdm=diff
    call s:update_undo_fdm()
    return

  elseif (&foldexpr != 0 || &foldexpr !=# '0') && &fdm !=# 'expr'
    " Note: empty() fails because &fde returns '0' in string when &fdm is expr
    setl fdm=expr
    call s:update_undo_fdm()
    return
  endif

  if &fdm ==# 'diff\|expr' | return | endif

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

augroup myIsFileNameAdjustment "{{{1
  au!
  au FileType dosini setl isfname-==
augroup END

augroup myAlert "{{{1
  " checktime: check if any buffers are changed out of the process
  au FocusGained * checktime
  au BufRead /etc/{sudoers,sudoers.d/*} setl nomodifiable
        \ | echoerr " You'd better edit by $ visudo"
augroup END

augroup myFindAlternate "{{{1
  au! BufWinEnter .config/*vim**/* call s:find_alternate()
  function! s:find_alternate() abort "{{{2
    if v:hlsearch | return | endif

    let alter = expand('#:t')
    if empty(alter) || !search(alter, 'cWn') | return | endif

    call search(alter, 'cW')
    norm! zv
    let @/ = alter
    "au! FindAlternate BufLeave * if exists('s:alter') | call s:hist_remove(s:alter) | endif
    "function! s:hist_remove(word) abort "{{{3
    "  silent! if !search(a:word, 'cWn') && histget('/') ==# a:word
    "  call histdel('/', -1)
    "  let @/ = histget('/', -1)
    "  silent! unlet alter
    "  endif
    "endfunction
  endfunction

  "}}}2
augroup END

augroup myWinfixBufLocal "{{{1
  au!
  au OptionSet wfw,wfh let b:fixwidth = &wfw | let b:fixheight = &wfh
  au BufWinLeave,BufWinEnter * call s:adjust_winfix()
augroup END

function! s:adjust_winfix() abort
  " Note: bothe wfw and wfh are local to window
  exe get(b:, 'fixwidth',  0) ? 'set wfh' : 'set nowfh'
  exe get(b:, 'fixheight', 0) ? 'set wfw' : 'set nowfw'
endfunction

augroup mySpellLangForJapanese "{{{1
  " this one is which you're most likely to use?
  autocmd OptionSet spell if &spl ==# 'en' | setl spl=en_us,cjk | endif
augroup end

augroup myFcitxRemote "{{{1
  au!
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

augroup myRegisterModify "{{{1
  au!
  au FocusGained *.toml if @+ !~# '^https://' && @+ !~# "\<NL>$" | let @+ .= "\<NL>" | endif
augroup END
" augroup myAutoColorColumn "{{{1
"  au!
"  au BufRead * call s:set_colorcolumn()
"  function! s:set_colorcolumn() abort
"    if &tw == 0 | return | endif
"    exe 'setl colorcolumn=' &tw + 1
"  endfunction
" augroup END
" augroup followSymbolicLinkhome "{{{1
" FIXME: be available
"   au!
"   " BufReadPre *cannot* read another buffer
"   au BufReadCmd * call s:reread(resolve(expand('<afile>')))
" augroup END

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
