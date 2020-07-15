" TOML: default.toml
" Repo: will133/vim-dirdiff

if exists('#myDirdiffAdd') | au! myDirdiffAdd
endif
augroup myDirdiffAdd
  au FileType defx call s:dirdiff_on_defx()
augroup END

function! s:dirdiff_on_defx() abort
  nnoremap <expr><silent><nowait><buffer> gc
        \ defx#do_action('call', '<SID>DirDiff')
endfunction

function! s:DirDiff(context) abort
  let paths = a:context['targets']
  call filter(paths, 'isdirectory(v:val)')
  if len(paths) != 2
    echoerr '[DirDiff] Invalid Arguments: You must select just 2 directories'
  else
    let [dir1, dir2] = paths
    tabnew
    exe 'DirDiff' dir1 dir2
  endif
  call defx#async_action('clear_select_all')
endfunction
