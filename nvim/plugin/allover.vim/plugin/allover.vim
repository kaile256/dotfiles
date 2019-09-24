
function! allover#format()
  let l:view = winsaveview()
  " `=` goes as mapped such as coc.nvim.
  norm gg=G
  call winrestview(l:view)
endfunction
command! FormatAllOverBuffer :call allover#format()
nnoremap <silent> <c-=> :FormatAllOverBuffer<CR>

function! allover#saveview() abort
  let s:view = winsaveview()
endfunction

function! allover#blockwise() abort
  let l:view = winsaveview()
  norm! gg<c-v>G
  call winrestview(l:view)
endfunction

function! allover#bufname(type) abort
  if a:type ==# 'path'
    let l:wanted = bufname('%')
  elseif a:type ==# 'fname'
    let l:wanted = bufname('%:p')
  elseif a:type ==# 'dir'
    let l:wanted = bufname('%:p:h')
    let @ . v:regname = l:wanted
  endif

  let l:view = winsaveview()
  if v:operator == 'y'
    return
  elseif v:operator == 'd'
    bdelete
    !rm . shellescape('%:p')
  elseif v:operator == 'c'
    bdelete
    !rm . shellescape('%:p')
    exe 'e' . expand('%:p:h')
  endif
  call winrestview(l:view)
endfunction

command! AllOverBufname   :call allover#bufname()
command! AllOverLinewise  :call allover#linewise()
command! AllOverBlockwise :call allover#blockwise()

onoremap io <Cmd>AllOverBlockwise<cr>
onoremap ao <Cmd>AllOverBlockwise<cr>

onoremap iO <Cmd>AllOverLinewise<cr>
onoremap aO <Cmd>AllOverBufname<cr>

" Expand; the Name of Current Buffer w/o extention
cnoremap <c-r><c-t> <c-r>=expand('%:t')<cr>
" Current Buffer; for such plugins as FZF, Denite, COC.
tnoremap <c-r><c-t> <c-\><c-n>"=expand('#:t')<cr>pi
