" From: init.vim

augroup AppendFileType
  au!
  au BufNewFile,BufRead *.txt    setl syn=help
  au BufNewFile,BufRead *.snip   setl ft=neosnippet
  au BufNewFile,BufRead *.dict   setl ft=skkdict
  au BufNewFile,BufRead .vmailrc setl ft=yaml
augroup END

augroup DotfilesConfig
  au! BufWinEnter **/dotfiles/**/* setl fdm=marker
augroup END

augroup ReturnToUsualWindow
  au! BufWinLeave,BufWinEnter * call s:adjust_winfix()
augroup END

function! s:adjust_winfix() abort "{{{1
  if &bt == '' | return | endif

  let b:fixwidth  = &winfixwidth
  let b:fixheight = &winfixheight

  setl nowinfixwidth
  setl nowinfixheight

  exe get(b:, 'fixwidth',  0) ? 'setl wfh' : 'setl nowfh'
  exe get(b:, 'fixheight', 0) ? 'setl wfw' : 'setl nowfw'
endfunction
