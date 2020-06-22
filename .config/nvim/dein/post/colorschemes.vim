" From: appearance.toml
" Repo: flazz/vim-colorschemes
" Another: source/colorschemes.vim

augroup myColorschemesPost
  if exists('#myColorschemesPost') | au! myColorschemesPost
  endif
  au VimEnter * ++nested call s:set_colorscheme()
  " set variables on the colorscheme
  au ColorScheme * ++nested exe 'runtime source/<amatch>.vim'
  " overrides original colorschemes
  au ColorSchemePre * ++nested exe 'runtime colorscheme_pre/<amatch>.vim'
augroup END

function! s:set_colorscheme() abort
  try
    if executable('xinput')
      if expand($TERM) =~# 'rxvt'
        colorscheme gruvbox
      elseif system('xrandr --query | grep " connected"') =~# 'HDMI'
        colorscheme dracula
      else
        colorscheme neodark
      endif

    else
      colorscheme sonokai
    endif

  catch /E185/
    colorscheme slate
  endtry
endfunction
