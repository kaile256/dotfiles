" TOML: default.toml
" Repo: junegunn/vim-peekaboo
" Another: add/peekaboo.vim

let g:peekaboo_no_default_mappings = 1

let g:peekaboo_window = 'call peekaboo#floating_window()'

function! peekaboo#floating_window() abort
  " Ref: https://github.com/junegunn/fzf.vim/issues/664

  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let width = float2nr(&columns - (&columns * 1 / 10))
  let height = &lines - 2
  let y = &lines - 10
  let x = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': y,
        \ 'col': x,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
