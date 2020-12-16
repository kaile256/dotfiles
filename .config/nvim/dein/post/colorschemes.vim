" TOML: colorscheme.toml
" Repo: flazz/vim-colorschemes
" Another: source/colorschemes.vim

augroup myColorschemesPost
  au ColorSchemePre * ++nested call s:source_conf(expand('<amatch>'))
  au VimEnter * ++nested call s:set_colorscheme()
augroup END

function! s:source_conf(fname) abort
  " set variables on the colorscheme
  exe 'runtime source/'. a:fname .'.vim'
  " overrides original colorschemes
  exe 'runtime colorscheme_pre/'. a:fname .'.vim'

  let trimmed = matchstr(a:fname, '\S\{-}\ze_')
  if trimmed ==# '' | return | endif
  " Also source the scripts trimmed before the first underscore.
  exe 'runtime source/'. trimmed .'.vim'
  exe 'runtime colorscheme_pre/'. trimmed .'.vim'
endfunction

function! s:set_colorscheme() abort
  try
    colorscheme spring-night
  catch /E185/
    colorscheme slate
  endtry
endfunction
