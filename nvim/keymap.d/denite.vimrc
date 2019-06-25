noremap <silent> <space>t :<C-u>Denite filetype<CR>
" noremap <silent> <space>p :<C-u>Denite file_rec<CR>
noremap <silent> <space>u :<C-u>Denite file_mru<CR>

noremap <silent> <space>j :<C-u>Denite line<CR>
noremap <silent> <space>g :<C-u>Denite grep<CR>
noremap <silent> <space>] :<C-u>DeniteCursorWord grep<CR>
noremap <silent> <space>y :<C-u>Denite neoyank<CR>

noremap <silent> <space>r :<C-u>Denite -resume<CR>
noremap <silent> <space>; :<C-u>Denite -resume -immediately -select=+1<CR>
noremap <silent> <space>- :<C-u>Denite -resume -immediately -select=-1<CR>

" noremap <silent> <space>d
"   \ :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/dotfiles']}])<CR>
" noremap <silent> <space>l
"   \ :<C-u>call denite#start([{'name': 'file_rec', 'args': [g;memolist_path]})<CR>
