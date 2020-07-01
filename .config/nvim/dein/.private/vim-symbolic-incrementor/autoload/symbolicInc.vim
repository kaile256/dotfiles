scriptencoding utf-8

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

function! symbolicInc#increment() abort
  call s:increment("\<C-a>")
endfunction

function! symbolicInc#decrement() abort
  call s:increment("\<C-x>")
endfunction

function! s:increment(cmd) abort
  let target = s:find_target()
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

function! s:find_target() abort
  let save_view = winsaveview()
  " Return true if cursor is on the very position that escaped alphabet char.
  if searchpos('\\\zs\a', 'cWn') == [save_view['lnum'], save_view['col'] + 1]
    return getline('.')[col('.') - 1]
  endif

  " List of special cases where the pattern regards a char as isolated, which
  " is different from the simple pattern '\<.\>':
  "     - one letter char beside underscore ('_')
  "     - any kind of quoted ambiwidth char like '"あ"'
  "
  " List of chars to be ignored even when they look isolated:
  "     - escaped alphabet with a backslash ('\')
  "     - modifier prefix like, 'C' in '<C-x>' or 'A' in <A-j>'
  "     - prefix for variables' scope of Vimscript like g:, s:, l:
  "     - alphabet after apostrophe like `don't` or `it's`, which is detected
  "       by s:is_abbr() in s:find_in_line()
  let pat_isolated = '\v([''"])\zs.\ze\1|((<([\<\\])@<!|_\zs)\a:@!(\ze_|>))|\d'

  let is_found = 0
  for direction in ['forward', 'backward']
    if s:find_in_line(pat_isolated, direction)
      let is_found = 1
      break
    endif
  endfor

  " Exclude characters after current column to get pattern.
  if is_found
    return matchstr(getline('.')[:col('.') - 1], pat_isolated .'$')
  endif

  return ''
endfunction

function! s:find_in_line(pat, direction) abort
  let save_view = winsaveview()
  let flags = 'W'
  if a:direction ==# 'backward'
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
