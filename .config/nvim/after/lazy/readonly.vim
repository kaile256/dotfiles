" From: rc/lazy.vim

if &diff | finish | endif

if filereadable(expand('%:p'))
  setlocal nomodifiable
endif

let s:mapped_bufnrs = []
function! s:map_toggle(_) abort
  const bufnr = bufnr()

  if !&modifiable
    for key in ['d', 'u', 'D', 'U']
      let has_any_buflocal_mapping = get(maparg(key, 'n', 0, 1), 'buffer', 0)
      if has_any_buflocal_mapping | return | endif
    endfor

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

let s:no_further_mapping_is_to_be_defined = 50
augroup myReadonlyLazy
  au!
  au OptionSet modifiable
        \ call timer_start(s:no_further_mapping_is_to_be_defined,
        \   expand('<SID>') .'map_toggle')
augroup END
call timer_start(s:no_further_mapping_is_to_be_defined,
      \ expand('<SID>') .'map_toggle')
