" TOML: motion.toml
" Repo: haya14busa/vim-asterisk
" Another: source/asterisk.vim

"" Ref: https://twitter.com/Bakudankun/status/1207057884581900289
"nnoremap <silent><expr> * v:count ? '*'
      "\ : ':sil exe "keepj norm! *" <Bar> call winrestview(' . string(winsaveview()) . ')<CR>'

" Note: Vim regards <C-_> as <C-/>
" FIXME: Remove all the escape sequences;
" currently, '\\\ze[\/]' turns out '\ze[/]'.
noremap! <expr> <SID>(paste-literal) <SID>paste_literal()
tnoremap <expr> <SID>(paste-literal) <SID>paste_literal()

function! s:paste_literal() abort
  let no_magic = substitute(@/, '^\%(\\C\)*\\[mv]\c', '', '')
  let no_ignorecase = substitute(no_magic, '\v(^\\C)|(\\C$)', '', '')
  let no_escape = substitute(no_ignorecase, '\\\ze[\/]', '', 'g')
  return no_escape
endfunction

noremap! <script> <c-r>/     <SID>(paste-literal)
tnoremap <script> <c-r>/     <SID>(paste-literal)
noremap! <script> <c-r><c-_> <SID>(paste-literal)
tnoremap <script> <c-r><c-_> <SID>(paste-literal)

" Standard mappings {{{1
if !has('nvim') || !dein#tap('nvim-hlslens')
  " Note: Few case to expect exclusive search
  nmap *   <Plug>(asterisk-gz*)
  nmap g*  <Plug>(asterisk-g*)
  nmap #   <Plug>(asterisk-gz#)
  nmap g#  <Plug>(asterisk-g#)
  nmap z*  <Plug>(asterisk-z*)
  nmap gz* <Plug>(asterisk-*)
  nmap z#  <Plug>(asterisk-z#)
  nmap gz# <Plug>(asterisk-#)

  xmap *   <Plug>(asterisk-gz*)
  xmap g*  <Plug>(asterisk-g*)
  xmap #   <Plug>(asterisk-gz#)
  xmap g#  <Plug>(asterisk-g#)
  xmap z*  <Plug>(asterisk-z*)
  xmap gz* <Plug>(asterisk-*)
  xmap z#  <Plug>(asterisk-z#)
  xmap gz# <Plug>(asterisk-#)
endif

" Substitute mappings "{{{1

xnoremap <silent><expr> x asterisk#gn#delete('n', v:register)
xnoremap <silent><expr> X asterisk#gn#delete('N', v:register)
xnoremap <silent><expr> s asterisk#gn#change('n', v:register)
xnoremap <silent><expr> S asterisk#gn#change('N', v:register)

xnoremap <silent><expr> <space>x asterisk#gn#delete('n', '_')
xnoremap <silent><expr> <space>X asterisk#gn#delete('N', '_')
xnoremap <silent><expr> <space>s asterisk#gn#change('n', '_')
xnoremap <silent><expr> <space>S asterisk#gn#change('N', '_')

xnoremap <silent><expr> p asterisk#gn#paste('n', v:register)
xnoremap <silent><expr> P asterisk#gn#paste('N', v:register)

" " TODO: dot-Repeatable
" onoremap <expr> r <SID>asterisk_omap('n', v:register)
" onoremap <expr> R <SID>asterisk_omap('N', v:register)
" onoremap <expr> * <SID>asterisk_omap('n', v:register)
" onoremap <expr> # <SID>asterisk_omap('N', v:register)
