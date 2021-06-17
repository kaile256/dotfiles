--- TOML: lsp.toml
--- Repo: lspcontainers/lspcontainers.nvim

local Containers = {}

---@note Some languageserver might demand to sync volume mount on particular container. See lspcontainers.nvim/README.md.
local is_lspcontainers_available, lspcontainers = pcall(require, 'lspcontainers')

--- This function is supposed to be used in rc/lsp/config/pos.lua.
Containers.lspcontainer_or_cmd = function(server, cmd)
  if not is_lspcontainers_available then return cmd end
  local enabled, container = pcall(lspcontainers.command, server)
  return enabled and container or cmd
end

return Containers
