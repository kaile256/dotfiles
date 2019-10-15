" From: myplug.toml
" Repo: kaile256/vim-window-picker
" Another: post/winpick.vim

let g:winpick_weed_list = [
      \ 'fugitive:\/\/',
      \ 'twiggy:\/\/',
      \ 'COMMIT_EDITMSG',
      \ ]

let s:list = {
      \ 'fugitive': {},
      \ }

let s:list.git = {
      \ 'bt': ['nofile', 'nowrite', 'quickfix'],
      \ 'ft': [],
      \ 'filename': ['fugitive:\/\/', 'twiggy:\/\/'],
      \ }

nnoremap <silent> <a-space><space>   :<c-u>WinpickWeedout<cr>
nnoremap <silent> <a-space><a-space> :<c-u>WinpickWeedout<cr>

onoremap <expr> q (v:operator ==# 'd')? ':<c-u>WinpickWeedout<cr>': 'q'

nnoremap <expr> <c-w><c-o> (&diff)? ':<c-u>WinpickWeedout<cr><c-w>o': '<c-w>o'
nnoremap <expr> <c-w>o     (&diff)? ':<c-u>WinpickWeedout<cr><c-w>o': '<c-w>o'

" Depends on other plugins;;;
" fugitive#foo() must match the filename.

" add/coc.vim
" TODO: make :GstageChunk work: chunkStage to show the list of local logs.
command! GaddChunk
      \ :call winpick#harvest()
      \ | CocCommand git.chunkStage
nnoremap <silent> gc :GaddChunk<cr>
command! GstageChunk
      \ :GaddChunk
      \ | CocList bcommits

let g:fzf_layout = { 'window': 'call winpick#floating()' }

command! Gbranch :call winpick#weed_out() | Twiggy

" Mnemonic: Git Index (i.e., branches and tags)
"           similar to my :Vista's keymaps.
nnoremap <silent> <space>gi :Gbranch<cr>

augroup WinpickOnFiletype
  au!
  au FileType gitcommit nnoremap <buffer> dq ggdGZZ:call winpick#weed_out()<cr>
  au FileType extradite nnoremap <buffer> <space>gu :<c-u>call winpick#weed_out()<cr>

augroup END
