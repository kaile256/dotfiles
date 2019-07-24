"""" From: 'leap.toml'

"""" Search
nnoremap <silent> <space>d :<C-u>Denite grep<CR>

augroup Denite
  au!
  au FileType denite nnoremap <silent>
        \ / :<C-u>Denite -buffer-name=search -auto-resizeline<cr>
  au FileType denite nnoremap <silent>
        \ t :<C-u>Denite filetype<CR>
  au FileType denite nnoremap <silent>
        \ p :<C-u>Denite file_rec<CR>
  au FileType denite nnoremap <silent>
        \ u :<C-u>Denite file_mru<CR>
  au FileType denite nnoremap <silent>
        \ j :<C-u>Denite line<CR>
  au FileType denite nnoremap <silent>
        \ ] :<C-u>DeniteCursorWord grep<CR>
  au FileType denite nnoremap <silent>
        \ y :<C-u>Denite neoyank<CR>

        \ r :<C-u>Denite -resume<CR>
au FileType denite nnoremap <silent>
      \ ; :<C-u>Denite -resume -immediately -select=+1<CR>
au FileType denite nnoremap <silent>
      \ - :<C-u>Denite -resume -immediately -select=-1<CR>
augroup END

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

