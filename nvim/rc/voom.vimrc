" From: tool.toml

let g:voom_tree_placement = "right"
let g:voom_python_versions = [3,2]

augroup VoomOnFileType

  au!
  au FileType voomtree setlocal nonumber signcolumn=
  au FileType voomtree nnoremap <silent><buffer> <a-u> :q!<CR>
  au FileType vimwiki  nnoremap <silent><buffer> <a-u> :VoomToggle vimwiki<cr>
  au FileType org      nnoremap <silent><buffer> <a-u> :VoomToggle org<cr>
  au FileType html     nnoremap <silent><buffer> <a-u> :VoomToggle html<cr>
  au FileType markdown nnoremap <silent><buffer> <a-u> :VoomToggle markdown<cr>
  au FileType pandoc   nnoremap <silent><buffer> <a-u> :VoomToggle pandoc<cr>
  au FileType tex      nnoremap <silent><buffer> <a-u> :VoomToggle latex<cr>
  au FileType python   nnoremap <silent><buffer> <a-u> :VoomToggle python<cr>

augroup END
