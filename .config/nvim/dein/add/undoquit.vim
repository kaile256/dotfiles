" TOML: default.toml
" Repo: AndrewRadev/undoquit.vim

" Mnemonic: Eliminate current tabpage
nnoremap <silent> ZE :<C-u>UndoableTabclose <CR>
" Mnemonic: Close tabpage
nnoremap <silent> ZC :<C-u>up <bar> UndoableTabclose <CR>
nmap Ze ZE
nmap Zc ZC

nnoremap <silent> <C-w>c :UndoableClose<CR>
" TODO: close gitcommit without saving
nnoremap <silent> <C-w>o :UndoableOnly<CR>
nnoremap <silent> <C-w>O :UndoableTabonly<CR>

command! -count -nargs=? -bang UndoableClose
      \ call undoquit#Close(<count>, <q-args>, '<bang>')
command! -count -nargs=? -bang UndoableOnly
      \ call undoquit#Only(<count>, <q-args>, '<bang>')
command! -count -nargs=? -bang UndoableTabonly
      \ call undoquit#Tabonly(<count>, <q-args>, '<bang>')

function! s:set_count(prefix_count, suffix_count) abort
  if a:suffix_count != ''
    let count = a:suffix_count
  elseif a:prefix_count > 0
    let count = a:prefix_count
  else
    let count = ''
  endif

  return count
endfunction

function! undoquit#Close(prefix_count, suffix_count, bang) abort
  let winnr = s:set_count(a:prefix_count, a:suffix_count)
  if !empty(winnr)
    let save_view = winsaveview()
    exe winnr .'wincmd w'
  endif
  call undoquit#SaveWindowQuitHistory()
  exe 'close'.a:bang
  silent! call winrestview(save_view)
endfunction

function! undoquit#Only(prefix_count, suffix_count, bang) abort
  " FIXME: Get correct {count}.
  let winnr = s:set_count(a:prefix_count, a:suffix_count)
  let cur_nr = winnr > 0 ? winnr : winnr()

  if winnr('$') == 1
    echo 'Already only one window'
    return
  endif

  if cur_nr != 1
    for _ in range(1, cur_nr - 1)
      1 wincmd w
      exe 1 'quit'.a:bang
    endfor
  endif

  " winnr('$') would be different than the previous check 'if only one window'.
  let last_winnr = winnr('$')
  if last_winnr == 1 | return | endif

  for _ in range(2, last_winnr)
    2 wincmd w
    exe 2 'quit'.a:bang
  endfor
endfunction

function! undoquit#Tabonly(prefix_count, suffix_count, bang) abort
  " Note: {count} is *not* so free as built-in tabonly

  " if tabpagenr('$') == 1
  "   echoerr 'E784: Cannot close lat tab page'
  "   return
  " endif

  let tabpagenr = s:set_count(a:prefix_count, a:suffix_count)
  let cur_nr = tabpagenr > 0 ? tabpagenr : tabpagenr()

  if cur_nr != 1
    for _ in range(1, cur_nr - 1)
      exe 'UndoableTabclose'.a:bang 1
    endfor
  endif

  let last_tabnr = tabpagenr('$')
  if last_tabnr == 1 | return | endif

  for _ in range(2, last_tabnr)
    exe 'UndoableTabclose'.a:bang 2
  endfor
endfunction
