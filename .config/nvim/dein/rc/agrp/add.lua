-- TOML: default.toml
-- Repo: delphinus/agrp.nvim

---@alias autocmd_args table[au_events, au_patterns, vim_command|function] # augroup name.
---@alias agrp_args table<autocmd_args, augroup_name>[]

---@overload fun(augroups: agrp_args|table<string, autocmd_args>): agrp_args
---@param augroup_name augroup_name
---@param autocmd_args autocmd_args
---@return agrp_args
local parse_args = function(augroup_name, autocmd_args)
  local augroups
  if type(augroup_name) == "table" then
    if type(augroup_name) == "string" then
      augroups = { augroup_name }
    end
    augroups = augroup_name
  else
    augroups = { [augroup_name] = autocmd_args }
  end
  return augroups
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
