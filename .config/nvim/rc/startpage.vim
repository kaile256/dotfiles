" From: init.vim

augroup SetMyStartpage
  " Note: '++nested' is necessary for syntax
  function! s:startpage(page) abort
    if expand('<amatch>') !=# ''
          \ && &ft !=# ''
          \ && &bt !=# ''
          \ && getline(1,'$') !=# ['']
      return
    endif

    if a:page ==# 'mdwiki'
      e ~/vimwiki/mdwiki/index.md
    elseif a:page ==# ('task' || 'taskwiki')
      e ~/vimwiki/tasks.wiki
    elseif a:page ==# ('wiki' || 'vimwiki')
      VimwikiIndex
    elseif a:page ==# 'diary'
      e ~/vimwiki/diary/index.wiki
    elseif a:page ==# ('term' || 'terminal' || 'fish')
      call termopen('fish')
      setl nonumber signcolumn=no
    elseif isdirectory(a:page) || filereadable(a:page)
      Defx a:page -a:page
    else
      Defx `expand('<amatch>')` -`expand('<amatch>')`
    endif
  endfunction
  au! VimEnter * ++nested call s:startpage('terminal')
augroup END
