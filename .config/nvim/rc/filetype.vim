" From: init.vim

augroup AppendFileType
  au!
  au BufNewFile,BufRead *.txt    setl syn=help
  au BufNewFile,BufRead *.snip   setl ft=neosnippet
  au BufNewFile,BufRead *.dict   setl ft=skkdict
  au BufNewFile,BufRead .vmailrc setl ft=yaml

  au BufNewFile,BufRead i3/**{config,.conf} setl ft=i3
  au BufWinEnter {dotfiles,config}** setl fdm=marker
augroup END

augroup AppendPathToFind
  au!
  au FileType python setl path^=/usr/lib/python3.7/
  au FileType go     setl path^=/usr/lib/go/
augroup END

augroup MyRuntimesOnFileTypes
  au!
  au FileType vim      runtime! vim.vim
  au FileType toml     runtime! toml.vim
  au FileType markdown runtime! markdown.vim
  au FileType i3       runtime! i3.vim
  au FileType qf       runtime! qf.vim
  au FileType help     runtime! help.vim
  command! -bang -bar -range=0 -complete=customlist,man#complete -nargs=* Man
        \ if <bang>0 | set ft=man |
        \ else | call man#open_page(v:count, v:count1, <q-mods>, <f-args>)
        \ | runtime! help.vim | endif
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

  exe get(b:, 'fixwidth',  0) ? 'setl winfixwidth'  : 'setl nowinfixwidth'
  exe get(b:, 'fixheight', 0) ? 'setl winfixheight' : 'setl nowinfixheight'
endfunction
