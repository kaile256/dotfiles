function! keymap#generater(prefix, cmd, opt) abort
  if exists('g:mylib_keymap_split_list')
    "let l:split_dict = deepcopy(g:mylib_keymap_split_dict)
    let l:split_dict = {
          \ 'edit': '<a-e>',
          \ 'split': '<a-s>',
          \ 'vsplit': '<a-v>',
          \ 'tabe': '<a-t>',
          \ 'float': '<a-f>',
          \ }
  else
    let l:split_dict = {
          \ 'edit': 'e',
          \ 'split': 's',
          \ 'vsplit': 'v',
          \ 'tabe': 't',
          \ 'float': 'f',
          \ }
  endif

  " TODO: associate floating window
  let l:split_dict['float'] = l:split_dict['float']
  let l:split_list = ['edit', 'split', 'vsplit', 'tabe']
  let l:path_dict = {
        \ '~'           : '',
        \ g:nvim_home   : 'v',
        \ g:cache_home  : 'c',
        \ g:config_home : 'f',
        \ g:dotfiles_home : 'd',
        \ '/'           : 'r',
        \ ''            : '.',
        \ '%:p:h'       : 'w',
        \ }

  for l:key in l:split_list
    for l:path in keys(l:path_list)
      exe 'nnoremap <silent> '.
            \ a:prefix . l:path_dict[l:path] . l:split_dict[l:key]
            \ .' :<c-u>cd '. l:path .'<bar>'. l:key .'<bar>' a:cmd .' '. a:opt .'<cr>'
    endfor
  endfor
endfunction
