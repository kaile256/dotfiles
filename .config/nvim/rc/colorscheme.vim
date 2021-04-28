" Ref: colorscheme.toml
" From: init.vim

function! s:common() abort
  if has('nvim')
    let g:terminal_color_0  = '#2e3436'
    let g:terminal_color_1  = '#e73131'
    let g:terminal_color_2  = '#67c60c'
    let g:terminal_color_3  = '#ddb812'
    let g:terminal_color_4  = '#4383d5'
    let g:terminal_color_5  = '#b859c8'
    let g:terminal_color_6  = '#43c4cc'
    let g:terminal_color_7  = '#d3d7cf'
    let g:terminal_color_8  = '#555753'
    let g:terminal_color_9  = '#fc6868'
    let g:terminal_color_10 = '#8ae234'
    let g:terminal_color_11 = '#fce94f'
    let g:terminal_color_12 = '#729fcf'
    let g:terminal_color_13 = '#ad7fa8'
    let g:terminal_color_14 = '#00f5e9'
    let g:terminal_color_15 = '#eeeeec'
  else
    let g:terminal_ansi_colors = [
          \ '#2e3436',
          \ '#e73131',
          \ '#67c60c',
          \ '#ddb812',
          \ '#4383d5',
          \ '#b859c8',
          \ '#43c4cc',
          \ '#d3d7cf',
          \ '#555753',
          \ '#fc6868',
          \ '#8ae234',
          \ '#fce94f',
          \ '#729fcf',
          \ '#ad7fa8',
          \ '#00f5e9',
          \ '#eeeeec',
          \ ]
  endif

  hi! TermCursor cterm=reverse,underline gui=reverse,underline
  hi! TermCursorNC ctermfg=Red guifg=Red ctermbg=NONE guibg=NONE cterm=bold gui=bold

  hi! HighlightedyankRegion ctermfg=232 ctermbg=66 guifg=#000000 guibg=#df5f29
  hi! CocErrorHighlight     ctermfg=red guifg=#ff0000

  " hi! Comment guifg=#71716e

  hi! link Conceal Normal
  hi! CursorIM guibg=#fabd1f
  hi! MatchParen ctermfg=magenta guifg=#e6c50f ctermbg=yellow guibg=#8924ff cterm=bold gui=bold

  "hi Folded ctermfg=59 ctermbg=236 guifg=#5f5f5f guibg=#303030

  call s:common_dark()
endfunction

function! s:common_dark() abort
  if &background !=# 'dark' | return | endif
  hi! TODO ctermfg=15 guifg=#ffffff ctermbg=NONE guibg=NONE cterm=bold gui=bold
  " NormalNC: Colors for unfocused windows.
  hi! NormalNC ctermfg=249 guifg=#d2d2d2

  " NormalFloat: color for winblend, or floating windows
  hi! NormalFloat ctermfg=236 ctermbg=180 guibg=#3a192c guifg=#9f994a
  hi! DoppelgangerVirtualText ctermfg=64 guifg=#5f8700 cterm=italic gui=italic
  hi! DoppelgangerVirtualTextPairReverse ctermfg=130 guifg=#df5f29 cterm=italic gui=italic
endfunction

function! s:source_conf(theme, path) abort
  const underscored = substitute(a:theme, '-', '_', 'g')
  const trimmed = matchstr(a:theme, '\S\{-}\ze[-_]')
  for fname in [ a:theme, underscored, trimmed ]
    exe 'silent! source $DEIN_RC_DIR/colorscheme/'. fname .'/'. a:path
  endfor
endfunction

function! s:set_colorscheme() abort
  try
    colorscheme spring-night
  catch /E185/
    colorscheme slate
  endtry
endfunction

augroup Colorscheme/OverrideDefault
  au Colorscheme * set ambiwidth=single
  " Usually set variables for the colorscheme.
  au ColorSchemePre * ++nested call s:source_conf(expand('<amatch>'), 'sou.vim')
  " Usually override original colorscheme's highlights.
  au Colorscheme * ++nested call s:common()
  au ColorScheme * ++nested call s:source_conf(expand('<amatch>'), 'pos.vim')
  au VimEnter * ++nested call s:set_colorscheme()
  if !has('nvim')
    " Set the other color than `hl-Normal` on unfocused windows.
    autocmd WinEnter,BufWinEnter * setlocal wincolor=
    autocmd WinLeave * setlocal wincolor=NormalNC
  endif
augroup END

