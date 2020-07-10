" From: finder.toml
" Repo: zgpio/tree.nvim
" Another: add/tree.vim

call tree#custom#option('_', {
      \ 'root_marker': '',
      \ 'columns': 'mark:git:indent:icon:filename:size',
      \ })

augroup myTreePost
  au!
  au FileType tree call s:tree_keymaps()
augroup END

function! s:tree_keymaps() abort

  nnoremap <silent><buffer><expr> h tree#action('cd', ['..'])
  nnoremap <silent><buffer><expr> l tree#action('open')
  " nnoremap <silent><buffer><expr> cd tree#action('cd', '.')
  nnoremap <silent><buffer><expr> \ tree#action('cd', getcwd())
  nnoremap <silent><buffer><expr> ~ tree#action('cd')

  nnoremap <silent><buffer><expr> z. tree#action('toggle_ignored_files')

  nnoremap <silent><buffer><expr> o tree#action('drop', 'split')
  nnoremap <silent><buffer><expr> O tree#action('open', 'vsplit')

  nnoremap <silent><buffer><expr> <CR>  tree#action('drop')
  nnoremap <silent><buffer><expr> <C-j> tree#action('drop')

  nnoremap <silent><buffer><expr> mm tree#action('toggle_select')
  nnoremap <silent><buffer><expr> mj tree#action('toggle_select') .'j'
  nnoremap <silent><buffer><expr> mk tree#action('toggle_select') .'k'
  nnoremap <silent><buffer><expr> ma tree#action('toggle_select_all')

  " nnoremap <silent><buffer><expr> <C-l> tree#action('redraw')
  nnoremap <silent><buffer><expr> <C-g> tree#action('print')

  nnoremap <silent><buffer><expr> za tree#action('open_or_close_tree')
  nnoremap <silent><buffer><expr> zO tree#action('open_tree_recursive')

  nnoremap <silent><buffer><expr> R tree#action('rename')

  nnoremap <silent><buffer><expr> D  tree#action('remove_trash')
  nnoremap <silent><buffer><expr> \D tree#action('remove')

  nnoremap <silent><buffer><expr> % tree#action('new_file')
  nnoremap <silent><buffer><expr> X tree#action('execute_system')

  nnoremap <silent><buffer><expr> yp tree#action('yank_path')

endfunction
