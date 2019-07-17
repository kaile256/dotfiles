"" Search
nnoremap <silent> <space>/ :<C-u>Denite -buffer-name=search -auto-resizeline<cr>
noremap <silent> <space>dt :<C-u>Denite filetype<CR>
noremap <silent> <space>dp :<C-u>Denite file_rec<CR>
noremap <silent> <space>du :<C-u>Denite file_mru<CR>

noremap <silent> <space>dj :<C-u>Denite line<CR>
noremap <silent> <space>dg :<C-u>Denite grep<CR>
noremap <silent> <space>d] :<C-u>DeniteCursorWord grep<CR>
noremap <silent> <space>dy :<C-u>Denite neoyank<CR>

noremap <silent> <space>dr :<C-u>Denite -resume<CR>
noremap <silent> <space>d; :<C-u>Denite -resume -immediately -select=+1<CR>
noremap <silent> <space>d- :<C-u>Denite -resume -immediately -select=-1<CR>

" noremap <silent> <space>d
"   \ :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/dotfiles']}])<CR>
" noremap <silent> <space>l
"   \ :<C-u>call denite#start([{'name': 'file_rec', 'args': [g;memolist_path]})<CR>
"
" Ripgrep: replace default grep
if executable('rg')
  call dein#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call dein#custom#var('grep', 'command', ['rg'])
endif
