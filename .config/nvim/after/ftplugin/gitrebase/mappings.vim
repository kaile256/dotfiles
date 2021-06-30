" RUNTIME: $VIMRUNTIME/ftplugin/gitrebase.vim

function! s:repeatable(cmd) abort
  silent! call repeat#set(":\<C-u>". a:cmd ."\<CR>")
  exe a:cmd
endfunction

nnoremap <buffer><silent> zp :<C-u>call <SID>repeatable('Pick')<CR>
nnoremap <buffer><silent> zs :<C-u>call <SID>repeatable('Squash')<CR>
nnoremap <buffer><silent> ze :<C-u>call <SID>repeatable('Edit')<CR>
nnoremap <buffer><silent> zr :<C-u>call <SID>repeatable('Reword')<CR>
nnoremap <buffer><silent> zd :<C-u>call <SID>repeatable('Drop')<CR>

xnoremap <buffer><silent> zp :Pick<CR>
xnoremap <buffer><silent> zs :Squash<CR>
xnoremap <buffer><silent> ze :Edit<CR>
xnoremap <buffer><silent> zr :Reword<CR>
xnoremap <buffer><silent> zd :Drop<CR>
