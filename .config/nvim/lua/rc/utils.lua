--- Define Util functions.
---@type table
U = {}

---@alias vim_mode '"n"'|'"v"'|'"x"'|'"s"'|'"o"'|'"i"'|'"l"'|'"c"'|'"t"'
---@alias vim_map_args '"buffer"'|'"nowait"'|'"silent"'|'"expr"'|'"unique"' # '"script"' doesn't work in Lua.
---@alias vim_command string

---@alias augroup_name string # augroup name. The prefix "my" would be aded if the name don't start by "my".
---@alias au_events string # Like "VimEnter", "BufRead".
---@alias au_patterns string # Like "*", "*.lua".
---@alias autocmd_args table[au_events, au_patterns, vim_command|function] # augroup name.


---@alias vim_map_function fun(keys: string, command: vim_command) | fun(map_args: vim_map_args, keys: string, command: vim_command): nil

--- Execute `vim.api.nvim_feedkeys()`, interpreting `"<Esc>"`, `"<Plug>"`, ..., as VimL interprets `"\<Esc>"`,
--- `"\<Plug>"`, etc.
---@param keys string
---@param flags? '"m"'|'"n"'
---|'"t"' # Handle keys as if typed; otherwise, they are handled as if coming from a mapping. This matters for undo, opeing folds, etc.
---|'"i"'
---|'"x"' # Execute commands until typehead is empty like using `:normal!`.
---|'"!"' # With "x", it won't end Insert mode. Useful for testing `CursorHoldI`.
U.feedkeys = function(keys, flags)
  local termcodes = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(termcodes, flags, true)
end
