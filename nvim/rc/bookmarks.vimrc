" From: tool.toml

" Let
let g:bookmark_no_default_key_mappings = 1

let g:bookmark_highlight_lines = 1
let g:bookmark_show_toggle_warning = 1
let g:bookmark_location_list = 1
let g:bookmark_disable_ctrlp = 1
" fail to work;
"let g:bookmark_auto_save_file = '~/.config/nvim/config.d/data.d/mattes.bookmarks'

" Keymap; with FZF
nnoremap <silent> <a-q><a-k> :BookmarkShowAll<cr> :BLines<cr> <c-\><c-n>:cclose<cr>i
nnoremap <silent> <a-q>k     :BookmarkShowAll<cr> :BLines<cr> <c-\><c-n>:cclose<cr>i

" Keymap; Annotation
" Mnemonic: Mark with Note
noremap <silent> mn :<c-u>BookmarkAnnotate<cr>

" Keymap; Jump
nnoremap <silent> m<c-j> :<c-u>:BookmarkNext<CR>
nnoremap <silent> m<c-k> :<c-u>:BookmarkPrev<CR>

" Keymap; Show Marks
noremap <silent> ms :<c-u>BookmarkShowAll<cr> :setlocal modifiable<CR>

"augroup MyBookmarksAugroup
"  au!
"  au VimEnter * nested BookmarkLoad ~/.config/nvim/config.d/data.d/mattes.bookmarks
"  au VimLeave * nested BookmarkSave ~/.config/nvim/config.d/data.d/mattes.bookmarks
"augroup END
