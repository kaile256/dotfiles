" From: fugitive.toml

function! Flogdiff(mods) abort
  let l:path = fnameescape(flog#get_state().path[0])
  let l:commit = flog#get_commit_data(line('.')).short_commit_hash
  call flog#preview(a:mods . ' split ' . l:path . ' | Gvdiff ' . l:commit)
endfunction

augroup flog
  autocmd FileType floggraph command! -buffer -nargs=0 Flogdiff call Flogdiff('<mods>')
augroup END
