"""" From: Initial.toml
"""" With: denite-extra.vimrc

"""" CONFIG

"""" KEYMAP
nnoremap <silent> <space>d :<C-u>Denite grep<CR>

augroup Denite
  au!
  au FileType denite nnoremap <silent><buffer>
        \ <c-/> :<C-u>Denite -buffer-name=search -auto-resizeline<cr>
  au FileType denite nnoremap <silent><buffer>
        \ <c-t> :<C-u>Denite filetype<CR>
  au FileType denite nnoremap <silent><buffer>
        \ <c-p> :<C-u>Denite file_rec<CR>
  au FileType denite nnoremap <silent><buffer>
        \ <c-j> :<C-u>Denite line<CR>
  au FileType denite nnoremap <silent><buffer>
        \ <c-]> :<C-u>DeniteCursorWord grep<CR>
  au FileType denite nnoremap <silent><buffer>
        \ <c-y> :<C-u>Denite neoyank<CR>
  au FileType denite nnoremap <silent><buffer>
        \ <c-r> :<C-u>Denite -resume<CR>
  au FileType denite nnoremap <silent><buffer>
        \ <c-;> :<C-u>Denite -resume -immediately -select=+1<CR>
  au FileType denite nnoremap <silent><buffer>
        \ <c--> :<C-u>Denite -resume -immediately -select=-1<CR>
augroup END

" noremap <silent><buffer> <space>d
"   \ <c-:<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/dotfiles']}])<CR>
" noremap <silent><buffer> <space>l
"   \ <c-:<C-u>call denite#start([{'name': 'file_rec', 'args': [g;memolist_path]})<CR>
"
""" Ripgrep: replace default grep
if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
endif

