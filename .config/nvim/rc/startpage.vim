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

    let s:match = {list -> index(list, a:page) >= 0}
    "function! s:match(list) closure abort
    "  return index(a:list, a:page) >= 0
    "endfunction
    if a:page ==# 'mdwiki'
      e ~/vimwiki/mdwiki/index.md
    elseif s:match(['task', 'taskwiki'])
      e ~/vimwiki/tasks.wiki
    elseif s:match(['wiki', 'vimwiki'])
      VimwikiIndex
    elseif a:page ==# 'diary'
      e ~/vimwiki/diary/index.wiki
    elseif s:match(['term', 'terminal', 'fish'])
      call termopen('fish')
      setl nonumber signcolumn=no
    elseif isdirectory(a:page) || filereadable(a:page)
      Defx a:page -a:page
    else
      Defx `expand('<amatch>')` -`expand('<amatch>')`
    endif
  endfunction
  " FIXME: the arg is 'term' causes an echoerr:
  "        'Can only call this function in an unmodified buffer'
  au! VimEnter * ++nested silent! call s:startpage('terminal')
augroup END
