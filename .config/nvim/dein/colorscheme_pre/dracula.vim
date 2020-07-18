" TOML: colorscheme.toml
" Repo: flazz/vim-colorschemes
" Ref: post/colorschemes.vim
" Ref: source/colorschemes.vim

function! s:my_dracula() abort
  hi! ErrorMsg ctermfg=231 ctermbg=212 guifg=#7411a8 guibg=#ff79c6 cterm=bold gui=bold
  hi! WarningMsg ctermfg=231 ctermbg=212 guifg=#7411a8 guibg=#ff79c6 cterm=bold gui=bold

  hi! NonText ctermfg=231 guifg=#8d94b7

  hi! Statement ctermfg=212 guifg=#fe82e3
  hi! Identifier ctermfg=117 guifg=#b2fd8b
  hi! Type ctermfg=117 guifg=#8be9fd

  hi! link SignColumn Number

  hi! Comment ctermfg=61 guifg=#ababab
  hi! Folded ctermfg=61 guifg=#7988b8 ctermbg=235 guibg=#282a36

  hi! Visual ctermbg=128 guibg=#af00df

  hi! Search ctermfg=236 guifg=#353917 ctermbg=180 guibg=#b5b5e8 cterm=bold gui=bold

  hi! SpecialKey ctermfg=231 guifg=#69743f ctermbg=235

  hi! Error ctermfg=9 guifg=Red ctermbg=NONE guibg=NONE cterm=bold gui=bold

  hi! DiffChange ctermfg=179 guifg=#d7af5f ctermbg=NONE guibg=NONE cterm=bold gui=bold
  hi! DiffRemove ctermfg=167 guifg=#fb4934 ctermbg=NONE guibg=NONE cterm=bold gui=bold
  hi! DiffAdd    ctermfg=74  guifg=#3dff17 ctermbg=NONE guibg=NONE cterm=bold gui=bold
  hi! DiffText   ctermfg=208 guifg=#fe8019 ctermbg=NONE guibg=NONE cterm=bold gui=bold

  if exists('&winblend')
    set winblend=40
  endif
  hi! NormalFloat ctermfg=190 guifg=#cfbd2f ctermbg=22 guibg=#0b4100 cterm=bold gui=bold
endfunction

if exists('#myDraculaPre') | finish | endif
augroup myDraculaPre
  au Colorscheme dracula ++nested call s:my_dracula()
augroup END
