"" Search
nnoremap <silent> <space>d/ :<C-u>Denite -buffer-name=search -auto-resizeline<cr>
nnoremap <silent> <space>dt :<C-u>Denite filetype<CR>
nnoremap <silent> <space>dp :<C-u>Denite file_rec<CR>
nnoremap <silent> <space>du :<C-u>Denite file_mru<CR>

nnoremap <silent> <space>dj :<C-u>Denite line<CR>
nnoremap <silent> <space>dg :<C-u>Denite grep<CR>
nnoremap <silent> <space>d] :<C-u>DeniteCursorWord grep<CR>
nnoremap <silent> <space>dy :<C-u>Denite neoyank<CR>

nnoremap <silent> <space>dr :<C-u>Denite -resume<CR>
nnoremap <silent> <space>d; :<C-u>Denite -resume -immediately -select=+1<CR>
nnoremap <silent> <space>d- :<C-u>Denite -resume -immediately -select=-1<CR>

" noremap <silent> <space>d
"   \ :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/dotfiles']}])<CR>
" noremap <silent> <space>l
"   \ :<C-u>call denite#start([{'name': 'file_rec', 'args': [g;memolist_path]})<CR>
"
" Ripgrep: replace default grep
if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
endif


""" Gtags

