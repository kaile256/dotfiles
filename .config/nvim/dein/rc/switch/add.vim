" TOML: operator.toml
" Repo: AndrewRadev/switch.vim

" Excerpt: Regexp support in Dictionary, e.g.,
" let b:switch_custom_definitions = [{
"     \ '<div\(.\{-}\)>\(.\{-}\)</div>':   '<span\1>\2</span>',
"     \ '<span\(.\{-}\)>\(.\{-}\)</span>': '<div\1>\2</div>',
"     \ }]

if !exists('*g:switch_extra_definitions')
  let g:switch_extra_definitions = []
endif

function! s:increment() abort
  silent! call repeat#set("\<Plug>(switch-increment-extra)")
  let line = getline('.')
  call switch#Switch({
        \ 'definitions': g:switch_extra_definitions
        \ })

  let is_modified = line !=# getline('.')
  if is_modified | return | endif
  silent! SplitjoinSplit
endfunction

function! s:decrement() abort
  silent! call repeat#set("\<Plug>(switch-decrement-extra)")
  let line = getline('.')
  call switch#Switch({
        \ 'definitions': g:switch_extra_definitions,
        \ 'reverse': 1
        \ })

  let is_modified = line !=# getline('.')
  if is_modified | return | endif
  silent! SplitjoinJoin
endfunction

nnoremap <silent> <Plug>(switch-increment-extra) <Cmd>call <SID>increment()<CR>
nnoremap <silent> <Plug>(switch-decrement-extra) <Cmd>call <SID>decrement()<CR>
nmap g<C-a> <Plug>(switch-increment-extra)
nmap g<C-x> <Plug>(switch-decrement-extra)
nmap z<C-a> <Plug>(switch-increment-local)
nmap z<C-x> <Plug>(switch-increment-local)

