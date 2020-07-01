" TOML: operator.toml
" Repo: AndrewRadev/switch.vim
" Another: source/switch.vim

nnoremap <silent> <SID>(switch-next)
      \ :<c-u>call <SID>get_word_head('Switch')<cr>
nnoremap <silent> <SID>(switch-prev)
      \ :<c-u>call <SID>get_word_head('SwitchReverse')<cr>
nnoremap <script> <c-+> <SID>(switch-next)
nnoremap <script> <c--> <SID>(switch-prev)

inoremap <script> <c-+> <Esc><SID>(switch-next)a
inoremap <script> <c--> <Esc><SID>(switch-prev)a

" Excerpt: Regexp support in Dictionary, e.g.,
" let b:switch_custom_definitions = [{
"     \ '<div\(.\{-}\)>\(.\{-}\)</div>':   '<span\1>\2</span>',
"     \ '<span\(.\{-}\)>\(.\{-}\)</span>': '<div\1>\2</div>',
"     \ }]

let s:definitions = {}

let s:definitions['vim'] = [
      \ ['==', '!='],
      \ ['\\zs', '\\ze'],
      \
      \ ['nmap', 'xmap', 'omap'],
      \ ['imap', 'cmap', 'tmap'],
      \
      \ ['nnoremap', 'xnoremap', 'onoremap'],
      \ ['inoremap', 'cnoremap', 'tnoremap'],
      \
      \ ['<silent>', '<script>'],
      \
      \ ['plugin/', 'autoload/'],
      \ ['add/', 'source/', 'post/'],
      \ ]

let s:definitions['php'] = [
      \ ['submit', 'text', 'radio'],
      \ ]

let s:definitions['java'] = [
      \ ['private', 'protected', 'public']
      \ ]

let s:definitions['markdown'] = [
      \ ['first', 'second', 'third']
      \ ]

function! s:get_word_head(cmd) abort "{{{1
  let word_boundary = '\w\+'
  " switched word can be different length so that keep on top before switched
  call search(word_boundary, 'bc')
  exe a:cmd
  call search(word_boundary, 'ec')
endfunction

augroup mySwitchAdd-set_local_definitions "{{{1
  " Note: b:switch_custom_definitions should be defined in advance of the
  " plugin loaded.
  if exists('#mySwitchAdd-set_local_definitions')
    au! mySwitchAdd-set_local_definitions
  endif
  au BufWinEnter * call s:set_local_definitions()
  au BufWinLeave * :silent! unlet b:switch_custom_definitions
augroup END

function! s:set_local_definitions() abort
  if has_key(s:definitions, &ft)
    let b:switch_custom_definitions = s:definitions[&ft]
  endif
endfunction
call s:set_local_definitions()

