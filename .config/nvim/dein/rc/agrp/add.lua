-- TOML: default.toml
-- Repo: delphinus/agrp.nvim

---@alias autocmd_args table[au_events, au_patterns, vim_command|function] # augroup name.
---@alias agrp_args table<string, autocmd_args>[]

---@overload fun(augroups: agrp_args): agrp_args
---@overload fun(augroup_name: string, agrp_args: autocmd_args|table<string, autocmd_args>): agrp_args
---@return agrp_args
local parse_args = function(...)
  local first = select(1, ...)
  if type(first) == "table" then
      return first
  end

  local second = select(2, ...)
  vim.validate({ second_arg = { second, "table" } })

  local augroup_name = first
  local autocmd_args
  if type(second[1]) == "table" then
    autocmd_args = second
  elseif type(second[1]) == "string" then
    autocmd_args = { second }
  else
    error("The second argument is invalid type: " .. type(second))
  end
  local agrp_args = { [augroup_name] = autocmd_args }
  return agrp_args
end

--- Generate augroups with prefix "my".
---@param augroups agrp_args
---@return nil
local set_augroup = function(augroups)
  for old_name, autocmd_args in pairs(augroups) do
    if not old_name:match("^my") then
      augroups[old_name] = nil
      local new_name = "my" .. old_name
      augroups[new_name] = autocmd_args
    end
  end
  require"agrp".set(augroups)
end

--- Generate augroups with prefix "my".
---@overload fun(augroups: agrp_args|table<string, autocmd_args>): nil
---@param augroup_name augroup_name
---@param autocmd_args autocmd_args
---@return nil
U.augroup = function(augroup_name, autocmd_args)
  local augroups = parse_args(augroup_name, autocmd_args)
  set_augroup(augroups)
end
