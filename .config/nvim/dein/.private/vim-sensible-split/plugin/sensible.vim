" ============================================================================
" Repo: kaile256/vim-sensible-split
" File: plugin/sensible.vim
" Author: kaile256
" License: MIT license {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
" ============================================================================

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

command! -bar -bang -nargs=*
      \ SensibleSplit
      \ :exe <q-mods> sensible#_split('<bang>0') <q-args>
command! -bar -bang -nargs=*
      \ SensibleNew
      \ :exe <q-mods> sensible#_new('<bang>0') <q-args>
command! -bar -bang -nargs=+ -complete=command
      \ SensibleMods
      \ :exe <q-mods> sensible#_mods('<bang>0', <q-args>)

command! -bar -bang -nargs=? -complete=help
      \ SensibleHelp
      \ :exe <q-mods> (<q-args> ==# ''
      \   ? sensible#cword('<bang>0', 'help')
      \   : sensible#_mods('<bang>0', 'help <args>')
      \ )
if has('nvim')
  command! -bar -bang -nargs=? -complete=shellcmd
        \ SensibleMan
        \ :exe <q-mods> (<q-args> ==# ''
        \   ? sensible#cword('<bang>0', 'Man')
        \   : sensible#_mods('<bang>0', 'Man <args>')
        \ )
endif

augroup sensibleSplit
  au!
  au BufWinEnter *vim**/* let &l:keywordprg = ':SensibleMods help'
augroup END

if &g:keywordprg ==# ':Man'
  let &g:keywordprg = ':SensibleMods Man'
endif

nnoremap <silent><expr> <Plug>(sensible-gf)       sensible#gf#edit()
xnoremap <silent><expr> <Plug>(sensible-gf)       sensible#gf#edit()
nnoremap <silent><expr> <Plug>(sensible-ctrl-w_f) sensible#gf#split()
xnoremap <silent><expr> <Plug>(sensible-ctrl-w_f) sensible#gf#split()

if !get(g:, 'sensible#gf#no_default_mappings', 0)
  nmap gf <Plug>(sensible-gf)
  xmap gf <Plug>(sensible-gf)
  nmap <C-w>f <Plug>(sensible-ctrl-w_f)
  xmap <C-w>f <Plug>(sensible-ctrl-w_f)
endif

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
