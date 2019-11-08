function! s:line_operation(operation, direction) abort "{{{1
  if a:operation ==# 'copy' "{{{2
    " Note: :move/:copy doesn't work well if folded.
    if a:direction ==# 'downward'
      norm! yyp
    elseif a:direction ==# 'upward'
      norm! yyP
    endif

  elseif a:operation ==# 'move' "{{{2
    if v:event.regname ==# '' && getline('.') ==# @"
      let l:regname = '"_'
      if a:direction ==# 'downward'
        exe 'norm!' l:regname .'ddp'
      elseif a:direction ==# 'upward'
        exe 'norm!' l:regname .'ddkP'
      endif
    endif
  endif
endfunction "}}}1

"nnoremap <silent> <Plug>(move-line-downward) :call <SID>line_operation('move', downward')<cr>
"nnoremap <silent> <Plug>(move-line-upward)   :call <SID>line_operation('move', 'upward')<cr>
"nnoremap <silent> <Plug>(copy-line-downward) :call <SID>line_operation('copy', downward')<cr>
"nnoremap <silent> <Plug>(copy-line-upward)   :call <SID>line_operation('copy', 'upward')<cr>
"nnoremap <silent> <Plug>(copy-line-upward)   :call <SID>line_operation('copy', 'upward')<cr>

" TODO: make '"_' pattern work
nnoremap <expr> <Plug>(move-line-downward) (getline('.') ==# @")? '"_ddp': 'ddp'
nnoremap <expr> <Plug>(move-line-upward)   (getline('.') ==# @")? '"_ddkP': 'ddkP'
nnoremap <expr> <Plug>(copy-line-downward) (getline('.') ==# @")? '"_yyP': 'yyp'
nnoremap <expr> <Plug>(copy-line-upward)   (getline('.') ==# @")? '"_yyP': 'yyP'

nmap cp <Plug>(move-line-downward)
nmap cP <Plug>(move-line-upward)
nmap yp <Plug>(copy-line-downward)
nmap yP <Plug>(copy-line-upward)

"nmap cp :silent! call repeat#set('\<Plug>(move-line-downward')<cr>
"nmap cP :silent! call repeat#set('\<Plug>(move-line-upward')<cr>
"nmap yp :silent! call repeat#set('\<Plug>(copy-line-downward')<cr>
"nmap yP :silent! call repeat#set('\<Plug>(copy-line-upward')<cr>

augroup EchoOperated
  au! TextYankPost * call s:echo_operated()
  function! s:echo_operated() abort "{{{
    if v:event.regname ==# ''
      let l:regname = '"'
    elseif !empty(v:event.regname)
      let l:regname = v:event.regname
    else
      let l:regname = 'unknown'
    endif

    if v:event.operator ==# 'y'
      let operated = 'Yanked'
      let l:regname = '0'
    elseif v:event.operator ==# 'd'
      let operated = 'Deleted'
    elseif v:event.operator ==# 'c'
      let operated = 'Cut'
    elseif v:event.operator ==# ''
      let operated = 'Done'
    else
      let operated = v:event.operator
    endif

    if v:event.regtype ==# 'v'
      let l:regtype = 'in Charater'
    elseif v:event.regtype ==# 'V'
      let l:regtype = 'in Line'
    elseif v:event.regtype ==# '\<c-v>'
      let l:regtype = 'in Block'
    else
      let l:regtype = 'in an unknown way'
    endif

    let l:contents = string(v:event.regcontents)
    echomsg ' '. operated .' @'. l:regname l:regtype .': '. l:contents
  endfunction "}}}
augroup END

" TODO: Ignore difference of line's height.
function! s:backup_yanked_contents() "{{{
  if !exists('g:maps_KAIZEN#backuplist_regnames')
    throw " Please :let g:maps_KAIZEN#backuplist_regnames = '(a sequence of optional alphabets of register's name)'"
  endif
  if !exists('g:maps_KAIZEN#last_address')
    let g:maps_KAIZEN#last_address = 0
  endif
  if g:maps_KAIZEN#last_address < len(g:maps_KAIZEN#backuplist_regnames) - 1
    let g:maps_KAIZEN#last_address = g:maps_KAIZEN#last_address + 1
  else
    " Resets the counter of address here.
    let g:maps_KAIZEN#last_address = 0
  endif
  "let g:last_address = (g:last_address - 1) % len(g:backuplist_regnames)
  let g:maps_KAIZEN#latest_backup_regname =  g:maps_KAIZEN#backuplist_regnames[g:maps_KAIZEN#last_address]
  exe 'let @' . g:maps_KAIZEN#latest_backup_regname .'= getreg(0)'
endfunction "}}}
let g:maps_KAIZEN#backuplist_regnames = 'abcdefg'
command! BackupYanked :call s:backup_yanked_contents()
nnoremap <silent> y :BackupYanked<cr>y
nnoremap <silent> Y :BackupYanked<cr>y$

