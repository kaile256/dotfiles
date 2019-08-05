"""" Memo: denite.org
"""" From: Init.toml
"""" With: denite-extra.vimrc
""""  Ref: defx.vimrc

"""" CONFIG
""" Ripgrep: replace default grep
if executable('rg')
  call denite#custom#var('file_rec', 'command', [
        \ 'rg',
        \ '--files',
        \ '--glob',
        \ '!.git'
        \ ])

  call denite#custom#var('grep', 'command', ['rg'])
endif

" denite/insert
call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')

" open
call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')

" jj で denite/insert を抜けるようにする
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')

"""" KEYMAP
""" Gtags
nnoremap [denite-gtags]d :<C-u>DeniteCursorWord -buffer-name=gtags_def -mode=normal gtags_def<CR>
nnoremap [denite-gtags]r :<C-u>DeniteCursorWord -buffer-name=gtags_ref -mode=normal gtags_ref<CR>
nnoremap [denite-gtags]c :<C-u>DeniteCursorWord -buffer-name=gtags_context -mode=normal gtags_context<CR>

nnoremap <a-d> :<C-u>Denite file_mru<CR>

augroup Denite
  au! FileType denite call s:denite_keymaps()
augroup END

"""" DEFINITION
function! s:denite_keymaps() abort
  nnoremap <silent><buffer>
        \ <a-/> :<C-u>Denite -buffer-name=search -auto-resizeline<cr>
  nnoremap <silent><buffer>
        \ <a-t> :<C-u>Denite filetype<CR>
  nnoremap <silent><buffer>
        \ <a-p> :<C-u>Denite file_mru<CR>
  nnoremap <silent><buffer>
        \ <a-j> :<C-u>Denite line<CR>
  nnoremap <silent><buffer>
        \ <a-]> :<C-u>DeniteCursorWord grep<CR>
  nnoremap <silent><buffer>
        \ <a-y> :<C-u>Denite neoyank<CR>
  nnoremap <silent><buffer>
        \ <a-r> :<C-u>Denite -resume<CR>
  nnoremap <silent><buffer>
        \ <a-;> :<C-u>Denite -resume -immediately -select=+1<CR>
  nnoremap <silent><buffer>
        \ <a--> :<C-u>Denite -resume -immediately -select=-1<CR>
endfunction

" noremap <silent><buffer> <space>d
"   \ <a-:<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/dotfiles']}])<CR>
" noremap <silent><buffer> <space>l
"   \ <a-:<C-u>call denite#start([{'name': 'file_rec', 'args': [g;memolist_path]})<CR>
