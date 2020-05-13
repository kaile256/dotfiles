" TOML: appearance.toml
" Repo: flazz/vim-colorschemes
" Ref: post/coloschemes.vim
" Ref: source/coloschemes.vim

augroup myNeodark
  if exists('#myNeodark') | au! myNeodark
  endif
  au Colorscheme neodark ++nested call s:my_neodark()
augroup END
function! s:my_neodark() abort "{{{1
  call s:modified_diff()
  "call s:gruvbox_diff()
  " call s:neodark_diff()
endfunction

function! s:modified_diff(...) abort "{{{2
  hi! DiffChange cterm=bold gui=bold ctermfg=179 ctermbg=237 guifg=#d7af5f guibg=#3a3a3a

  hi! DiffRemove  cterm=bold gui=bold ctermfg=167 guifg=#fb4934
  hi! DiffAdd  cterm=bold gui=bold ctermfg=74  ctermbg=236 guifg=#5fafd7 guibg=#303030
  hi! DiffText cterm=bold gui=bold ctermfg=208 guifg=#fe8019

  " " for fugitive
  " hi! diffFile    cterm=bold gui=bold ctermfg=208 guifg=#fe8019
  " hi! diffNewFile cterm=bold gui=bold ctermfg=214 guifg=#fabd2f
  " "hi diffLine    cterm=bold gui=bold ctermfg=109 guifg=#83a598
  " hi! diffLine    cterm=bold gui=bold ctermfg=109 guifg=#36b383
endfunction

function! s:neodark_diff(...) abort "{{{2
  " the removed lines
  hi! DiffRemove cterm=bold gui=bold ctermfg=167 guifg=#fb4934

  " the line which has any differences
  hi! DiffChange cterm=bold gui=bold ctermfg=179 ctermbg=237 guifg=#d7af5f guibg=#3a3a3a

  " character-wise within DiffChange
  hi! DiffAdd    cterm=bold gui=bold ctermfg=108 ctermbg=237 guifg=#87af87 guibg=#3a3a3a
  hi! DiffDelete cterm=bold gui=bold ctermfg=168 ctermbg=237 guifg=#d75f87 guibg=#3a3a3a
  hi! DiffText   cterm=bold gui=bold ctermfg=74  ctermbg=236 guifg=#5fafd7 guibg=#303030

  "hi! DiffAdd    cterm=bold gui=bold ctermfg=74  ctermbg=236 guifg=#5fafd7 guibg=#303030
  "hi! DiffDelete cterm=bold gui=bold ctermfg=168 ctermbg=237 guifg=#d75f87 guibg=#3a3a3a
  "hi! DiffText   cterm=bold gui=bold ctermfg=108 ctermbg=237 guifg=#87af87 guibg=#3a3a3a
endfunction

function! s:gruvbox_diff(...) abort "{{{2
  hi! DiffChange  cterm=bold gui=bold ctermfg=108 guifg=#8ec07c

  hi! DiffAdd     cterm=bold gui=bold ctermfg=142 guifg=#b8bb26
  hi! DiffRemove  cterm=bold gui=bold ctermfg=167 guifg=#fb4934
  hi! DiffText    cterm=bold gui=bold ctermfg=208 guifg=#fe8019

  " for fugitive
  hi! diffFile    cterm=bold gui=bold ctermfg=208 guifg=#fe8019
  hi! diffNewFile cterm=bold gui=bold ctermfg=214 guifg=#fabd2f
  "hi diffLine    cterm=bold gui=bold ctermfg=109 guifg=#83a598
  hi! diffLine    cterm=bold gui=bold ctermfg=109 guifg=#36b383
endfunction
