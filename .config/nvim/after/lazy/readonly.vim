" From: init.vim

if expand('%:p') =~# '/\.git/' || &diff
  finish
endif

if filereadable(expand('%:p'))
  setlocal nomodifiable
endif

let s:mapped_bufnrs = []
function! s:map_toggle() abort
  const bufnr = bufnr()

  if !&modifiable
    redir => out
    silent nmap d
    silent nmap u
    silent nmap D
    silent nmap U
    redir END

    const mappings = split(out, "\n")
    const pat_buf_local_mapping = '^n\l*\s*d\S*\s*@'
    const is_buf_local_mapping = 'v:val =~# pat_buf_local_mapping'
    const buf_local_mappings = filter(deepcopy(mappings), is_buf_local_mapping)
    if len(buf_local_mappings) > 0 | return | endif

    call add(s:mapped_bufnrs, bufnr)

    if dein#tap('vim-smoothie')
      nmap <buffer><nowait> d <Plug>(SmoothieDownwards)
      nmap <buffer><nowait> u <Plug>(SmoothieUpwards)
      nmap <buffer><nowait> D <Plug>(SmoothieForwards)
      nmap <buffer><nowait> U <Plug>(SmoothieBackwards)
      return
    endif

    nnoremap <buffer><nowait> d <c-d>
    nnoremap <buffer><nowait> u <c-u>
    nnoremap <buffer><nowait> D <c-f>
    nnoremap <buffer><nowait> U <c-b>
    return
  endif

  if index(s:mapped_bufnrs, bufnr) == -1 | return | endif

  call filter(s:mapped_bufnrs, 'v:val is# bufnr')

  silent! nunmap <buffer> u
  silent! nunmap <buffer> d
  silent! nunmap <buffer> U
  silent! nunmap <buffer> D
endfunction

augroup myReadonlyLazy
  au!
  au OptionSet modifiable call s:map_toggle()
augroup END
call s:map_toggle()

