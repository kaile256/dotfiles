" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

augroup git_hash2diff/autostart
  au!
  au FileType gitrebase wincmd T
  au FileType gitrebase call git_hash2diff#start()
  " au FileType fugitive call git_hash2diff#start()
augroup END

nnoremap <silent> <Plug>(git-hash2diff-manual-update)
      \ :<C-u>call git_hash2diff#update_diff()<CR>

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo
