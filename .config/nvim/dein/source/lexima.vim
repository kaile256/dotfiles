" TOML: insert.toml
" Repo: cohama/lexima.vim
" Another: add/lexima.vim
" Another: post/lexima.vim

let g:lexima_accept_pum_with_enter = 0
" call lexima#set_default_rules() manually after the plugin loaded, which
" should be done in post/ to update by ':source %'
let g:lexima_no_default_rules     = 1
let g:lexima_enable_space_rules   = 0
let g:lexima_enable_endwise_rules = 0

augroup myLeximaSource
  au InsertLeave * call s:remove_end_of_pairs()
augroup END

function! s:remove_end_of_pairs() abort "{{{1
  if !&modifiable | return | endif

  let pairs_removeable_at_the_end_of_the_line = ['\[]', '{}']
  let pairs_removeable_next_to_symbols = ['()', '``', '""', "''"]

  let pairs_set = [
        \ pairs_removeable_at_the_end_of_the_line,
        \ pairs_removeable_next_to_symbols,
        \ ]

  let before = '\v(.)(.)$'
  let after = '\1\\zs\2'
  for pairs in pairs_set
    " set patterns which represents cursor between cohesive pairs.
    let pairs = map(pairs, 'substitute(v:val, before, after, "")')
    let pairs = map(pairs, '"\\%#". v:val')
  endfor

  " Note: without double backslashes each, it doesn't work as expected.
  let pat_line_continue = '\\ze\\n\\s*\\S'
  let pairs_removeable_at_the_end_of_the_line =
        \ map(pairs_removeable_at_the_end_of_the_line,
        \ 'substitute(v:val, "$", pat_line_continue, "")')

  let symbols = '\\ze[][=+-_|(){}\:;?/>.~`!@#$%^&*"'']'
  let pairs_removeable_next_to_symbols =
        \ map(pairs_removeable_next_to_symbols,
        \ 'substitute(v:val, "$", symbols, "")')

  let pairs = pairs_removeable_at_the_end_of_the_line
        \ + pairs_removeable_next_to_symbols
  let pat = join(pairs, '\|')

  let save_view = winsaveview()
  exe 'keeppattern keepjump s/'. pat .'//e'
  call winrestview(save_view)
endfunction
