" From: init.vim

setl signcolumn=

nnoremap <buffer> <a-o> :cprevious<cr>
nnoremap <buffer> <a-i> :cnext<cr>
nnoremap <buffer> <a-]> :cnewer<cr>
nnoremap <buffer> <a-[> :colder<cr>

"" Note: use lambdalisue/qfloc.vim instead
"" Ref: https://thinca.hatenablog.com/entry/20130708/1373210009
"
"noremap <buffer> p <cr>zz<c-w>p
"noremap <buffer> <c-j> j<cr>zz<c-w>p
"noremap <buffer> <c-k> k<cr>zz<c-w>p
"
"nnoremap <silent><buffer> dd :call <SID>del_entry()<cr>
"nnoremap <silent><buffer> x  :call <SID>del_entry()<cr>
"xnoremap <silent><buffer> d  :call <SID>del_entry()<cr>
"xnoremap <silent><buffer> x  :call <SID>del_entry()<cr>
"
"function! s:del_entry() range abort
"  let qf = getqflist()
"  let history = get(w:, 'qf_history', [])
"  call add(history, copy(qf))
"  let w:qf_history = history
"  unlet! qf[a:firstline - 1 : a:lastline - 1]
"  call setqflist(qf, 'r')
"  execute a:firstline
"endfunction
"
"nnoremap <silent><buffer> u :<c-u>call <SID>undo_entry()<cr>
"
"function! s:undo_entry() abort
"  let history = get(w:, 'qf_history', [])
"  if !empty(history)
"    call setqflist(remove(history, -1), 'r')
"  endif
"endfunction
"
"noremap <silent><buffer><expr> j <SID>jk(v:count1)
"noremap <silent><buffer><expr> k <SID>jk(-v:count1)
"
"function! s:jk(motion) abort
"  let max = line('$')
"  let list = getloclist(0)
"
"  if empty(list) || len(list) != max
"    let list = getqflist()
"  endif
"
"  let cur = line('.') - 1
"  let pos = g:V.modulo(cur + a:motion, max)
"  let m = 0 < a:motion ? 1 : -1
"
"  while cur != pos && list[pos].bufnr == 0
"    let pos = g:V.modulo(pos + m, max)
"  endwhile
"
"  return (pos + 1) . 'G'
"endfunction
