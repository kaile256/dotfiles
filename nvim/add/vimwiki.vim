" From: memo.toml
" Repo: vimwiki/vimwiki
" Path: vimwiki/vimwiki_dev
" Another: source/vimwiki.vim

" Hotkey; Index {{{1
command! MdwikiIndex :e ~/vimwiki/mdwiki/index.md
nnoremap <silent> <space>ke :<c-u>VimwikiIndex <cr>
nnoremap <silent> <space>kb :<c-u>tab sp <bar> VimwikiIndex <cr>
nnoremap <silent> <space>kv :<c-u>vs <bar> VimwikiIndex <cr>
nnoremap <silent> <space>ks :<c-u>sp <bar> VimwikiIndex <cr>
" Hotkey; Diary Today {{{1
" dafault: -count=0, which makes me jump up to current root.
" when <count> < 0, always brings me to *.wiki.
command! VimwikiToday :call vimwiki#diary#make_note(-1)
nnoremap <silent> <space>ye     :e <bar> VimwikiToday<cr>
nnoremap <silent> <space>yb     :tabe <bar> VimwikiToday<cr>
nnoremap <silent> <space>ys     :sp <bar> VimwikiToday<cr>
nnoremap <silent> <space>yv     :vs <bar> VimwikiToday<cr>

function! s:my_startpage(page) "{{{1
  if @% ==# '' && &ft ==# '' && &bt ==# '' && getline(1,'$') ==# ['']
    if a:page ==# 'mdwiki'
      e ~/vimwiki/mdwiki/index.md
    elseif a:page ==# 'wiki' || a:page ==# 'vimwiki'
      VimwikiIndex
    elseif a:page ==# 'diary'
      e ~/vimwiki/diary/index.wiki
    elseif a:page ==# 'term'
      call termopen(&shell)
      setlocal nonumber signcolumn=no modifiable
    endif
  endif
endfunction "}}}

augroup CallMyVimwikiFunc "{{{1
  au!
  " To use outliner of markdown's instead, keep to use mdwiki.
  au VimEnter * ++nested call <SID>my_startpage('vimwiki')
augroup END
