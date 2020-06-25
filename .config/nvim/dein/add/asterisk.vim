scriptencoding utf-8
" From: motion.toml
" Repo: haya14busa/vim-asterisk
" Fork: kaile256/vim-asterisk
" Ref: machakann/vim-sandwich

"" Ref: https://twitter.com/Bakudankun/status/1207057884581900289
"nnoremap <silent><expr> * v:count ? '*'
      "\ : ':sil exe "keepj norm! *" <Bar> call winrestview(' . string(winsaveview()) . ')<CR>'

" Note: Vim regards <C-_> as <C-/>
" FIXME: Remove all the escape sequences;
" currently, '\\\ze[\/]' turns out '\ze[/]'.
noremap! <expr> <SID>(paste-literal)
      \ substitute(substitute(@/, '^\\[mv]\c', '', ''), '\\\ze[\/]', '', 'g')
tnoremap <expr> <SID>(paste-literal)
      \ substitute(substitute(@/, '^\\[mv]\c', '', ''), '\\\ze[\/]', 'g', '')
tnoremap <script> <c-r>/     <SID>(paste-literal)
noremap! <script> <c-r>/     <SID>(paste-literal)
tnoremap <script> <c-r>/     <SID>(paste-literal)
noremap! <script> <c-r><c-_> <SID>(paste-literal)
tnoremap <script> <c-r><c-_> <SID>(paste-literal)

" Standard mappings {{{1
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

" Substitute mappings "{{{1

xnoremap <silent><expr> x asterisk#substitute('d', 'n', v:register)
xnoremap <silent><expr> X asterisk#substitute('d', 'N', v:register)
xnoremap <silent><expr> s asterisk#substitute('c', 'n', v:register)
xnoremap <silent><expr> S asterisk#substitute('c', 'N', v:register)

xnoremap <silent><expr> <space>x asterisk#substitute('d', 'n', '_')
xnoremap <silent><expr> <space>X asterisk#substitute('d', 'N', '_')
xnoremap <silent><expr> <space>s asterisk#substitute('c', 'n', '_')
xnoremap <silent><expr> <space>S asterisk#substitute('c', 'N', '_')

xnoremap <silent><expr> p asterisk#substitute("\<C-r>\<C-p>", 'n', v:register)
xnoremap <silent><expr> P asterisk#substitute("\<C-r>\<C-p>", 'N', v:register)

" " TODO: dot-Repeatable
" onoremap <expr> r <SID>asterisk_omap('n', v:register)
" onoremap <expr> R <SID>asterisk_omap('N', v:register)
" onoremap <expr> * <SID>asterisk_omap('n', v:register)
" onoremap <expr> # <SID>asterisk_omap('N', v:register)
