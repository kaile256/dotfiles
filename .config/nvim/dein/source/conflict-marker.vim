" TOML: git.toml
" Repo: rhysd/conflict-marker.vim

augroup myConflictMarkerPost-overrideConfig
  let g:conflict_marker_enable_mappings = 0
  au BufReadPost,BufEnter,FocusGained,ColorScheme call s:mappings_to_resolve()
augroup END

function! s:mappings_to_resolve() abort
  nmap <buffer> ]c <Plug>(conflict-marker-next-hunk)
  nmap <buffer> [c <Plug>(conflict-marker-prev-hunk)

  " Excerpt: strategies to resolve a conflict
  " <<<<<<< HEAD
  " ourselves
  " =======
  " themselves
  " >>>>>>> deadbeef0123

  " Mnemonic: Get Above one
  nmap <buffer> ga <Plug>(conflict-marker-ourselves)
  " Mnemonic: Get Below one
  nmap <buffer> gb <Plug>(conflict-marker-themselves)
  " Mnemonic: Get Both
  " both: join literary both of 'ourselves' and 'themselves'
  nmap <buffer> gB <Plug>(conflict-marker-both)
  " Mnemonic: Get them Abolished
  " none: remove both of 'ourselves' and 'themselves'
  nmap <buffer> gA <Plug>(conflict-marker-none)
endfunction
