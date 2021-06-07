" RUNTIME: $VIMRUNTIME/ftplugin/gitrebase.vim

function! s:repeatable(cmd) abort
  silent! call repeat#set(':<C-u>'. a:cmd .'<CR>')
  exe a:cmd
endfunction

nnoremap <silent> zp :<C-u>call repeatable('Pick')<CR>
nnoremap <silent> zs :<C-u>call repeatable('Squash')<CR>
nnoremap <silent> ze :<C-u>call repeatable('Edit')<CR>
nnoremap <silent> zr :<C-u>call repeatable('Reword')<CR>
nnoremap <silent> zd :<C-u>call repeatable('Drop')<CR>

xnoremap <silent> zp :Pick<CR>
xnoremap <silent> zs :Squash<CR>
xnoremap <silent> ze :Edit<CR>
xnoremap <silent> zr :Reword<CR>
xnoremap <silent> zd :Drop<CR>
