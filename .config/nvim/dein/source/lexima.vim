" TOML: insert.toml
" Repo: cohama/lexima.vim
" Another: add/lexima.vim
" Another: post/lexima.vim

" call lexima#set_default_rules() manually after the plugin loaded, which
" should be done in post/ to update by ':source %'
let g:lexima_no_default_rules     = 1
let g:lexima_enable_space_rules   = 0
let g:lexima_enable_endwise_rules = 0

augroup myLeximaSource
  if exists('#myLeximaSource') | au! myLeximaSource
  endif
  au InsertLeave * call s:remove_end_of_pairs()
augroup END

function! s:remove_end_of_pairs() abort "{{{1
  if col('.') != col('$') - 2
    " NOTICE: Type the other of the pairs
    "   This function will remove the end of the pair when the cursor is in the
    "   middle of them.
    return
  endif

  let pairs  = ['\[]', '{}', '()', "''", '""', '``']
  let before = '\v(.)(.)$'
  let after  = '\\%#\1\\zs\2'
  call map(pairs, 'substitute(v:val,'. string(before) .','. string(after) .', "e")')
  let pat = join(pairs, '\|')

  let g:pat = pat
  let save_view = winsaveview()
  exe 'keeppattern s/'. pat .'//e'
  call winrestview(save_view)
endfunction
