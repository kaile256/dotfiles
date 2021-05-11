scriptencoding utf-8
" From: init.vim

" Jump and open fold.
nnoremap zK zkzv
nnoremap zJ zjzv

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
  let dir = expand('%:p:h')
  let files = readdir(dir)
  let files = filter(deepcopy(files), 'filereadable(v:val)')
  if len(files) <= 1
    echohl ErrorMsg
    echo 'No other files at' dir
    echohl
  endif
  let curr_file = expand('%:t')
  let curr_idx = index(sort(files), curr_file)

  let idx = curr_idx + (a:order ==# 'next' ? +1 : -1)
  if idx >= len(files)
    let idx = 0
  endif
  let path = files[idx]
  exe 'e' path
endfunction
nnoremap <silent> <C-p> :<C-u> call <SID>buf_rotate('prev') <CR>
nnoremap <silent> <C-n> :<C-u> call <SID>buf_rotate('next') <CR>

nnoremap <silent> ]q :cnext <bar> cwindow<CR>
nnoremap <silent> [q :cprev <bar> cwindow<CR>
nnoremap <silent> ]l :lnext <bar> lwindow<CR>
nnoremap <silent> [l :lprev <bar> lwindow<CR>

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
