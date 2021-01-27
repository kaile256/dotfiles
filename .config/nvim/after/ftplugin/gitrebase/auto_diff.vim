" Runtime: $VIMRUNTIME/ftplugin/gitrebase.vim

function! s:init_diff_buffer() abort
  setlocal ft=diff previewwindow nowrap
  setlocal bt=nofile bufhidden=wipe nobuflisted
  setlocal nobackup noswapfile
  setlocal nonumber
endfunction

function! s:diff_command(hash) abort
  " From hotwatermorning/auto-git-diff
  const prefix = has('win32') ? 'set LANG=C &' : 'env LANG=C'
  const opts = '--stat -p --submodule --find-copies --find-copies'
  const empty_tree = '4b825dc642cb6eb9a060e54bf8d69288fbee4904'

  const l:new = a:hash
  const l:old = a:hash .'~1'
  for hash in [l:old, empty_tree]
    const diff_cmd = prefix .' git diff '. opts .' '. hash .' '. l:new
    silent let out = system(diff_cmd)

    if !v:shell_error
      return out
    elseif exists('save_out')
      return save_out
    endif

    let save_out = out
  endfor
endfunction

function! s:get_hash() abort
  const line = getline('.')
  const cword = expand('<cword>')

  const pat_hash = '\<\x\{7,}\>'
  for text in [cword, line]
    let hash = matchstr(text, pat_hash)
    if !empty(hash)
      return hash
    endif
  endfor
  return hash
endfunction


function! s:update_diff() abort
  if !exists('b:git_diff_viewer_bufnr') | return | endif

  const hash = s:get_hash()
  if empty(hash) | return | endif
  const out = s:diff_command(hash)

  const id = bufwinid(b:git_diff_viewer_bufnr)
  call win_gotoid(id)
  setlocal modifiable
  silent! % delete _
  silent! $ put! = out
  setlocal nomodifiable
  1
  wincmd p
  return
endfunction

function! s:init_diff_mode() abort
  wincmd T

  const open = winwidth('%') / 2 > 80
        \ ? 'below vnew'
        \ : 'above new'
  exe open
  call setbufvar('#', 'git_diff_viewer_bufnr', bufnr())
  call s:init_diff_buffer()
  wincmd p
  1
  call s:update_diff()
endfunction

function! s:wipe_preview() abort
  silent! exe b:git_diff_viewer_bufnr 'bwipeout'
  silent! unlet b:git_diff_viewer_bufnr
endfunction

augroup ftplugin/gitrebase/auto_diff
  au!
  au BufWinLeave <buffer> call s:wipe_preview()
  au CursorMoved <buffer> call s:update_diff()
augroup END
call s:init_diff_mode()

