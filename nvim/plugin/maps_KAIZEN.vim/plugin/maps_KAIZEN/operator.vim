scriptencoding utf-8
" From: init.vim


function! maps_KAIZEN#operator#last_searched(direction) abort
  let l:last_searched_global = @/
  try
    if a:direction ==# 'downward'
      exe 'norm / '. b:maps_KAIZEN_last_searched
      b:maps_KAIZEN_last_searched
    elseif a:direction ==# 'upward'
      exe 'norm ? '. b:maps_KAIZEN_last_searched
    endif
  catch "You hadn't searched this buffer yet."
  endtry
endfunction
augroup maps_KAIZEN_last_searched
  au! BufWinLeave,WinLeave * let b:maps_KAIZEN_last_searched = @/
augroup END

nnoremap <silent> <Plug>(maps_KAIZEN_last_searched_upward) :call maps_KAIZEN#operator#last_searched('upward')<cr>
nnoremap <silent> <Plug>(maps_KAIZEN_last_searched_downward) :call maps_KAIZEN#operator#last_searched('downward')<cr>
nmap g/ <Plug>(maps_KAIZEN#last_searched)
nmap g? <Plug>(maps_KAIZEN#last_searched)

" TODO: Ignore difference of line's height.
function! maps_KAIZEN#operator#backup_yanked_contents() "{{{
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
command! BackupYanked :call maps_KAIZEN#operator#backup_yanked_contents()
nnoremap <silent> y :BackupYanked<cr>y
nnoremap <silent> Y :BackupYanked<cr>y$

"xnoremap <silent> p :<c-u>call <SID>preremove_trailing_spaces()<cr>p
"xnoremap <silent> P :<c-u>call <SID>preremove_trailing_spaces()<cr>P
function! maps_KAIZEN#operator#preremove_trailing_spaces()
  let regname = v:register
  if getregtype(regname)[0] !=# '\<C-v>'
    return ''
  endif
  let value = getreg(regname, 1)
  let value = s:map_lines(value, {-> substitute(v:val, '\v\s+$', '', '')})
  call setreg(regname, value, '\<C-v>')
endfunction
function! s:map_lines(str, expr)
  return join(map(split(a:str, '\n', 1), a:expr), '\n')
endfunction
"function! maps_KAIZEN#operator#call_funcs_in_order(...) abort
"  for func in a:000
"    exe 'call'. func
"  endfor
"endfunction
augroup TellMeOperatorInfo
  au!
  "au TextYankPost * call maps_KAIZEN#operator#call_funcs_in_order(maps_KAIZEN#operator#tellme_operator_info(), maps_KAIZEN#operator#tellme_operator_info())
  au TextYankPost * call maps_KAIZEN#operator#tellme_operator_info()
  function! maps_KAIZEN#operator#tellme_operator_info()
    " Excerpt of Help {{{1
    " v:event.operator: the operator's name in initial
    " string(v:event.regcontents): the lines of the contents that the register got in list.
    " v:event.regname: the register just used if it's NOT the 'unnamed' register.
    " v:event.regtype: register is now specified (:help getregtype())
    " let l:args for :echo "{{{1
    " let l:operated "{{{2
    if v:event.operator ==# 'y'
      let l:operated = 'Yanked'
    elseif v:event.operator ==# 'd'
      let l:operated = 'Deleted'
    elseif v:event.operator ==# 'c'
      let l:operated = 'Cut'
    elseif v:event.operator ==# ''
      let l:operated = 'Done'
    else
      let l:operated = v:event.operator
    endif
    "}}}
    let l:contents = string(v:event.regcontents)
    let l:regname = (v:event.regname ==# '')? '"' : v:event.regname
    if l:operated ==# 'Yanked'
      " let l:at_which regname is used {{{2
      if exists('g:maps_KAIZEN#latest_backup_regname')
        let l:operated =
              \ ' Backup the last to @'
              \ . g:maps_KAIZEN#latest_backup_regname
              \ . '; yanked'
        let l:at_which = ''
      else
        let l:at_which = ' @0'
      endif
    else
      let l:at_which = ' @'. l:regname
    endif
    " Main: :echo info {{{1
    if v:event.regtype ==# 'v'
      echomsg ' '. l:operated . l:at_which .' in Characterwise: ' . l:contents
    elseif v:event.regtype ==# 'V'
      echomsg ' '. l:operated . l:at_which .' in Line: ' . l:contents
    elseif v:event.regtype ==# '\<c-v>'
      echomsg ' '. l:operated . l:at_which .' in Block: ' . l:contents
    else
      echomsg ' '. l:operated . l:at_which .' in an Unknown way: ' . l:contents
    endif
  endfunction "}}}
augroup END

" on Terminal mode
tnoremap <a-y> <c-\><c-n>y

" TODO: inc/dec for hex color on guifg/bg
onoremap <silent> gv :<c-u>norm! gv<cr>
xnoremap zo zogv
xnoremap zO zOgv
xnoremap zc zcgv
xnoremap zC zCgv
xnoremap zr zrgv
xnoremap zR zRgv
xnoremap zm zmgv
xnoremap zM zMgv
xnoremap <c-x> <c-x>gv
xnoremap <c-a> <c-x>gv
xnoremap <silent> = =:norm! gv<cr>
xnoremap > >gv
" TODO: Make v_< work as I expect.
"xnoremap < <Cmd>norm! <gv

" TODO: expandable to [-]
nnoremap g<space> f<space>
nnoremap <s-space> F<space>
" Note: To delete only a space, cannot omap.
nnoremap d<space>   m`f<space>"_x``
nnoremap d<s-space> m`F<space>"_x``
nnoremap c<space>   f<space>"_s
nnoremap c<s-space> F<space>"_s

" As usual expection
nnoremap j gj
nnoremap k gk
" switch mapping.
nnoremap gj j
nnoremap gk k

" Note: <c-w>o covers :only
nnoremap <c-w>O :tabonly<cr>
" Jump; via Tags "{{{1
" g<c-]>: show a list of tags only if <cword> has more than two tags.
noremap <c-]> g<c-]>zz
noremap <silent> g<c-]> :<c-u>vert stjump <c-r><c-w><CR>zz

" Jump; to Definition on &path "{{{1
" if a number follows filename/path, jump to the linenumber on the buffer:
"     init.vim:10
"     init.vim @ 20
"     init.vim (30)
"     /init.vim 40
nnoremap <silent> gf gF
xnoremap <silent> gf gF
" in horizontal
nnoremap <silent> <c-w>f <c-w>F
xnoremap <silent> <c-w>f <c-w>F
" in vertical
" TODO: should allow vsplit-version range or split to 'wincmd l'
nnoremap <silent> <c-w><space>f :<c-u>vert sfind <c-r><c-f> <cr>
xnoremap <silent> <c-w><space>f :<c-u>vert sfind <c-r><c-f> <cr>
" in new tab
nnoremap <silent> <c-w>F <c-w>gF
xnoremap <silent> <c-w>F <c-w>gF
nnoremap <silent> gF <c-w>gF
xnoremap <silent> gF <c-w>gF
"}}}

" Sloth; Prefix of Text Object
"function! s:reset_prefix_textobj(prefix) abort
"  let l:operator = v:operator
"  if prefix ==# 'i'
"    exe 'norm <esc>' . l:operator . 'i'
"  elseif prefix ==# 'a'
"    norm <esc> `l:operator`
"  endif
"endfunction
"onoremap  i <Cmd>call <SID>reset_prefix_textobj('i')<cr>
"xnoremap  i <Cmd>call <SID>reset_prefix_textobj('i')<cr>
"onoremap  a <Cmd>call <SID>reset_prefix_textobj('a')<cr>
"xnoremap  a <Cmd>call <SID>reset_prefix_textobj('a')<cr>

" TODO: Make I/A on linewise visual mode as blockwise.
"xnoremap <expr><silent> I (v:event.regtype ==# 'V')? ':norm <c-v>0I<cr>': 'I'
"xnoremap <expr><silent> A (v:event.regtype ==# 'V')? ':norm <c-v>0A<cr>': 'A'
"xnoremap <silent> I if v:event.regtype ==# 'V' <bar> :norm <c-v>0I<cr> <bar> endif<cr>
"xnoremap <silent> A if v:event.regtype ==# 'V' <bar> :norm <c-v>0A<cr> <bar> endif<cr>

"onoremap <expr><silent> v (v:operator != 'v')? '<esc>v': 'v'
"onoremap <expr><silent> d (v:operator != 'd')? '<esc>d': 'd'
"onoremap <expr><silent> c (v:operator != 'c')? '<esc>c': 'c'
"onoremap <expr><silent> y (v:operator != 'y')? '<esc>y': 'y'

" omap V let operator linewise.
onoremap D <esc>D
onoremap C <esc>C
onoremap Y <esc>y$

onoremap <expr> p
      \ (v:operator ==# 'y')? 'yp':
      \ (v:operator ==# 'd')? 'p':
      \ (v:operator ==# 'c')? '<esc>ddp':
      \ 'p'
"p' (getline('.') ==# @1)? '<esc>"_ddp' : '<esc>ddp'
"P' (getline('.') ==# @1)? '<esc>"_ddkp' : '<esc>ddkP'
onoremap <expr> P
      \ (v:operator ==# 'y')? 'yP':
      \ (v:operator ==# 'd')? 'P':
      \ (v:operator ==# 'c')? '<esc>ddkP':
      \ 'P'

" Select only one character under the cursor.
onoremap <CR> l
onoremap <NL> l

" as the sense deduced by other operator such as yj, dj
" TODO: should keep a blank line
onoremap { V{k
onoremap } V}
onoremap <expr> k
      \ (v:operator == 'y')? 'kj':
      \ (v:operator == 'd')? 'kk':
      \ 'k'

" For: startinsert mode even from visual mode or operator-pending mode.
onoremap <a-a> <esc>a
onoremap <a-i> <esc>i
vnoremap <a-a> <esc>a
vnoremap <a-i> <esc>i

" Get Spells; when &l:spell, get correct spell suggestions on wrong-spelled word.
" Note: this map also contains :startinsert.
" Note: if you'd like to :sleep as default, ':nunmap gs'.
"nnoremap <expr> <Plug>(get-spells) (&l:spell)? 'i<c-x>s': ':setl spell <bar> au! InsertLeave * ++once setl nospell<cr>i<c-x>s'
nnoremap <Plug>(get-spells) i<c-x>s
nmap  gs <Plug>(get-spells)

" Put/Get only SELECTED lines.
" TODO: xnoremap p to dotrepeatable
augroup LazyKeymaps
  au!
  au BufWinEnter * if &l:diff | xnoremap <silent><buffer> dp :diffput<cr>
  au BufWinEnter * if &l:diff | xnoremap <silent><buffer> do :diffget<cr>
augroup END

" DotRepeatable; Expanded asterisk.vim instead. {{{1
" TODO: convert selected-area into '/-history'.
"function! s:dotrepeatable_delete(willInsert,direction)
"  if a:willInsert ==# 'd'
"    let l:operator = 'd'
"  elseif a:willInsert ==# 'c'
"    let l:operator = 'c'
"  else
"    throw "wrong argument; expeced is only one in ['d','c']."
"  endif
"  if a:direction == '*' || a:direction == '/'
"    let l:direction = '*'
"    let l:reverse = '#'
"  elseif a:direction == '#' || a:direction == '?'
"    let l:direction = '#'
"    let l:reverse = '*'
"  else
"    throw "wrong argument; expeced is only one in ['*','#','/','?']."
"  endif
"  let l:view = winsaveview()
"  try
"    " If no other same expand(<cword>), keep the position.
"    exe 'norm ' .l:direction
"    exe 'norm '. l:reverse
"  finally
"    exe 'norm '. l:operator .'gn'
"  endtry
"  call winrestview('l:view')
"endfunction
"
"command! DotRepeatableDeleteForward  :call <SID>dotrepeatable_delete('d', '*')
"command! DotRepeatableDeleteBackward :call <SID>dotrepeatable_delete('d', '#')
"command! DotRepeatableChangeForward  :call <SID>dotrepeatable_delete('c', '*')
"command! DotRepeatableChangeBackward :call <SID>dotrepeatable_delete('c', '#')
"
"xnoremap x :<c-u>DotRepeatableDeleteForward<cr>
"xnoremap s :<c-u>DotRepeatableChangeForward<cr>
"xnoremap X :<c-u>DotRepeatableDeleteBackward<cr>
"xnoremap S :<c-u>DotRepeatableChangeBackward<cr>
""}}}
