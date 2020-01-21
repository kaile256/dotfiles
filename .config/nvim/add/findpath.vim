" From: myplug.toml
" Repo: kaile256/vim-findpath
" Ref: /home/kaile256/.go/src/github.com/neovim/neovim/src/nvim/normal.c @6906 nv_gotofile

let g:findpath#no_default_keymaps     = 1
let g:findpath#parent_dir_trial_level = 1

"let g:findpath#search#alternate_bufname = 0
let g:findpath#search#ignore_words = ['import']
"augroup findpathOnFileType
"    au! FileType python let b:findpath#search#ignore_words = ['import']
"augroup END
let g:findpath#list#lclose_after_select = 1


augroup myFindPath
  au! BufWinEnter .config/nvim**/* call s:findpath_keymaps()
augroup END

function! s:findpath_keymaps() abort "{{{1
  nnoremap <buffer><silent> gf :<c-u>FindPath<cr>

  " in horizontal
  nnoremap <buffer><silent> <c-w>f :<c-u>bel FindPath<cr>

  " in vertical
  nnoremap <buffer><silent> <c-w><space>f :<c-u>vert FindPath<cr>

  " in a new tab
  nnoremap <buffer><silent> gF     :<c-u>tab FindPath<cr>
  nnoremap <buffer><silent> <c-w>F :<c-u>tab FindPath<cr>
endfunction

