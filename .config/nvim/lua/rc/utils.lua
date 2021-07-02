--- Define Util functions.
---@type table
U = {}

---@alias vim_mode "n"|"v"|"x"|"s"|"o"|"i"|"l"|"c"|"t"
---@alias vim_map_args "buffer"|"nowait"|"silent"|"expr"|"unique" # "script" doesn't work in Lua.
---@alias vim_command string

---@alias augroup_name string # augroup name. The prefix "my" would be aded if the name don't start by "my".
---@alias au_events string # Like "VimEnter", "BufRead".
---@alias au_patterns string # Like "*", "*.lua".
---@alias autocmd_args table[au_events, au_patterns, vim_command|function] # augroup name.


---@alias vim_map_function fun(keys: string, command: vim_command) | fun(map_args: vim_map_args, keys: string, command: vim_command): nil
