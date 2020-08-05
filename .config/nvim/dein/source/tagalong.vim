" TOML: insert.toml
" Repo: AndrewRadev/tagalong.vim

" map in dict; keep in String to map to bared key.
" default: ['c', 'C', 'v', 'i', 'a']
" Excerpt:
"   for [native_key, override_key] in items(key)
"       exe 'nnoremap <buffer><silent> ' . override_key .
"         \ ' :<c-u>call tagalong#Trigger("' . escape(native_key, '"') . '", v:count)<cr>'
"   endfor
let g:tagalong_mappings = [
      \ {'"_s': '<space>s'},
      \ {'"_c': '<space>c'},
      \ 's',
      \ 'c',
      \ 'C',
      \ 'i',
      \ 'a',
      \ ]

let g:tagalong_filetypes = [
      \ 'eco',
      \ 'ejs',
      \ 'eruby',
      \ 'html',
      \ 'htmldjango',
      \ 'javascriptreact',
      \ 'jsx',
      \ 'php',
      \ 'typescriptreact',
      \ 'xml',
      \ ]
