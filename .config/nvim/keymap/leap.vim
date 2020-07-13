scriptencoding utf-8
" From: init.vim

" TODO: make it work anywhere
nnoremap <silent> gX :<c-u>call <SID>xdg_open()<cr>
function! s:xdg_open() abort "{{{1
  let cfile = substitute(expand('<cfile>'), '.\+=/', '/', 'e')
  "silent exe '!xdg-open' cfile '&'
  let fname = cfile

  let noSpace = substitute(fname, '[^\\]\zs ', '\\ ', 'ge')
  let fname = findfile(noSpace)
  "let dir   = matchstr(get(b:, 'term_title', getcwd()), '/\S.\+')
  "let fname = dir . '/'. cfile
  silent exe '!xdg-open' fname '&'
endfunction

" Buffers; {{{1
function! s:buf_rotate(order) abort
  if len(getloclist(winnr())) > 1
    exe 'l'. a:order
    ll
  elseif len(getqflist()) > 1
    exe 'c'. a:order
    cc
  else
    exe 'b'. a:order
  endif
endfunction
nnoremap <silent> <C-p> :<C-u> call <SID>buf_rotate('prev') <CR>
nnoremap <silent> <C-n> :<C-u> call <SID>buf_rotate('next') <CR>

" between Folds {{{1
nnoremap zJ zjzv
nnoremap zK zkzv

" Jump; via Tags {{{1
" Note: g<c-]> jumps via ctags,
"       or if <cword> links more than two tags, shows a list of tags.
noremap <c-]> g<c-]>zz
" Note: stjump means split-tag-jump.
noremap <silent> g<c-]> :<c-u>vert stjump <c-r><c-w><CR>zz

" Tags; to Newest
" :silent! to supress 'E556: at top of tag stack'
nnoremap <silent> <c-q> :silent! $tag<cr>

" " gf -- in &path {{{1
" " Ref: /home/kaile256/.go/src/github.com/neovim/neovim/src/nvim/normal.c @6906 nv_gotofile
" " if a number follows filename/path, jump to the linenumber on the buffer:
" "     init.vim:10
" "     init.vim @ 20
" "     init.vim (30)
" "     /init.vim 40

" " Naked {{{2
" nnoremap gf gF
" xnoremap gf gF
" " in horizontal
" nnoremap <c-w>f <c-w>F
" xnoremap <c-w>f <c-w>F

" " Note: sfind denys range and to follow number.
" nnoremap <silent> <c-w><space>f :<c-u>vert wincmd F<cr>
" " Note: :vert forbids any range, keep using <Cmd>.
" xnoremap <silent> <c-w><space>f <Cmd>vert wincmd F<cr>

" " in new tab
" nnoremap <c-w>F <c-w>gF
" xnoremap <c-w>F <c-w>gF
" nnoremap gF     <c-w>gF
" xnoremap gF     <c-w>gF

" function! s:term_cwd() abort "{{{2
"   exe 'cd' matchstr(get(b:, 'term_title', getcwd()), '/\S\+')
" endfunction

" function! s:keymaps_terminal() abort "{{{2
"   nnoremap <silent><buffer> gf :call <SID>term_cwd()<cr>gF
"   xnoremap <silent><buffer> gf :call <SID>term_cwd()<cr>gF
"   " in horizontal'
"   nnoremap <silent><buffer> <c-w>f :call <SID>term_cwd()<cr><c-w>F
"   xnoremap <silent><buffer> <c-w>f :call <SID>term_cwd()<cr><c-w>F

"   " Note: ':sfind denys range and to follow number.
"   nnoremap <silent><buffer> <c-w><space>f :call <SID>term_cwd()<cr>:<c-u>vert wincmd F<cr>
"   " Note: ':vert forbids any range, keep using <Cmd>.
"   xnoremap <silent><buffer> <c-w><space>f :call <SID>term_cwd()<cr><Cmd>vert wincmd F<cr>

"   " in new tab
"   nnoremap <silent><buffer> <c-w>F :call <SID>term_cwd()<cr><c-w>gF
"   xnoremap <silent><buffer> <c-w>F :call <SID>term_cwd()<cr><c-w>gF
"   nnoremap <silent><buffer> gF     :call <SID>term_cwd()<cr><c-w>gF
"   xnoremap <silent><buffer> gF     :call <SID>term_cwd()<cr><c-w>gF
" endfunction
" augroup gfOnTerminal
"   " Note: expr fails to work especially on terminal
"   au!
"   exe 'au' $TermOpen '* call s:keymaps_terminal()'
" augroup END

" "function! s:missing_find(edit) abort "{{{2
" "  setl path=
" "  exe a:edit matchstr(get(b:, 'term_title', getcwd()), '/\S\+') . '/<cfile>'
" "endfunction

" "nnoremap <silent><expr> gf exists('b:term_title') ? ':<c-u>call <SID>missing_find("edit")<cr>' : 'gF'
" "xnoremap <silent><expr> gf exists('b:term_title') ? ':<c-u>call <SID>missing_find("edit")<cr>' : 'gF'
" "" in horizontal'
" "nnoremap <silent><expr> <c-w>f exists('b:term_title') ? ':<c-u>call <SID>missing_find("split")<cr>' : '<c-w>F'
" "xnoremap <silent><expr> <c-w>f exists('b:term_title') ? ':<c-u>call <SID>missing_find("split")<cr>' : '<c-w>F'
" "'
" "" Note: ':sfind denys range and to follow number.'
" "nnoremap <silent><expr> <c-w><space>f exists('b:term_title') ? ':<c-u>call <SID>missing_find("vsplit")<cr>' : ':<c-u>vert wincmd F<cr>'
" "" Note: ':vert forbids any range, keep using <Cmd>.'
" "xnoremap <silent><expr> <c-w><space>f exists('b:term_title') ? ':<c-u>call <SID>missing_find("vsplit")<cr>' : '<Cmd>vert wincmd F<cr>'
" "
" "" in new tab
" "nnoremap <silent><expr> <c-w>F exists('b:term_title') ? ':<c-u>call <SID>missing_find("tabe")<cr>' : '<c-w>gF'
" "xnoremap <silent><expr> <c-w>F exists('b:term_title') ? ':<c-u>call <SID>missing_find("tabe")<cr>' : '<c-w>gF'
" "nnoremap <silent><expr> gF     exists('b:term_title') ? ':<c-u>call <SID>missing_find("tabe")<cr>' : '<c-w>gF'
" "xnoremap <silent><expr> gF     exists('b:term_title') ? ':<c-u>call <SID>missing_find("tabe")<cr>' : '<c-w>gF'

" Edit Syntax {{{1
function! s:edit_syntax(open) abort
  let ft_vim = &ft .'.vim'
  let vimrcs = fnamemodify($MYVIMRC, ':p:h')

  let fname = join([vimrcs, 'syntax', ft_vim], '/')
  let after = join([vimrcs, 'after', 'syntax', ft_vim], '/')

  for f in [fname, after]
    if !filereadable(f) | continue | endif
    exe a:open f
    return
  endfor

  echohl ErrorMsg
  echomsg 'currently, you have no syntax files for &ft='. &ft .'; edit' fname
  echohl None
  exe a:open fname
endfunction

let s:opens = {
      \ '<a-e>': 'e',
      \ '<a-s>': 'sp',
      \ '<a-t>': 'tabe',
      \ '<a-v>': 'vs',
      \ }
for s:key in keys(s:opens)
  exe 'nnoremap <silent> <a-s><a-y>'. s:key
        \ ':call <SID>edit_syntax(' string(s:opens[s:key]) ')<cr>'
endfor
unlet s:key s:opens
