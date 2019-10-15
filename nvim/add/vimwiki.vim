" From: memo.toml
" Repo: vimwiki/vimwiki
" Path: vimwiki/vimwiki_dev
" Another: source/vimwiki.vim

let g:vimwiki_home = '~/vimwiki'
" Hotkey; Index {{{1
command! MdwikiIndex :e ~/vimwiki/mdwiki/index.md
command! TaskwikiIndex :e ~/vimwiki/task.wiki
nnoremap <silent> <space>k<a-e> :<c-u>TaskwikiIndex <cr>
nnoremap <silent> <space>k<a-b> :<c-u>tab sp <bar> TaskwikiIndex <cr>
nnoremap <silent> <space>k<a-v> :<c-u>vs <bar> TaskwikiIndex <cr>
nnoremap <silent> <space>k<a-s> :<c-u>sp <bar> TaskwikiIndex <cr>
" Hotkey; Diary Today {{{1
" dafault: -count=0, which makes me jump up to current root.
" when <count> < 0, always brings me to *.wiki.
command! VimwikiToday :call vimwiki#diary#make_note(-1)
command! Diary :call vimwiki#diary#make_note(-1)
"nnoremap <silent> <space>ye     :e <bar> VimwikiToday<cr>
"nnoremap <silent> <space>yb     :tabe <bar> VimwikiToday<cr>
"nnoremap <silent> <space>ys     :sp <bar> VimwikiToday<cr>
"nnoremap <silent> <space>yv     :vs <bar> VimwikiToday<cr>

function! s:my_startpage(page) "{{{1
  if @% ==# '' && &ft ==# '' && &bt ==# '' && getline(1,'$') ==# ['']
    if a:page ==# 'mdwiki'
      e ~/vimwiki/mdwiki/index.md
    elseif a:page ==# 'wiki' || a:page ==# 'vimwiki'
      VimwikiIndex
    elseif a:page ==# 'task'
      e ~/vimwiki/task.wiki
    elseif a:page ==# 'diary'
      e ~/vimwiki/diary/index.wiki
    elseif a:page ==# 'term'
      call termopen(&shell)
      setlocal nonumber signcolumn=no modifiable
    else
      exe 'e' a:page
    endif
  endif
endfunction "}}}

augroup SetMyStartpage "{{{1
  au!
  " To use outliner of markdown's instead, keep to use mdwiki.
  au VimEnter * ++nested call <SID>my_startpage('~/rustlings/exercises')
augroup END
