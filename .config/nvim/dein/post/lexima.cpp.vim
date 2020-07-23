" Another: post/lexima.vim

let s:key2rules = {}

let s:key2rules['<'] = [
      \ {'at': '\a\%#', 'input_after': '>'},
      \ {'at': '^#include \%#', 'input_after': '>'},
      \ ]

let s:key2rules['<C-:>'] = [
      \ {'at': '\%#>', 'input': '<C-g>U<Right>:'},
      \ ]
let s:key2rules['='] = [
      \ {'input': '=', 'at': '\%#.*;'},
      \ {'input': '=', 'input_after': ';', 'except': '(.*\%#.*)$'},
      \ ]
let s:key2rules[';'] = [
      \ {'input': '; ', 'at': 'if (.*\%#.*)'},
      \ ]

let s:key2rules['{'] = [
      \ {'input_after': '};', 'at': ' = .*\%#', 'except': '\v(;.*%#|%#.*;$)'},
      \ {'input_after': '};',
      \     'at': '\v<(struct|return|class)> .*\%#',
      \     'except': '\v(template <|;).*%#',
      \ },
      \ ]

let s:key2rules['<Space>'] = [
      \ {'at': '(.*\%#.*)',  'priority': 90},
      \ {'at': '{.*\%#.*}',  'priority': 90},
      \ {'at': '\[.*\%#.*]', 'priority': 90},
      \
      \ {'input': ' >> ',  'at': 'cin\%#'},
      \ {'input': ' << ', 'at': 'cout\%#'},
      \
      \ {'input': ' >> ',  'at': 'cin.*[^> ]\+\%#', 'except': '\v(;.*%#|%#.*[^;\]\)])'},
      \ {'input': ' << ', 'at': 'cout.*[^< ]\+\%#', 'except': '\v(;.*%#|%#.*[^;\]\)])'},
      \
      \ {'input': ' (', 'input_after': ')',
      \     'at': '\(if\|for\|while\)\%#',
      \     'syntax': ['cConditional', 'cRepeat']},
      \ ]

let s:key2rules['<C-space>'] = [
      \ {'at': 'cin  >> .\{-}\%#[''"]', 'input': '<C-g>U<Right> >> '},
      \ {'at': 'cout << .\{-}\%#[''"]', 'input': '<C-g>U<Right> << '},
      \ ]

let s:key2rules[','] = [
      \ {'at': 'cin .*\h\w*\%#', 'input': ' >> '},
      \ {'at': 'cout .*\h\w*\%#', 'input': ' << '},
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

