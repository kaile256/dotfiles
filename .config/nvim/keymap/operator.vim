" From: init.vim
"
nnoremap <silent> gX :silent !xdg-open <cfile> & <cr>

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

"" keep register clean
"function! s:the_line_is_identical_to_regcontents() abort
"  if !has_key(v:event, 'regname')
"    " TODO: have to check character-wise
"    return (@" ==# substitute(getline('v'), '$', '\n', 'g'))
"  endif
"endfunction
"nnoremap <expr> <Plug>(clean-register-delete)
"      \ <SID>the_line_is_identical_to_regcontents()? '"_d': 'd'
"nnoremap <expr> <Plug>(clean-register-change)
"      \ <SID>the_line_is_identical_to_regcontents()? '"_c': 'c'
"nmap d <Plug>(clean-register-delete)
"nmap c <Plug>(clean-register-change)

" TODO: enable to dot-repoeat
nnoremap <expr> <Plug>(move-line-downward) (getline('.') ==# substitute(@", "\n", '', 'g'))? '"_ddp':  'ddp'
nnoremap <expr> <Plug>(move-line-upward)   (getline('.') ==# substitute(@", "\n", '', 'g'))? '"_ddkP': 'ddkP'
nnoremap <expr> <Plug>(copy-line-downward) (getline('.') ==# substitute(@0, "\n", '', 'g'))? '"0p': 'yyp'
nnoremap <expr> <Plug>(copy-line-upward)   (getline('.') ==# substitute(@0, "\n", '', 'g'))? '"0P': 'yyP'

"function! s:visualized_area() abort
"  let cursor = {
"        \ 'line':  line("'>"),
"        \ 'col':  col("'>") - 1,
"        \ }
"  let other = {
"        \ 'line': line("'<"),
"        \ 'col': col("'<") - 1,
"        \ }
"  for key in keys(line)
"    let above[pos] = (cursor[pos] > other[pos])? cursor[pos] : other[pos]
"    let below[pos] = (cursor[pos] > other[pos])? cursor[pos] : other[pos]
"  endfor
"  for line in [above.line : below.line]
"  if visualmode() ==# 'v'
"    let area = getline("'<")[above.line:]
"    let end  = getline("'>")[:below]
"  elseif visualmode() ==# 'V'
"    let area = chars
"  else
"    let area = getline("'<")[above : below]
"    let end  = getline("'>")[above : below]
"  endif
"  for chars in [line("'<") + 1, line("'>") - 1]
"    if visualmode() ==# 'v'
"      let area .= chars[above : below] ."\n"
"    elseif visualmode() ==# 'V'
"    else
"      let area .= chars[above : below] ."\n"
"    endif
"  endfor
"  return area . end
"endfunction
"
"command! VisualizedArea :echo s:visualized_area()

nmap <silent> <Plug>(move-line-downward-repeatable) :<c-u>silent! call repeat#setreg("\<Plug>(move-line-downward)", v:register)<cr><Plug>(move-line-downward):silent! call repeat#set("\<Plug>(move-line-downward)")<cr>
nmap <silent> <Plug>(move-line-upward-repeatable)   :<c-u>silent! call repeat#setreg("\<Plug>(move-line-upward)",   v:register)<cr><Plug>(move-line-upward):silent!   call repeat#set("\<Plug>(move-line-downward)")<cr>

nmap cp <Plug>(move-line-downward)
nmap cP <Plug>(move-line-upward)
nmap yp <Plug>(copy-line-downward)
nmap yP <Plug>(copy-line-upward)

"nmap cp :silent! call repeat#set('\<Plug>(move-line-downward')<cr>
"nmap cP :silent! call repeat#set('\<Plug>(move-line-upward')<cr>
"nmap yp :silent! call repeat#set('\<Plug>(copy-line-downward')<cr>
"nmap yP :silent! call repeat#set('\<Plug>(copy-line-upward')<cr>

augroup myAfterYank
  au!
  au TextYankPost * call s:echo_operated()
  " TODO: keep cursor after yank
  " gv<esc> move cursor to the end of yanked character
  "xnoremap y ygv<esc>
  "au TextYankPost * call feedkeys("gv\<esc>")
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

    let l:contents = join(v:event.regcontents, "\n")
    "let l:contents = string(v:event.regcontents)
    echomsg ' '. operated .' @'. l:regname l:regtype .': '. l:contents
  endfunction "}}}
augroup END

" TODO: Ignore difference of line's height.
function! s:backup_yanked_contents() "{{{
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
endfunction "}}}
let g:backupYanked#backuplist_regnames = 'abcdefg'
command! BackupYanked :call s:backup_yanked_contents()
nnoremap <silent> y :BackupYanked<cr>y
nnoremap <silent> Y :BackupYanked<cr>y$
