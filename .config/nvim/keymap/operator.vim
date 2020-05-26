" From: init.vim

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
"    return (@" ==# substitute(getline('v'), '$', '\n', 'ge'))
"  endif
"endfunction
"nnoremap <expr> <Plug>(clean-register-delete)
"      \ <SID>the_line_is_identical_to_regcontents()? '"_d': 'd'
"nnoremap <expr> <Plug>(clean-register-change)
"      \ <SID>the_line_is_identical_to_regcontents()? '"_c': 'c'
"nmap d <Plug>(clean-register-delete)
"nmap c <Plug>(clean-register-change)

" TODO: enable to dot-repoeat
nnoremap <expr> <SID>(move-line-downward) (getline('.') ==# substitute(@", "\n", '', 'ge'))? '"_ddp':  'ddp'
nnoremap <expr> <SID>(move-line-upward)   (getline('.') ==# substitute(@", "\n", '', 'ge'))? '"_ddkP': 'ddkP'
nnoremap <expr> <SID>(copy-line-downward) (getline('.') ==# substitute(@0, "\n", '', 'ge'))? '"0p': 'yyp'
nnoremap <expr> <SID>(copy-line-upward)   (getline('.') ==# substitute(@0, "\n", '', 'ge'))? '"0P': 'yyP'

nnoremap <script> cp <SID>(move-line-downward)
nnoremap <script> cP <SID>(move-line-upward)
nnoremap <script> yp <SID>(copy-line-downward)
nnoremap <script> yP <SID>(copy-line-upward)

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

nmap <script><silent> <SID>(move-line-downward-repeatable)
      \ :<c-u>silent! call repeat#setreg("\<SID>(move-line-downward)", v:register)<cr><SID>(move-line-downward):silent! call repeat#set("\<SID>(move-line-downward)")<cr>
nmap <script><silent> <SID>(move-line-upward-repeatable)
      \ :<c-u>silent! call repeat#setreg("\<SID>(move-line-upward)",   v:register)<cr><SID>(move-line-upward):silent!   call repeat#set("\<SID>(move-line-downward)")<cr>

"nmap cp :silent! call repeat#set('\<Plug>(move-line-downward')<cr>
"nmap cP :silent! call repeat#set('\<Plug>(move-line-upward')<cr>
"nmap yp :silent! call repeat#set('\<Plug>(copy-line-downward')<cr>
"nmap yP :silent! call repeat#set('\<Plug>(copy-line-upward')<cr>

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
