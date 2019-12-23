" From: init.vim

augroup BufTypeAdjustment
  au! BufRead $XDG_DATA_HOME/Trash/**/* setl bt=nofile
augroup END

augroup FileTypeAdjustment
  au!
  au BufNewFile,BufRead *.txt    setl syn=help
  au BufNewFile,BufRead *.snip   setl ft=neosnippet
  au BufNewFile,BufRead *.dict   setl ft=skkdict
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

augroup FoldMethodDetection
  au!
  au FileType json       setl fdm=syntax
  au FileType neosnippet setl fdm=indent

  au BufRead * if line('w$') != line('$') | setl fdl=1 | endif
  au BufWinEnter *
        \ if &fdm ==# ('manual' || 'syntax')
        \ && search('{{{\%[\d]$', 'cwn')
        \ | setl fdm=marker | endif
augroup END

augroup ReturnToUsualWindow
  au! BufWinLeave,BufWinEnter * call s:adjust_winfix()
augroup END

function! s:adjust_winfix() abort "{{{1
  if &bt ==# '' | return | endif

  let b:fixwidth  = &winfixwidth
  let b:fixheight = &winfixheight

  setl nowinfixwidth
  setl nowinfixheight

  exe get(b:, 'fixwidth',  0) ? 'setl wfh' : 'setl nowfh'
  exe get(b:, 'fixheight', 0) ? 'setl wfw' : 'setl nowfw'
endfunction
