" TOML: colorscheme.toml
" Repo: flazz/vim-colorschemes
" Ref: post/colorschemes.vim
" Ref: source/colorschemes.vim
" Another: source/flattened_light.vim

function! s:my_flattened() abort
endfunction

if exists('#myFlattenedLightPre') | finish | endif
augroup myFlattenedLightPre
  au Colorscheme flattened_light ++nested call s:my_flattened()
augroup END
