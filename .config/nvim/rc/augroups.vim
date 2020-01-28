" From: init.vim

augroup myXinputToggle "{{{1
  au!
  exe 'au InsertEnter,'. $TermOpen "* call system('xinput disable Elan\ TrackPoint')"
  exe 'au InsertEnter,'. $TermOpen "* call system('xinput disable Elan\ TouchPad')"

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

  au BufRead * if line('w$') != line('$') | setl fdl=0 | endif
  au BufWinEnter,InsertLeave,TextChanged *
        \ if &bt ==# '' && &fdm ==# ('manual' || 'syntax')
        \ && search('{{{\%[\d]$', 'cwn') |
        \   setl fdm=marker
        \ | elseif &fdm ==# 'marker'
          \ && !search('{{{\%[\d]$', 'cwn') |
          \   setl fdm<
          \ | endif
augroup END

augroup myIsFileNameAdjustment "{{{1
  au!
  au FileType dosini setl isfname-==
augroup END

augroup myAlertOnFilename "{{{1
  au! BufRead /etc/{sudoers,sudoers.d/*} setl nomodifiable
        \ | echoerr " You'd better edit by $ visudo"
augroup END

augroup myFindAlternate "{{{1
  au! BufWinEnter .config/*vim**/* call s:find_alternate()
  function! s:find_alternate() abort "{{{2
    let alter = expand('#:t')
    if empty(alter) || !search(alter, 'cWn') | return | endif

    call search(alter, 'cW')
    norm! zv
    let @/ = alter
    "au! FindAlternate BufLeave * if exists('s:alter') | call s:hist_remove(s:alter) | endif
  endfunction

  function! s:hist_remove(word) abort "{{{3
    silent! if !search(a:word, 'cWn') && histget('/') ==# a:word
    call histdel('/', -1)
    let @/ = histget('/', -1)
    silent! unlet alter
  endif
endfunction
"}}}2
augroup END

augroup myReturnToUsualWindow "{{{1
  au! BufWinLeave,BufWinEnter * call s:adjust_winfix()
augroup END

function! s:adjust_winfix() abort
  if &bt ==# '' | return | endif

  let b:fixwidth  = &winfixwidth
  let b:fixheight = &winfixheight

  setl nowinfixwidth
  setl nowinfixheight

  exe get(b:, 'fixwidth',  0) ? 'setl wfh' : 'setl nowfh'
  exe get(b:, 'fixheight', 0) ? 'setl wfw' : 'setl nowfw'
endfunction

augroup mySpellLangForJapanese "{{{1
  " this one is which you're most likely to use?
  autocmd OptionSet spell if &spl ==# 'en' | setl spl=en_us,cjk | endif
augroup end
