" From: denite.toml
" Repo: Shougo/denite.nvim
" Another: post/denite.vim

" TODO: Automate if floating or not.
"for [key, action] in s:denite_mapping
"  if has('&floating')
"    nnoremap <silent> <space>fr :<C-u>Denite file_mru -split="floating"<CR>
"  endif
"endfor


" Keymap; Gtags
nnoremap <silent> <space>nd :<C-u>DeniteCursorWord -buffer-name=gtags_def -mode=normal gtags_def<CR>
nnoremap <silent> <space>nr :<C-u>DeniteCursorWord -buffer-name=gtags_ref -mode=normal gtags_ref<CR>
nnoremap <silent> <space>nc :<C-u>DeniteCursorWord -buffer-name=gtags_context -mode=normal gtags_context<CR>

" Mnemonic: Old buffers
nnoremap <silent> <space>no :<C-u>Denite buffer file_mru<CR>
nnoremap <silent> <space>nf :<C-u>DeniteBufferDir file<CR>

function! s:denite_keymaps() abort "{{{
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
        \ <a-;> :<C-u>Denite -resume -immediately-1 -select=+1<CR>
  nnoremap <silent><buffer>
        \ <a--> :<C-u>Denite -resume -immediately-1 -select=-1<CR>

  nnoremap <silent><buffer>
        \ <a-o> :<c-u>DenitePrev<cr>
  nnoremap <silent><buffer>
        \ <a-i> :<c-u>DeniteNext<cr>
  command! DenitePrev :Denite -resume -cursor-pos=-1 -immediately
  command! DeniteNext :Denite -resume -cursor-pos=+1 -immediately
  command! DeniteDo   :Denite -resume -do='normal! A;'
endfunction "}}}

" noremap <silent><buffer> <space>d
"   \ <a-:<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/dotfiles']}])<CR>
" noremap <silent><buffer> <space>l
"   \ <a-:<C-u>call denite#start([{'name': 'file_rec', 'args': [g;memolist_path]})<CR>

