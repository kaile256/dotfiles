" From: filefinder.toml
" Repo: junegunn/fzf.vim
" Another: add/fzf.vim
" Another: source/fzf.vim
" Another: post/fzf.vim

let s:path_dict = {
      \ 'v': g:nvim_home,
      \ 'l': $XDG_DATA_HOME,
      \ 'f': $XDG_CONFIG_HOME,
      \ 'd': g:dotfiles_home,
      \ 'q': $GHQ_ROOT,
      \ 'r': $VIMRUNTIME,
      \ 't': g:my_trash_root,
      \ 'h': '~',
      \ 'w': '%:p:h',
      \ 'n': '%:p:h',
      \ '.': '.',
      \ '': '%:p:h',
      \ 'm': $MYMEMO,
      \ }

function! s:fzf_maps(prefix, command, ...) abort
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

    let rhs = l:cd .'<bar>'. a:command .'<cr>'

    let modes = a:0 > 0 ? a:1 : 'nx'
    let modes = split(modes, '\ze')

    for mode in modes
      exe mode .'noremap ' lhs rhs
    endfor

  endfor
endfunction

call s:fzf_maps('<space>z', 'Fzf')
call s:fzf_maps('<space>r', 'Rg')
call s:fzf_maps('<space>a', 'Ag', 'n')
