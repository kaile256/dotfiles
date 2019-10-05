" From: tool.toml

let g:voom_tree_placement = 'right'
let g:voom_python_versions = [3,2]

augroup VoomOnFileType

  au!
  au FileType voomtree setlocal nonumber signcolumn=
  au FileType voomtree nnoremap <silent><buffer> <a-b> :q!<CR>
  au FileType vimwiki  nnoremap <silent><buffer> <a-b> :VoomToggle vimwiki<cr>
  au FileType org      nnoremap <silent><buffer> <a-b> :VoomToggle org<cr>
  au FileType html     nnoremap <silent><buffer> <a-b> :VoomToggle html<cr>
  au FileType markdown nnoremap <silent><buffer> <a-b> :VoomToggle markdown<cr>
  au FileType pandoc   nnoremap <silent><buffer> <a-b> :VoomToggle pandoc<cr>
  au FileType tex      nnoremap <silent><buffer> <a-b> :VoomToggle latex<cr>
  au FileType python   nnoremap <silent><buffer> <a-b> :VoomToggle python<cr>

augroup END
