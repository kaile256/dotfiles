" From: init.vim

let s:path_dict = {
      \ '': '%:p:h',
      \ '.': '.',
      \ 'd': g:dotfiles_home,
      \ 'f': $XDG_CONFIG_HOME,
      \ 'h': '~',
      \ 'l': $XDG_DATA_HOME,
      \ 'm': $MYMEMO,
      \ 'n': '%:p:h',
      \ 'q': $GHQ_ROOT,
      \ 'r': $VIMRUNTIME,
      \ 't': g:my_trash_root,
      \ 'v': g:nvim_home,
      \ 'w': '%:p:h',
      \ }

let s:splits = {
     \ '<a-v>': 'vs',
     \ '<a-t>': 'tabe',
     \ '<a-s>': 'sp',
     \ '<a-e>': 'e',
     \ '<a-E>': 'only',
     \ '<a-o>': 'only',
     \ }

function! s:maps(prefix, command, ...) abort
  " To: like :Fzf
  let map_arg = '<silent>'
  let lhs_raw = map_arg . a:prefix

  for l:key in keys(s:path_dict)
    let lhs = lhs_raw . l:key

    if s:path_dict[l:key] =~# '^:'
      " To: otherwise, commands to cd.
      " Note: if E:trainling-character, check if ':command -bar' in plugin's vimscript.
      let l:cd = s:path_dict[l:key]
    else
      let l:cd = ':<c-u>cd '. s:path_dict[l:key]
    endif

    let modes = a:0 > 0 ? a:1 : 'nx'
    let modes = split(modes, '\ze')

    for l:key in keys(s:splits)
      let rhs = l:cd .'<bar>'. s:splits[l:key] .'<bar>'. a:command .'<cr>'
      for mode in modes
        exe mode .'noremap ' lhs . l:key  rhs
      endfor
    endfor

  endfor
endfunction

" type 't' with pressed <space> as <a-t>
call s:maps('<space>t', 'te fish')
unlet s:path_dict s:splits
