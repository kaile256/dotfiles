" TOML: insert.toml
" Repo: cohama/lexima.vim

" let g:lexima_map_escape = '<Ignore>'
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

  let save_view = winsaveview()

  let pairs_removeable_always = ['\\\%#(\zs\\)']
  let pat_to_remove_always = join(pairs_removeable_always, '\|')
  exe 'keeppattern keepjump s/'. pat_to_remove_always .'//e'

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
        \ map(deepcopy(pairs_removeable_at_the_end_of_the_line),
        \ 'substitute(v:val, "$", pat_line_continue, "")')

  let pat_followed_by_symbols = '\\ze[[({]'
  " let pat_followed_by_symbols = '\\ze[][=+-_|(){}\:;?/>.~`!@#$%^&*"'']'
  let pairs_removeable_next_to_symbols =
        \ map(deepcopy(pairs_removeable_next_to_symbols),
        \ 'substitute(v:val, "$", pat_followed_by_symbols, "")')

  let pairs_removeable = pairs_removeable_at_the_end_of_the_line
        \ + pairs_removeable_next_to_symbols
  let pat = join(pairs_removeable, '\|')

  exe 'keeppattern keepjump s/'. pat .'//e'
  call winrestview(save_view)
endfunction

