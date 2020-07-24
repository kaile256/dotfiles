" Another: post/lexima.vim

" Delete duplicated '"' to comment in Vimscript.
let g:lexima#default_rules += [
      \ {'char': '<TAB>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><TAB>'},
      \ {'char': '<Space>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><space>'},
      \ {'char': '<S-Space>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><space>'},
      \ ]

let g:lexima#default_rules += [
      \ {'char': '<', 'at': 'map .*\%#', 'input_after': '>'},
      \ {'char': '<', 'at': 'exe [''"]norm .*\\\%#', 'input_after': '>'},
      \ ]

" Add comma to add either List or Dict nested.
let g:lexima#default_rules += [
      \ {'char': '{', 'at': '^\s*\\\s*\%#', 'input_after': '},'},
      \ {'char': '[', 'at': '^\s*\\\s*\%#', 'input_after': '],'},
      \ ]

let g:lexima#default_rules += [
      \ {'char': '(', 'at': '\\\%#', 'input_after': '\)'},
      \ ]

let s:key2rules = {}

" Insert backslashes when filetype is vim
let s:key2rules['<CR>'] = [
      \ {'at': '^\s*\\.*\%#', 'input': '<CR>\ ', 'except': '[]})]\s*$'},
      \
      \ {'at': '\(=\|\\\)\s*(\%#)',  'input': '<CR>\ ', 'input_after': '<CR>\ '},
      \ {'at': '\(=\|\\\)\s*{\%#}',  'input': '<CR>\ ', 'input_after': '<CR>\ '},
      \ {'at': '\(=\|\\\)\s*\[\%#]', 'input': '<CR>\ ', 'input_after': '<CR>\ '},
      \ ]

function! s:parse_list(dict) abort
  let rules_list = values(map(deepcopy(s:key2rules), {key, list
        \ -> map(list, {_, dict
        \     -> extend(dict, {
        \         'char': key,
        \         'filetype': 'vim',
        \         'mode': 'i',
        \         }, 'keep')
        \     })
        \ }))

  for rules in rules_list
    call extend(g:lexima#default_rules, rules)
  endfor
endfunction

call s:parse_list(s:key2rules)
unlet s:key2rules
delfunction s:parse_list

