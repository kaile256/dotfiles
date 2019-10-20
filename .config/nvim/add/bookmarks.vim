" From: finder.toml
" Repo: MattesGroeger/vim-bookmarks

" Let
let g:bookmark_no_default_key_mappings = 1

"let g:bookmark_sign = '>>'
"let g:bookmark_annotation_sign = '##'

let g:bookmark_highlight_lines = 1
let g:bookmark_show_toggle_warning = 1
let g:bookmark_location_list = 1
let g:bookmark_disable_ctrlp = 1

let g:bookmark_auto_save = 1
" complicated to work correct.
"let g:bookmark_auto_save_file = '~/vimwiki/vim-bookmarks'

" Keymap; with FZF
" TODO: show in a floating window.
nnoremap <silent> <space>zm :<c-u>BookmarkShowAll<cr> :BLines<cr> <c-\><c-n>:cclose<cr>i

" Keymap; Annotation
" Mnemonic: Mark with Note
nnoremap <silent> ma :<c-u>BookmarkAnnotate<cr>

" Keymap; Jump
nnoremap <silent> mj :<c-u>BookmarkNext<CR>
nnoremap <silent> mk :<c-u>BookmarkPrev<CR>

" Keymap; Show Marks
noremap <silent> ms :<c-u>BookmarkShowAll<cr> :setlocal modifiable<CR>

"augroup MyBookmarksAugroup
"  au!
"  au VimLeave,BufWinLeave,WinLeave * BookmarkSave <c-r>=expand(g:bookmark_auto_save_file)
"  au VimEnter,BufWinEnter,WinEnter * BookmarkLoad <c-r>=expand(g:bookmark_auto_save_file)
"augroup END
