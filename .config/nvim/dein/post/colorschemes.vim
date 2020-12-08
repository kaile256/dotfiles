" TOML: colorscheme.toml
" Repo: flazz/vim-colorschemes
" Another: source/colorschemes.vim

augroup myColorschemesPost
  au VimEnter * ++nested call s:set_colorscheme()
  au ColorSchemePre * ++nested call s:source_conf(expand('<amatch>'))
augroup END

function! s:source_conf(fname) abort
  " set variables on the colorscheme
  runtime 'source/'. a:fname .'.vim'
  " overrides original colorschemes
  runtime 'colorscheme_pre/'. a:fname .'.vim'

  let trimmed = matchstr(a:fname, '\S\{-}\ze_')
  " Also source the scripts trimmed before the first underscore.
  runtime 'source/'. trimmed .'.vim'
  runtime 'colorscheme_pre/'. trimmed .'.vim'
endfunction

function! s:set_colorscheme() abort
  try
    colorscheme spring-night
  catch /E185/
    colorscheme slate
  endtry
endfunction
