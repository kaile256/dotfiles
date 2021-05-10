" Ref: colorscheme.toml
" From: init.vim

let s:colorscheme = 'spring-night'

function! s:common() abort
  " " Converted from Lava schemes in
  " " https://github.com/fish-shell/fish-shell/raw/daa3ae4be1ac6317861bdfab6e1beff80f26201d/share/tools/web_config/js/colorutils.js
  " let g:terminal_ansi_colors = [
  "      \ '#232323',
  "      \ '#FF9400',
  "      \ '#BF8330',
  "      \ '#A66000',
  "      \ '#FFAE40',
  "      \ '#FFC473',
  "      \ '#FFC000',
  "      \ '#BF9C30',
  "      \ '#A67D00',
  "      \ '#FFD040',
  "      \ '#FFDD73',
  "      \ '#FF4C00',
  "      \ '#BF5B30',
  "      \ '#A63100',
  "      \ '#FF7940',
  "      \ '#FF9D73',
  "      \ ]
  " if has('nvim')
  "   for idx in range(0, 15)
  "     let {'g:terminal_color_'. idx} = g:terminal_ansi_colors[idx]
  "   endfor
  "   unlet g:terminal_ansi_colors
  " endif
  "
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
  hi! TODO ctermfg=15 guifg=#e6e5e5 ctermbg=NONE guibg=NONE cterm=bold gui=bold
  " NormalNC: Colors for unfocused windows.
  hi! NormalNC ctermfg=249 guifg=#d2d2d2

  " NormalFloat: color for winblend, or floating windows
  hi! NormalFloat ctermfg=236 ctermbg=180 guibg=#3a192c guifg=#c5bf6a
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
    exe 'colorscheme' s:colorscheme
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
