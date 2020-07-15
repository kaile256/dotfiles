" TOML: colorscheme.toml
" Repo: flazz/vim-colorschemes
" Another: source/colorschemes.vim

augroup myColorschemesPost
  au VimEnter * ++nested call s:set_colorscheme()
  " set variables on the colorscheme
  au ColorScheme * ++nested exe 'runtime source/<amatch>.vim'
  " overrides original colorschemes
  au ColorSchemePre * ++nested exe 'runtime colorscheme_pre/<amatch>.vim'
  au ColorSchemePre * ++nested exe 'runtime colorscheme_pre/'.
        \ matchstr('<amatch>', '\S\{-}\ze_') .'.vim'
augroup END

function! s:set_colorscheme() abort
  try
    if executable('xinput')
      if expand($TERM) =~# 'rxvt'
        colorscheme gruvbox
      elseif system('xrandr --query | grep " connected"') =~# 'HDMI'
        colorscheme dracula
      else
        " colorscheme palenight
        colorscheme onedark
      endif

    else
      colorscheme sonokai
    endif

  catch /E185/
    colorscheme slate
  endtry
endfunction
