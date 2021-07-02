-- TOML: default.toml
-- Repo: delphinus/agrp.nvim

--- Generate augroups with prefix "my".
---@param augroups table[augroup_name, autocmd_args]
---@return nil
U.augroup = function(augroups)
  for old_name, autocmd_args in pairs(augroups) do
    if not old_name:match("^my") then
      augroups[old_name] = nil
      local new_name = "my" .. old_name
      augroups[new_name] = autocmd_args
    end
  end
  return require"agrp".set(augroups)
end
