" From: init.vim

" Sort; Unique
" Note: `:sort!` is to sort reverse.
" CAUTION: `:map <c-s>` freezes screen on some Linux-Distros as default.
"" Alphabetical
xnoremap <a-s>      :sort  u<cr>
xnoremap <a-s><a-a> :sort  u<cr>
xnoremap <a-s>a     :sort  u<cr>
xnoremap <a-s>A     :sort! u<cr>
" Ignore Case
xnoremap <a-s><a-i> :sort  iu<cr>
xnoremap <a-s>i     :sort  iu<cr>
xnoremap <a-s>I     :sort! Iu<cr>
xnoremap <a-s><a-n> :sort  nu<cr>
xnoremap <a-s>n     :sort  nu<cr>
xnoremap <a-s>N     :sort! nu<cr>
" Float Number
xnoremap <a-s><a-f> :sort  fu<cr>
xnoremap <a-s>f     :sort  fu<cr>
xnoremap <a-s>F     :sort! fu<cr>
xnoremap <a-s><a-x> :sort  xu<cr>
xnoremap <a-s>x     :sort  xu<cr>
xnoremap <a-s>X     :sort! xu<cr>
xnoremap <a-s><a-o> :sort  ou<cr>
xnoremap <a-s>o     :sort  ou<cr>
xnoremap <a-s>O     :sort! ou<cr>

" Sort; Ununique {{{
""" Alphabetical
"xnoremap <space><a-s>      :sort  <cr>
"xnoremap <space><a-s><a-a> :sort  <cr>
"xnoremap <space><a-s>a     :sort  <cr>
"xnoremap <space><a-s>A     :sort! <cr>
"" Ignore Case
"xnoremap <space><a-s><a-i> :sort  i<cr>
"xnoremap <space><a-s>i     :sort  i<cr>
"xnoremap <space><a-s>I     :sort! I<cr>
"xnoremap <space><a-s><a-n> :sort  n<cr>
"xnoremap <space><a-s>n     :sort  n<cr>
"xnoremap <space><a-s>N     :sort! n<cr>
"" Float Number
"xnoremap <space><a-s><a-f> :sort  f<cr>
"xnoremap <space><a-s>f     :sort  f<cr>
"xnoremap <space><a-s>F     :sort! f<cr>
"xnoremap <space><a-s><a-x> :sort  x<cr>
"xnoremap <space><a-s>x     :sort  x<cr>
"xnoremap <space><a-s>X     :sort! x<cr>
"xnoremap <space><a-s><a-o> :sort  o<cr>
"xnoremap <space><a-s>o     :sort  o<cr>
"xnoremap <space><a-s>O     :sort! o<cr>
""}}}
