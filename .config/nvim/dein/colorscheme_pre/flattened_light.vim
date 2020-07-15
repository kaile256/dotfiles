" TOML: appearance.toml
" Repo: flazz/vim-colorschemes
" Ref: post/colorschemes.vim
" Ref: source/colorschemes.vim
" Another: source/flattened_light.vim

augroup myFlattenedLight
  au Colorscheme flattened_light ++nested call s:my_flattened()
augroup END

function! s:my_flattened() abort
endfunction
