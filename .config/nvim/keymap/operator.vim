" From: init.vim

function! s:is_registered() abort
  return getline('.') ==# substitute(@", "\n", '', 'ge')
endfunction

command! -bar -bang CopyLine :call s:CopyLine(<bang>0)
function! s:CopyLine(bang) abort
  let is_registered = getline('.') ==# substitute(@", "\n", '', 'ge')
  let put = a:bang ? 'P' : 'p'
  let pre = is_registered ? '' : 'yy'

  exe 'norm! '. pre . put
  let sequence = ":CopyLine"
  if a:bang
    let sequence .= '!'
  endif
  let sequence .= "\<CR>"
  call s:set_repeat(sequence)
endfunction

command! -bar -bang MoveLine :call s:MoveLine(<bang>0)
function! s:MoveLine(bang) abort
  let is_registered = getline('.') ==# substitute(@", "\n", '', 'ge')
  let reg = is_registered ? '"_' : '""'
  let put = a:bang ? (line('.') == line('$') ? 'P' : 'kP') : 'p'

  exe 'norm! '. reg .'dd'. put
  let sequence = ":MoveLine"
  if a:bang
    let sequence .= '!'
  endif
  let sequence .= "\<CR>"
  call s:set_repeat(sequence)
endfunction

function! s:set_repeat(sequence) abort
  let sequence = a:sequence
  if get(g:, 'repeat_sequence') =~# sequence
    let sequence = ":undojoin \<bar>". sequence
  endif
  silent! call repeat#set(sequence)
endfunction

nnoremap <silent> <Plug>(copy-line-forward)  :<C-u>CopyLine!<CR>
nnoremap <silent> <Plug>(copy-line-backward) :<C-u>CopyLine<CR>
nnoremap <silent> <Plug>(move-line-forward)  :<C-u>MoveLine!<CR>
nnoremap <silent> <Plug>(move-line-backward) :<C-u>MoveLine<CR>

nmap cp <Plug>(move-line-backward)
nmap cP <Plug>(move-line-forward)
nmap yp <Plug>(copy-line-backward)
nmap yP <Plug>(copy-line-forward)

augroup myAfterYank
  if exists('#myAfterYank')
    au! myAfterYank
  endif
  au TextYankPost * call s:echo_operated()
  " TODO: keep cursor after yank
  " gv<esc> move cursor to the end of yanked character
  "xnoremap y ygv<esc>
  "au TextYankPost * call feedkeys("gv\<esc>")
  function! s:echo_operated() abort "{{{
    if !empty(v:event.regname)
      let l:regname = v:event.regname
    endif

    if v:event.operator ==# 'y'
      let l:regname = get(l:, 'regname', '0')
      let operated  = 'Yanked'
    elseif v:event.operator ==# 'd'
      let operated = 'Deleted'
    elseif v:event.operator ==# 'c'
      let operated = 'Cut'
    elseif v:event.operator ==# ''
      let operated = 'Done'
    else
      let operated = v:event.operator
    endif

    let l:regname = get(l:, 'regname', '"')

    if v:event.regtype ==# 'v'
      let l:regtype = 'in Charater'
    elseif v:event.regtype ==# 'V'
      let l:regtype = 'in Line'
    elseif v:event.regtype ==# '\<c-v>'
      let l:regtype = 'in Block'
    else
      let l:regtype = 'in an unknown way'
    endif

    let l:contents = join(v:event.regcontents, "\n")
    "let l:contents = string(v:event.regcontents)
    echomsg ' '. operated .' @'. l:regname l:regtype .': '. l:contents
  endfunction "}}}
augroup END

" TODO: Ignore difference of line's height.
function! s:backup_yanked_contents() "{{{1
  if !exists('g:backupYanked#backuplist_regnames')
    throw " Please :let g:backupYanked#backuplist_regnames = '(a sequence of optional alphabets of register's name)'"
  endif
  if !exists('s:last_address')
    let s:last_address = 0
  endif
  if s:last_address < len(g:backupYanked#backuplist_regnames) - 1
    let s:last_address = s:last_address + 1
  else
    " Resets the counter of address here.
    let s:last_address = 0
  endif
  "let g:last_address = (g:last_address - 1) % len(g:backuplist_regnames)
  let s:latest_backup_regname =  g:backupYanked#backuplist_regnames[s:last_address]
  exe 'let @' . s:latest_backup_regname .'= getreg(0)'
endfunction
let g:backupYanked#backuplist_regnames = 'abcdefg'
nnoremap <silent> y :call <SID>backup_yanked_contents()<cr>y
nnoremap <silent> Y :call <SID>backup_yanked_contents()<cr>y$
