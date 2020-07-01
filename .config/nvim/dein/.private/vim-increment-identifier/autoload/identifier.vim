" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

function! identifier#increment(cmd) abort
  let target = s:find_id()
  if len(target) == 0 | return | endif
  if target =~# '\d\+'
    exe 'norm!' a:cmd
    return
  endif

  if a:cmd ==# "\<C-x>"
    let op = '-'
    silent! call repeat#set("\<Plug>(id-decrement)")
  elseif a:cmd ==# "\<C-a>"
    let op = '+'
    silent! call repeat#set("\<Plug>(id-increment)")
  else
    echoerr '[Increment Index] Invalid argument:' a:cmd
    return
  endif

  if target =~# '\a'
    let save_nrformats = &nrformats
    set nrformats=alpha
    exe 'norm!' v:count1 .. a:cmd
    let &nrformats = save_nrformats
    return
  endif

  " TODO: Implement pattern in s:find_id()
  " Ref: Increment any other characters than ascii.
  " https://github.com/monaqa/dotfiles/blob/32f70b3f92d75eaab07a33f8bf28ee17927476e8/.config/nvim/init.vim#L950-L960
  let save_eventignore = &eventignore
  set eventignore=
  set ei+=TextChangedI
  set ei+=TextYankPost
  set ei+=InsertEnter
  set ei+=InsertLeave
  let @/ = target
  let num = char2nr(target)
  exe 'norm! r'. nr2char(eval(num .. op .. v:count1))
  call histdel('/', -1)
  let &eventignore = save_eventignore
endfunction

function! s:find_id() abort
  let save_view = winsaveview()
  " Return true if cursor is on the very position that escaped alphabet char.
  if searchpos('\\\zs\a', 'cWn') == [save_view['lnum'], save_view['col'] + 1]
    return getline('.')[col('.') - 1]
  endif

  " Regard those chars that beside underscore ('_') as isolated.
  "
  " List of chars to be ignored even when they look isolated:
  "     1. escaped by a backslash ('\')
  "     2. modifier prefix like, 'C' in '<C-x>' or 'A' in <A-j>'
  "     3. prefix for variables' scope of Vimscript like g:, s:, l:
  let pat_isolated = '\v\d|((<([\<\\])@<!|_\zs)\a:@!(\ze_|>))'
  let is_found = s:search_in_line(pat_isolated)
  if !is_found
    let is_found = s:search_in_line(pat_isolated, 'reverse')
  endif
  if !is_found
    let pat_quoted = '\v([''"])\zs.\ze\1'
    let quoted = s:search_in_line(pat_quoted)
    if quoted
      return ''
    endif
  endif
  " Exclude characters after current column to get pattern.
  return matchstr(getline('.')[:col('.') - 1], pat_isolated .'$')
endfunction

function! s:search_in_line(pat, ...) abort
  let save_view = winsaveview()
  let flags = 'W'
  if get(a:, 1, '') ==# 'reverse'
    let flags .= 'b'
  endif

  let s:is_abbr = {-> getline('.')[:col('.')] =~# '''[st] $'}
  " Set cursor to an id char/number if it's found in the cursor line;
  " otherwise, get back to the saved position.
  if search(a:pat, 'c'. flags) == save_view['lnum'] && !s:is_abbr()
    return 1
  endif

  while s:is_abbr()
    if search(a:pat, flags) != save_view['lnum']
      call winrestview(save_view)
      return 0
    endif
  endwhile

  if line('.') == save_view['lnum']
    return 1
  endif

  call winrestview(save_view)
  return 0
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
