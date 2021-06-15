" TOML: memo.toml
" Repo: oberblastmeister/neuron.nvim

let s:commands = {
      \ 'new': "'neuron/cmd'.new_edit(require'neuron'.config.neuron_dir)",
      \ 'find': "'neuron/telescope'.find_zettels()",
      \ 'find!': "'neuron/telescope'.find_zettels {insert = true}",
      \ 'refs': "'neuron/telescope'.find_backlinks()",
      \ 'refs!': "'neuron/telescope'.find_backlinks {insert = true}",
      \ 'tags!': "'neuron/telescope'.find_tags()",
      \ 'preview': "'neuron'.rib {address = '127.0.0.1:8200', verbose = true}",
      \ }

function! s:complete(A, C, P) abort
  if empty(a:A) | return keys(s:commands) | endif
  let matches = filter(keys(s:commands), 'v:val =~# "^". a:A')
  return matches
endfunction

function! s:neuron(arg) abort
  exe 'lua require'. s:commands[a:arg]
endfunction

command! -complete=customlist,s:complete -nargs=1 Neuron
      \ call s:neuron(<q-args>)
