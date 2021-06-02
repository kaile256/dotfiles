-- From: operator.toml
-- Repo: machakann/vim-sandwich
-- Fork: kaile256/vim-sandwich

if vim.fn['dein#tap']('vim-repeat') then
  vim.fn['dein#source']('vim-repeat')
  vim.cmd [[
  runtime autoload/repeat.vim
  nmap . <Plug>(operator-sandwich-predot)<Plug>(RepeatDot)
  ]]
end

-- Note: The documentations are splitted into three:
--   - sandwich
--   - textobj-sandwich
--   - operator-sandwich

-- Except: Options for recipes in textobj-sandwich/operation-sandwich
--   https://github.com/machakann/vim-sandwich/issues/74
-- - The difference between `kind` and `action`:
--   - `kind` roughly consists of two: `operator` and `textobj`, and `all` for both.
--     - `operator` consists of three: `add`, `delete`, `replace`.
--     - `textobj` consists of two: `auto`, `query`.
--   - `action` consists of two: `add` and `delete`.
--     - `kind/replace` consists both of `add` and `delete`.
--     - `action/add` contains `add` and `replace` of `kind`.
--     - `action/delete` contains `textobj`, `delete` and `replace` of `kind`.
-- - The difference between `motionwise` and `linewise`:
--   - `motionwise` is a filter for operator, through which a key input
--   produces the buns.  It has four options: 'char', 'line', 'block', and
--   'all'.
--   - `linewise` is an identifier how to insert or detect the buns. It has
--   three options: `0`, `1` or `2`.
--   If 0, detection/insertion won't work over lines, but within a line.
--   If 1, insertion will be done into independent lines around.

-- Note:  Don't copy `g:sandwich#recipes` from `g:sandwich#default_recipes`.
-- Duplicated recipes override other recipes.
-- TODO: Name eache group of recipes and reset `g:sandwich#recipes` just
-- before the for-loop.
vim.g['sandwich#recipes'] = {}

local recipes = {}

-- let recipes.comma = [
--      \ {
--      \   'buns': ['[,[{(]\s*', ',]})\s*'],
--      \   'regex': 1,
--      \   'input': [',']
--      \ },
--      \ ]

recipes.quote = {
  {
    buns =  {'^$', '^$'},
    regex =  1,
    linewise =  1,
    input =  {[[\<CR>]]},
  },
  {
    buns =  {'"', '"'},
    quoteescape =  1,
    expand_range =  0,
    nesting =  0,
    linewise =  0,
  },
  {
    buns =  {"'", "'"},
    quoteescape =  1,
    expand_range =  0,
    nesting =  0,
    linewise =  0,
  },
  {
    buns =  {'`', '`'},
    quoteescape =  1,
    expand_range =  0,
    nesting =  0,
    linewise =  0,
  },

  {
    buns =  {"'", "'"},
    filetype =  {'vim'},
    nesting =  0,
    linewise =  0,
  },
}

recipes.triple_quotes = {
  {
    input =  {"'"},
    buns =  {"'''", "'''"},
    nesting =  0,
    motionwise =  {'line'},
    linewise =  2,
    action =  {'add'},
  },
  {
    input =  {'"'},
    buns =  {'"""', '"""'},
    nesting =  0,
    motionwise =  {'line'},
    linewise =  2,
    action =  {'add'},
  },
  {
    input =  {'`'},
    buns =  {'```', '```'},
    nesting =  0,
    motionwise =  {'line'},
    linewise =  2,
    action =  {'add'},
  },
}

-- TODO: linewise textobj to delete at once.
recipes.bracket = {
  {
    input =  {'('},
    buns =  {'(', ')'},
    nesting =  1,
  },
  {
    input =  {'{'},
    buns =  {'{', '}'},
    nesting =  1,
    skip_break =  1,
  },
  {
    input =  {'['},
    buns =  {'[', ']'},
    nesting =  1,
  },
  {
    input =  {'<'},
    buns =  {'<', '>'},
    expand_range =  0,
  },

  {
    input =  {'('},
    buns =  {'(', ')'},
    action =  {'add'},
    kind =  {'add', 'replace'},
    linewise =  1,
    motionwise = {'line'},
    command =  {"'[+1,']-1 normal! >>"},
  },
  {
    input =  {'('},
    buns =  {'(', ')'},
    action =  {'delete'},
    kind =  {'delete', 'replace'},
    linewise =  1,
    nesting =  1,
    command =  {"'[,'] normal! <<"},
  },
  {
    input =  {'{'},
    buns =  {'{', '}'},
    action =  {'add'},
    kind =  {'add', 'replace'},
    linewise =  1,
    motionwise = {'line'},
    command =  {"'[+1,']-1 normal! >>"},
  },
  {
    input =  {'{'},
    buns =  {'{', '}'},
    action =  {'delete'},
    kind =  {'delete', 'replace'},
    linewise =  1,
    nesting =  1,
    command =  {"'[,'] normal! <<"},
  },
  {
    input =  {'['},
    buns =  {'[', ']'},
    action =  {'add'},
    kind =  {'add', 'replace'},
    motionwise = {'line'},
    linewise =  1,
    command =  {"'[+1,']-1 normal! >>"},
  },
  {
    input =  {'['},
    buns =  {'[', ']'},
    action =  {'delete'},
    kind =  {'delete', 'replace'},
    linewise =  1,
    nesting =  1,
    command =  {"'[,'] normal! <<"},
  },
  {
    input =  {'<'},
    buns =  {'<', '>'},
    action =  {'add'},
    kind =  {'add', 'replace'},
    linewise =  1,
    motionwise = {'line'},
    command =  {"'[+1,']-1 normal! >>"},
  },
  {
    input =  {'<'},
    buns =  {'<', '>'},
    action =  {'delete'},
    kind =  {'delete', 'replace'},
    linewise =  1,
    nesting =  1,
    command =  {"'[,'] normal! <<"},
  },

  {
    input =  {'<'},
    buns =  {[[\%(\\\@<!".*\zs\\\)\?<]], [[>\%(\ze.*\\\@<!"\)\?]]},
    regex =  1,
    filetype =  {'vim'},
    action =  {'delete'},
  },
}

recipes.escaped_brackets = {
  {
    input =  {'>'},
    buns =  {[[\<]], [[\>]]},
    nesting =  1,
  }, {
    input =   {')'},
    buns =  {[[\(]], [[\)]]},
    nesting =  1,
  },
  {
    input =   {'}'},
    buns =  {[[\{]], [[\}]]},
    nesting =  1,
  },
}

recipes.special_brackets = {
  {
    input =  {'%'},
    buns =  {[[\%(]], [[\)]]},
    nesting =  1,
    filetype =  {'vim'},
  },
  {
    input =  {']'},
    buns =  {'[[', ']]'},
    filetype =  {'lua'},
  },
}

-- https://github.com/monaqa/dotfiles/blob/32f70b3f92d75eaab07a33f8bf28ee17927476e8/.config/nvim/plugin-settings.vim#L679-L685
recipes.japanese = {
  {
    buns =  {'（', '）'},
    nesting =  1,
    input =  {'j(', 'j)'},
  },
  {
    buns =  {'「', '」'},
    nesting =  1,
    input =  {'j[', 'j]'},
  },
  {
    buns =  {'『', '』'},
    nesting =  1,
    input =  {'j{', 'j}'},
  },
  {
    buns =  {'【', '】'},
    nesting =  1,
    input =  {'j<', 'j>'},
  },
}

recipes.tag = {
  {
    buns =  'sandwich#magicchar#t#tag()',
    listexpr =  1,
    kind =  {'add'},
    action =  {'add'},
    input =  {'t', 'T'},
  },
  {
    buns =  'sandwich#magicchar#t#tag()',
    listexpr =  1,
    kind =  {'replace'},
    action =  {'add'},
    input =  {'T'},
  },
  {
    buns =  'sandwich#magicchar#t#tagname()',
    listexpr =  1,
    kind =  {'replace'},
    action =  {'add'},
    input =  {'t'},
  },
  {
    external =  {[[\<Plug>(textobj-sandwich-tag-i)]], [[\<Plug>(textobj-sandwich-tag-a)]]},
    noremap = 0,
    kind = {'delete', 'textobj'},
    expr_filter =  {'operator#sandwich#kind() !=# "replace"'},
    linewise =  1,
    input =  {'t', 'T'},
  },
  {
    external =  {[[\<Plug>(textobj-sandwich-tag-i)]], [[\<Plug>(textobj-sandwich-tag-a)]]},
    noremap = 0,
    kind = {'replace', 'query'},
    expr_filter =  {'operator#sandwich#kind() ==# "replace"'},
    input =  {'T'},
  },
  {
    external =  {[[\<Plug>(textobj-sandwich-tagname-i)]], [[\<Plug>(textobj-sandwich-tagname-a)]]},
    noremap = 0,
    kind = {'replace', 'textobj'},
    expr_filter =  {'operator#sandwich#kind() ==# "replace"'},
    input =  {'t'},
  },
}

recipes.list = {
  {
    buns =  {[[\<\%(\h\k*\.\)*\h\k*\[]], '\\]'},
    regex =  1,
    action =  {'delete'},
    input =  {'l'}
  },
}

-- Note: `s` comes from 'sequence' to get such format as foo[1], bar['baz'].
-- Instead, `d` from 'dictionary' is troublesome with `\dd` for me to delete
-- auto-detected buns; `a` from 'array' with text-objects; `v` from 'vector'
-- with v/V/<C-v> which decides motionwise; `t` from 'table' with tags; `l`
-- from 'list' is reserved for me by key-value text-object.
recipes.sequence = {
      {
        buns = {[[\<\%(\h\k*\.\)*\h\k*\[]], '\\]'},
        regex = 1,
        action = {'delete'},
        kind = {'query', 'delete', 'replace'},
        input = {'s'},
      },
    }

recipes.generic = {
  {
    buns =  {[[\<\%(\h\k*\.\)*\h\k*<]], '>'},
    regex =  1,
    action =  {'delete'},
    input =  {'g'},
  },
}

recipes.func = {
  {
    buns =  {'sandwich#magicchar#f#fname()', '")"'},
    kind =  {'add', 'replace'},
    action =  {'add'},
    expr =  1,
    input =  {'f'},
  },
  {
    external =  {[[\<Plug>(textobj-sandwich-function-ip)]], [[\<Plug>(textobj-sandwich-function-i)]]},
    noremap =  0,
    kind =  {'delete', 'replace', 'query'},
    input =  {'f'},
  },
  {
    external =  {[[\<Plug>(textobj-sandwich-function-ap)]], [[\<Plug>(textobj-sandwich-function-a)]]},
    noremap =  0,
    kind =  {'delete', 'replace', 'query'},
    input =  {'F'},
  },
  {
    buns =  {[[$(\h\w*\s*]], ')'},
    filetype =  {'make'},
    nesting =  1,
    regex =  1,
    action =  {'delete'},
    input =  {'f'},
  },
  {
    buns =  {'"$(". input("funcname: ") ." "', '")"'},
    filetype =  {'make'},
    nesting =  1,
    expr =  1,
    action =  {'add'},
    input =  {'f'},
  },
}

-- local set_for_loop = function()
--   local raw_var = vim.fn.input('[for-loop] var for each item: ')
--   local raw_list = vim.fn.input('[for-loop] list: ')
--
--   local vars = vim.fn.split(raw_var, '[ ,]+')
--   local var  = vim.fn.join(vars, ', ')
--   if var:match(',') then
--     var = '[' .. var .. ']'
--   end
--
--   -- TODO: keep `+`
--   local lists = vim.fn.split(raw_list, '[ ,]+')
--   local list  = vim.fn.join(lists, ', ')
--   if list:match(',') then
--     list = '['.. list ..']'
--   end
--
--   local format = string.format('for %s in %s', var, list)
--
--   return format
-- end
recipes.for_loop = {
  --  {
  --    buns =  {set_for_loop, '"endfor"'},
  --    kind =  {'add', 'replace'},
  --    action =  {'add'},
  --    lua =  1,
  --    motionwise =  {'line'},
  --    input =  {'gf'},
  --    filetype =  {'vim'},
  --  },
  --  {
  --    buns =  {set_for_loop, '"endfor"'},
  --    kind =  {'add', 'replace'},
  --    action =  {'add'},
  --    lua =  1,
  --    motionwise =  {'char', 'block'},
  --    linewise = 1,
  --    input =  {'gf'},
  --    filetype =  {'vim'},
  --  },

  {
    buns =  {'"for (". input("for-loop condition: ") .") {"', '"}"'},
    kind =  {'add'},
    action =  {'add'},
    expr =  1,
    input =  {'gf'},
    filetype =  {'c', 'cpp', 'java', 'go'},
  },

  {
    buns =  {'for .*', 'endfor'},
    kind =  {'delete', 'replace'},
    action =  {'delete'},
    input =  {'gf'},
    filetype =  {'vim'},
  },
}

recipes.while_loop = {
  {
    buns =  {'"while ". input("[while-loop] condition: ")', '"endwhile"'},
    kind =  {'add'},
    action =  {'add'},
    motionwise =  {'line'},
    expr =  1,
    input =  {'gw'},
    filetype =  {'vim'},
  },
  {
    buns =  {'"\nwhile ". input("[while-loop] condition: ") ."\n"', '"\nendwhile\n"'},
    kind =  {'add'},
    action =  {'add'},
    motionwise =  {'char', 'block'},
    expr =  1,
    input =  {'gw'},
    filetype =  {'vim'},
  },

  {
    buns =  {'"while (". input("cond: ") .") {"', '"}"'},
    kind =  {'add'},
    action =  {'add'},
    expr =  1,
    input =  {'w'},
    filetype =  {
      'c',
      'cpp',
      'java',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    },
  },
}

-- Note: `I` to reproduce the last inputs for `i`.
recipes.instant = {
  {
    buns =  'sandwich#magicchar#i#input("operator")',
    kind =  {'add', 'replace'},
    action =  {'add'},
    listexpr =  1,
    input =  {'i'},
  },
  {
    buns =  'sandwich#magicchar#i#input("textobj", 1)',
    kind =  {'delete', 'replace', 'query'},
    listexpr =  1,
    regex =  1,
    input =  {'i'},
  },
  {
    buns =  'sandwich#magicchar#i#lastinput("operator", 1)',
    kind =  {'add', 'replace'},
    action =  {'add'},
    listexpr =  1,
    input =  {'I'},
  },
  {
    buns =  'sandwich#magicchar#i#lastinput("textobj")',
    kind =  {'delete', 'replace', 'query'},
    listexpr =  1,
    regex =  1,
    input =  {'I'},
  },
}

recipes.whitespace = {
  {
    buns =  {[[\s\+]], [[\s\+]]},
    regex =  1,
    action =  {'delete'},
    input =  {' '},
  },
}

recipes.newline = {
  {
    buns =  {'^$', '^$'},
    regex =  1,
    linewise =  1,
    input =  {[[\<CR>]]},
  },
  {
    buns =  {'', ''},
    action =  {'add'},
    motionwise =  {'line'},
    linewise =  1,
    input =  {[[\<CR>]]},
  },
  {
    input =  {[[\<CR>]]},
    buns =  {[[\<CR>\\ ]], [[\\\<CR>]]},
    linewise =  1,
    filetype =  {'vim'},
    action =  {'add'},
  },
  {
    input =  {[[\<CR>]]},
    buns =  {[[\<CR>\\ ]], [[\<CR>\\ ]]},
    linewise =  0,
    filetype =  {'vim'},
    action =  {'add'},
  },
}

local global_recipes = {}
for _, rs in pairs(recipes) do
  for _, r in pairs(rs) do
    global_recipes[#global_recipes+1] = r
  end
end
vim.g['sandwich#recipes'] = global_recipes
