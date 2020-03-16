" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}1

function! yamlfold#debug#_leave_log(ret, where) abort "{{{1
  if g:yamlfold#debug#enable == 0 | return | endif

  if !exists('b:yamlfold_log')
    let b:yamlfold_log = {}
  endif

  let len = 30
  let line = g:yamlfold#_line . repeat(' ', len)
  let info = v:lnum .') '. line[:len - 1] .': "'. a:ret .'" by '. a:where

  call extend(b:yamlfold_log, {v:lnum : info}, 'force')
endfunction

function! yamlfold#debug#log_around(...) abort "{{{1
  let l:lnum = line('.')

  let min = a:0 > 0 ? a:1 : 1
  let max = a:0 > 1 ? a:2 : line('$')

  let echolnum = min
  let colwidth = len(line('$'))

  while echolnum <= max
    let gap = repeat(' ', colwidth - len(echolnum))

    if has_key(b:yamlfold_log, echolnum)
      exe echolnum == l:lnum ? 'echohl Type' : 'echohl Normal'
      echomsg gap . b:yamlfold_log[echolnum] . (echolnum == l:lnum ? ' (cursor)' : '')

    else
      echohl ErrorMsg
      echomsg gap . echolnum .') FATAL: set a log function as return'
    endif

    let echolnum += 1
  endwhile

  echomsg '                   The indentsize seems' b:yamlfold__indentsize .'.'
  echo ''
endfunction

function! yamlfold#debug#log_write(...) abort "{{{1
  if index(g:yamlfold#active_filetypes, &ft) == -1
    throw 'Invalid filetype'
  endif

  let path = get(a:, 1, '') !=# ''
        \ ? a:1
        \ : g:yamlfold#debug#write_path

  try
    " like "'/tmp/vim-yamlfold-'. expand('%:t:r') .'.log'"
    let s:path = eval(path)
  catch
    let s:path = path
  endtry

  exe 'redir >>' s:path
  silent echo strftime('%c')
  silent echo expand('%:p')
  silent echo ''
  silent call yamlfold#debug#log_around()
  redir END
endfunction

function! yamlfold#debug#log_open(...) abort "{{{1
  if win_gotoid(bufwinid(s:path))
    e!
    norm! G
    call search('(cursor)', 'bW')
    norm! zz
    return
  endif

  let open = 'e'
  if get(a:, 1, '') !=# ''
    let open = join(a:000) !=# '' ? join(a:000) .' sp' : open
  elseif g:yamlfold#debug#log_location !=# ''
    let open = g:yamlfold#debug#log_location .' sp'
  endif

  " ':silent' for target files which include 'modeline' causes error msg on
  " opening log file
  silent! exe open s:path
  setl nomodeline
  norm! G
  call search('(cursor)', 'bW')
  norm! zz
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
