-- TOML: default.toml
-- Repo: delphinus/mappy.nvim

---@type vim_map_function
U.nmap = function(...) return require"mappy".nmap(...) end
---@type vim_map_function
U.vmap = function(...) return require"mappy".vmap(...) end
---@type vim_map_function
U.xmap = function(...) return require"mappy".xmap(...) end
---@type vim_map_function
U.omap = function(...) return require"mappy".omap(...) end
---@type vim_map_function
U.imap = function(...) return require"mappy".imap(...) end
---@type vim_map_function
U.lmap = function(...) return require"mappy".lmap(...) end
---@type vim_map_function
U.cmap = function(...) return require"mappy".cmap(...) end
---@type vim_map_function
U.tmap = function(...) return require"mappy".tmap(...) end

---@type vim_map_function
U.nnoremap = function(...) return require"mappy".nnoremap(...) end
---@type vim_map_function
U.vnoremap = function(...) return require"mappy".vnoremap(...) end
---@type vim_map_function
U.xnoremap = function(...) return require"mappy".xnoremap(...) end
---@type vim_map_function
U.onoremap = function(...) return require"mappy".onoremap(...) end
---@type vim_map_function
U.inoremap = function(...) return require"mappy".inoremap(...) end
---@type vim_map_function
U.lnoremap = function(...) return require"mappy".lnoremap(...) end
---@type vim_map_function
U.cnoremap = function(...) return require"mappy".cnoremap(...) end
---@type vim_map_function
U.tnoremap = function(...) return require"mappy".tnoremap(...) end

--- Map as a set of motion mappings. (Recursive)
---@type vim_map_function
---@return nil
U.map_motion = function(...)
  -- Don't map to "s".
  return require"mappy".rbind('nox', ...)
end
--- Map as a set of motion mappings. (non Recursive)
---@type vim_map_function
---@return nil
U.noremap_motion = function(...)
  -- Don't map to "s".
  return require"mappy".bind('nox', ...)
end

--- Map as a set of textobj mappings. (Recursive)
---@overload fun(keys: string, command: vim_command)
---@overload fun(map_args: vim_map_args, keys: string, command: vim_command)
---@return nil
U.map_textobj = function(...)
  return require"mappy".bind("ox", ...)
end

--- Map as a set of textobj mappings. (non Recursive)
---@overload fun(keys: string, command: vim_command)
---@overload fun(map_args: vim_map_args, keys: string, command: vim_command)
---@return nil
U.noremap_textobj = function(...)
  return require"mappy".bind("ox", ...)
end
