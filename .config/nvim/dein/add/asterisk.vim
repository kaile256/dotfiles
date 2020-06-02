scriptencoding utf-8
" From: motion.toml
" Repo: haya14busa/vim-asterisk
" Fork: kaile256/vim-asterisk
" Ref: machakann/vim-sandwich

"" Ref: https://twitter.com/Bakudankun/status/1207057884581900289
"nnoremap <silent><expr> * v:count ? '*'
      "\ : ':sil exe "keepj norm! *" <Bar> call winrestview(' . string(winsaveview()) . ')<CR>'

" Note: Vim regards <C-_> as <C-/>
noremap! <expr><silent> <c-r>/     substitute(@/, '^\\[mv]', '', 'ie')
tnoremap <expr><silent> <c-r>/     substitute(@/, '^\\[mv]', '', 'ie')
noremap! <expr><silent> <c-r><c-_> substitute(@/, '^\\[mv]', '', 'ie')
tnoremap <expr><silent> <c-r><c-_> substitute(@/, '^\\[mv]', '', 'ie')

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

" nmap <c-w>*   <c-w>s<Plug>(asterisk-gz*)
" nmap <c-w>g*  <c-w>s<Plug>(asterisk-g*)
" nmap <c-w>#   <c-w>s<Plug>(asterisk-gz#)
" nmap <c-w>g#  <c-w>s<Plug>(asterisk-g#)
" nmap <c-w>z*  <c-w>s<Plug>(asterisk-z*)
" nmap <c-w>gz* <c-w>s<Plug>(asterisk-*)
" nmap <c-w>z#  <c-w>s<Plug>(asterisk-z#)
" nmap <c-w>gz# <c-w>s<Plug>(asterisk-#)
" nmap <c-w><space>*   <c-w>v<Plug>(asterisk-gz*)
" nmap <c-w><space>g*  <c-w>v<Plug>(asterisk-g*)
" nmap <c-w><space>#   <c-w>v<Plug>(asterisk-gz#)
" nmap <c-w><space>g#  <c-w>v<Plug>(asterisk-g#)
" nmap <c-w><space>z*  <c-w>v<Plug>(asterisk-z*)
" nmap <c-w><space>gz* <c-w>v<Plug>(asterisk-*)
" nmap <c-w><space>z#  <c-w>v<Plug>(asterisk-z#)
" nmap <c-w><space>gz# <c-w>v<Plug>(asterisk-#)

" xmap <c-w>*   <c-w>s<Plug>(asterisk-gz*)
" xmap <c-w>g*  <c-w>s<Plug>(asterisk-g*)
" xmap <c-w>#   <c-w>s<Plug>(asterisk-gz#)
" xmap <c-w>g#  <c-w>s<Plug>(asterisk-g#)
" xmap <c-w>z*  <c-w>s<Plug>(asterisk-z*)
" xmap <c-w>gz* <c-w>s<Plug>(asterisk-*)
" xmap <c-w>z#  <c-w>s<Plug>(asterisk-z#)
" xmap <c-w>gz# <c-w>s<Plug>(asterisk-#)
" xmap <c-w><space>*   <c-w>v<Plug>(asterisk-gz*)
" xmap <c-w><space>g*  <c-w>v<Plug>(asterisk-g*)
" xmap <c-w><space>#   <c-w>v<Plug>(asterisk-gz#)
" xmap <c-w><space>g#  <c-w>v<Plug>(asterisk-g#)
" xmap <c-w><space>z*  <c-w>v<Plug>(asterisk-z*)
" xmap <c-w><space>gz* <c-w>v<Plug>(asterisk-*)
" xmap <c-w><space>z#  <c-w>v<Plug>(asterisk-z#)
" xmap <c-w><space>gz# <c-w>v<Plug>(asterisk-#)

" Substitute mappings "{{{1
function! s:asterisk_substitute(key, direction, regname) abort
  let s:asterisk = funcref('asterisk#do', [mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0}])

  if a:key =~? "\<C-r>"
    return s:asterisk() .'"_cg'. a:direction
          \ .. a:key .. a:regname
          \ .. (a:regname =~# '=' ? '' : "\<ESC>")
  endif

  let key = (a:key =~? '[dx]' ? 'd' : 'c')
  let keys = '"'. a:regname .. key

  if mode(1) !~# "[vV\<C-v>]"
    return keys
  endif

  return s:asterisk() .. keys .'g'. a:direction
endfunction

xnoremap <expr> x <SID>asterisk_substitute('d', 'n', '_')
xnoremap <expr> X <SID>asterisk_substitute('d', 'N', '_')
xnoremap <expr> s <SID>asterisk_substitute('c', 'n', '_')
xnoremap <expr> S <SID>asterisk_substitute('c', 'N', '_')

xnoremap <expr> p <SID>asterisk_substitute("\<C-r>\<C-p>", 'n', v:register)
xnoremap <expr> P <SID>asterisk_substitute("\<C-r>\<C-p>", 'N', v:register)

" " TODO: dot-Repeatable
" onoremap <expr> r <SID>asterisk_omap('n', v:register)
" onoremap <expr> R <SID>asterisk_omap('N', v:register)
" onoremap <expr> * <SID>asterisk_omap('n', v:register)
" onoremap <expr> # <SID>asterisk_omap('N', v:register)
