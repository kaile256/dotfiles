" Another: post/lexima.vim

" Delete duplicated '"' to comment in Vimscript.
let g:lexima#default_rules += [
      \ {'char': '<TAB>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><TAB>'},
      \ {'char': '<Space>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><space>'},
      \ {'char': '<S-Space>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><space>'},
      \ ]

let s:key2rules = {}

" Insert backslashes when filetype is vim
let s:key2rules['<CR>'] = [
      \ {'at': '^\s*\', 'input': '<CR>\ ', 'except': '[]})]\s*$'},
      \
      \ {'at': '(\%#)',  'input': '<CR>\ ', 'input_after': '<CR>\ '},
      \ {'at': '{\%#}',  'input': '<CR>\ ', 'input_after': '<CR>\ '},
      \ {'at': '\[\%#]', 'input': '<CR>\ ', 'input_after': '<CR>\ '},
      \ ]

function! s:parse_list(dict) abort
  let rules_list = values(map(deepcopy(s:key2rules), {key, list
        \ -> map(list, {_, dict
        \     -> extend(dict, {
        \         'char': key,
        \         'filetype': 'cpp',
        \         'mode': 'i',
        \         }, 'keep')
        \     })
        \ }))

  for rules in rules_list
    call extend(g:lexima#default_rules, rules)
    " for r in rules
    "   call lexima#add_rule(r)
    " endfor
  endfor
endfunction

call s:parse_list(s:key2rules)
unlet s:key2rules
delfunction s:parse_list

