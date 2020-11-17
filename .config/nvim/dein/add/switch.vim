" TOML: operator.toml
" Repo: AndrewRadev/switch.vim
" Another: source/switch.vim

" Excerpt: Regexp support in Dictionary, e.g.,
" let b:switch_custom_definitions = [{
"     \ '<div\(.\{-}\)>\(.\{-}\)</div>':   '<span\1>\2</span>',
"     \ '<span\(.\{-}\)>\(.\{-}\)</span>': '<div\1>\2</div>',
"     \ }]

nnoremap <silent> <Plug>(switch-extra)
      \ :<C-u>call switch#Switch(
      \     {'definitions': g:switch_extra_definitions})<CR>
nnoremap <silent> <Plug>(switch-extra-reverse)
      \ :<C-u>call switch#Switch(
      \     {'definitions': g:switch_extra_definitions, 'reverse': 1})<CR>

function! s:increment() abort
  let cnt = v:count1
  silent! call repeat#set("\<Plug>(switch-or-dating)")
  let save_line = getline('.')

  let is_switched = switch#Switch()
  if is_switched | return | endif
  call speeddating#increment(cnt)

  if  getline('.') !=# save_line | return | endif
  exe "norm \<Plug>(switch-extra)"
endfunction

function! s:decrement() abort
  let cnt = v:count1
  silent! call repeat#set("\<Plug>(switch-or-dating-reverse)")
  let save_line = getline('.')

  let is_switched = switch#Switch({'reverse': 1})
  if is_switched | return | endif
  call speeddating#increment(- cnt)

  if getline('.') !=# save_line | return | endif
  exe "norm \<Plug>(switch-extra-reverse)"
endfunction

nmap <silent> <Plug>(switch-or-dating)         :<C-u>call <SID>increment()<CR>
nmap <silent> <Plug>(switch-or-dating-reverse) :<C-u>call <SID>decrement()<CR>

nmap <silent> z<C-x>
      \ <Plug>(switch-or-dating):<C-u>silent!
      \ call repeat#set("\<lt>Plug>(switch-or-dating)")<CR>
nmap <silent> z<C-a>
      \ <Plug>(switch-or-dating-reverse):<C-u>silent!
      \ call repeat#set("\<lt>Plug>(switch-or-dating-reverse)")<CR>

let s:definitions = {}

let s:definitions['cpp'] = [
      \ {
      \   '\<\(\a*\)map\>': 'unordered_\1map',
      \   '\<unordered_\(\a*\)map\>': '\1map',
      \ },
      \ {
      \   '\<\(\a*\)set\>': 'unordered_\1set',
      \   '\<unordered_\(\a*\)set\>': '\1set',
      \ },
      \ {
      \   '\(\h\w*\)++': '++\1',
      \   '\(\h\w*\)--': '--\1',
      \
      \   '++\(\h\w*\)': '--\1',
      \   '--\(\h\w*\)': '++\1',
      \ },
      \
      \ {
      \   '\<constexpr \(\h\w* =\)': 'const \1',
      \   '\<const \(\h\w* =\)':     'constexpr \1',
      \ },
      \
      \ ['auto &&', 'const auto &'],
      \ ['.push', '.emplace'],
      \ ]

let s:definitions['sh'] = [
      \ {
      \   '\[ \(\S.\{-}\) ];': 'test \1;',
      \   'test \(\S.\{-}\);': '[ \1 ];'
      \ },
      \
      \ {
      \   '\<if\>':    'elif',
      \   '\<elif\>':  'if',
      \   'fi\n\s*if': 'elif',
      \ },
      \ ]

let s:definitions['vim'] = [
      \ ["'\"'", '"''"'],
      \
      \ ['*', '\\{-}', '\\+'],
      \
      \ ['==', '!='],
      \ ['\\zs', '\\ze'],
      \
      \ ['nmap', 'xmap', 'omap'],
      \ ['imap', 'cmap', 'tmap'],
      \
      \ ['nnoremap', 'xnoremap', 'onoremap'],
      \ ['inoremap', 'cnoremap', 'tnoremap'],
      \
      \ ['if', 'elseif'],
      \ ['finish', 'return'],
      \
      \ ['<silent>', '<script>'],
      \
      \ ['plugin/', 'autoload/'],
      \ ['add/', 'source/', 'post/'],
      \
      \ {
      \   '\(\a\+\)enter\c': '\1Leave',
      \   '\(\a\+\)leave\c': '\1Enter',
      \ },
      \
      \ {
      \   '\(syn\%[tax]\) keyword': '\1 match',
      \   '\(syn\%[tax]\) match':   '\1 region',
      \   '\(syn\%[tax]\) region':  '\1 keyword',
      \ },
      \ {
      \   '\(set\l*\) no\(\l+\)': '\1 \2',
      \ },
      \ {
      \   'cterm=': 'gui=',
      \   'gui=': 'cterm=',
      \
      \   'ctermfg=': 'guifg=',
      \   'guifg=': 'ctermfg=',
      \
      \   'ctermbg=': 'guibg=',
      \   'guibg=': 'ctermbg=',
      \ },
      \ ]

let s:definitions['toml'] = [
      \ ['hook_add', 'hook_source', 'hook_post_source', 'hook_done_update'],
      \ ['on_map', 'on_cmd', 'on_func'],
      \ ['add/', 'source/', 'post/'],
      \ ]

let s:definitions['gitcommit'] = [
      \ ['feat', 'fix', 'refactor'],
      \ ['style', 'docs'],
      \ ]

let s:definitions['gitrebase'] = [
      \ ['pick', 'squash', 'reword', 'edit', 'exec', 'break', 'merge'],
      \ ['reset', 'label']
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

let s:definitions['python'] = [
      \ ['spam', 'ham', 'eggs'],
      \ {
      \   'elseif': 'elif',
      \   'else if': 'elif',
      \ },
      \
      \ ['vim.command(,', 'vim.eval('],
      \ ]

let s:definitions['snippets'] = [
      \ {
      \   '`!v \(.*\)`': '`!p snip.rv = \1`',
      \   '`!p snip.rv = \(.*\)`': '`!v \1`',
      \ },
      \ ]

function! s:extend_definitions_for_snippets() abort
  let definitions = get(b:, 'switch_custom_definitions', [])

  call extend(definitions, get(s:definitions, 'vim', []))
  call extend(definitions, get(s:definitions, 'python', []))

  function! s:detect_extra_filetype() abort closure
    let full_path = expand('%:p')

    let roots = get(g:, 'UltiSnipsSnippetDirectories')
    let roots = map(roots, 'substitute(v:val, "/*$", "", "")')

    for r in sort(roots)
      let rel_path = matchstr(full_path, r .'/\zs\f\+')
      if !empty(rel_path) && rel_path !=# full_path
        let ft = matchstr(rel_path, '\v\f{-}\ze(/|\.)')
        return ft
      endif
    endfor

    return ''
  endfunction

  let ft = s:detect_extra_filetype()
  if index(['snippets', 'python', 'vim', ''], ft) == -1
    call extend(definitions, get(s:definitions, ft, []))
  endif

  let b:switch_custom_definitions = definitions
endfunction

augroup mySwitchAdd-set_local_definitions "{{{1
  " Note: b:switch_custom_definitions should be defined in advance of the
  " plugin loaded.
  au BufWinEnter * call s:set_local_definitions()
  au BufWinEnter *.snippets call s:extend_definitions_for_snippets()
augroup END

function! s:set_local_definitions() abort
  if !has_key(s:definitions, &ft) | return | endif
  let b:switch_custom_definitions = s:definitions[&ft]
  au BufWinLeave <buffer> ++once :silent! unlet b:switch_custom_definitions
endfunction
call s:set_local_definitions()

