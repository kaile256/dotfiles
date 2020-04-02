" TOML: textobj.toml
" Repo: kana/vim-textobj-entire
" Another: add/textobj-entire.vim

function! s:unmap_textobj_entire(key) abort
  for mode in ['o', 'x']
    if mapcheck(a:key, mode) =~# '<Plug>(textobj-entire-[ai])'
      exe mode .'unmap' a:key
    endif
  endfor
endfunction

call s:unmap_textobj_entire('ie')
call s:unmap_textobj_entire('ae')

delfunction s:unmap_textobj_entire
