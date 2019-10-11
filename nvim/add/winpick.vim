" From: myplug.toml
" Repo: kaile256/vim-window-picker

let g:window_weed_list = [
      \ 'fugitive:\/\/',
      \ 'twiggy:\/\/',
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

" Ref: add/fugitive.vim {{{1
function! fugitive#commit_with_diff() abort "{{2
  call winpick#harvest()
  " Keep to show diff w/ HEAD while editting commit-message.
  Gvdiffsplit! HEAD
  " For: makes user notice if any other changes in the buffer.
  norm gg
  vert bot 35 Gstatus
  setl winfixwidth
  wincmd =
endfunction "}}}2

command! Gstage
      \ :Gw
      \ | call fugitive#commit_with_diff()

" in new tab, if any unnecessary windows are there.
" TODO: set unstage
" &@:<C-U>execute <SNR>277_Do('Unstage',0)<CR>
" &@:exe <SNR>277_EchoExec('reset', '-q')<CR>
"command! Gunstage :G
"noremap <silent> <space>g<a-u> :Gunstage<cr>
command! GdiffMode
      \ call winpick#harvest()
      \ | Gvdiffsplit!

"}}}1

" add/coc.vim
" TODO: make :GstageChunk work: chunkStage to show the list of local logs.
command! GstageChunk
      \ :call winpick#harvest()
      \ | CocCommand git.chunkStage
      \ | CocList bcommits

let g:fzf_layout = { 'window': 'call winpick#floating()' }

command! Gbranch :call winpick#weed_out() | Twiggy

" Mnemonic: Git Index (i.e., branches and tags)
"           similar to my :Vista's keymaps.
nnoremap <silent> <space>gi :Gbranch<cr>

" Show Local commit logs.
command! GlocalLog
      \ :call winpick#harvest()
      \ | exe 'bot '. &lines /2 .'sp <bar> Extradite'

nnoremap <space>gu :<c-u>GlocalLog<cr>

augroup WinpickOnFiletype
  au!
  au FileType gitcommit nnoremap <buffer> dq ggdGZZ:call winpick#weed_out()<cr>
  au FileType extradite nnoremap <buffer> <space>gu :<c-u>call winpick#weed_out()<cr>

augroup END
