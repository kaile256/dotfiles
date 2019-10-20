
augroup SetMyStartpage
  au! VimEnter * ++nested call <SID>my_startpage('taskwiki')
  function! s:my_startpage(page) "{{{1
    if @% ==# '' && &ft ==# '' && &bt ==# '' && getline(1,'$') ==# ['']
      if a:page ==# 'mdwiki'
        e ~/vimwiki/mdwiki/index.md
      elseif a:page ==# 'wiki' || a:page ==# 'vimwiki'
        VimwikiIndex
      elseif a:page ==# 'task' || a:page ==# 'taskwiki'
        e ~/vimwiki/task.wiki
      elseif a:page ==# 'diary'
        e ~/vimwiki/diary/index.wiki
      elseif a:page ==# 'term'
        call termopen(&shell)
        setlocal nonumber signcolumn=no modifiable
      else
        exe 'Defx' a:page
      endif
    endif
  endfunction "}}}1
augroup END
