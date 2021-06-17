--- TOML: lsp.toml
--- Repo: lspcontainers/lspcontainers.nvim

local Containers = {}

---@note Some languageserver might demand to sync volume mount on particular container. See lspcontainers.nvim/README.md.
local is_lspcontainers_available, lspcontainers = pcall(require, 'lspcontainers')

--- This function is supposed to be used in rc/lsp/config/pos.lua.
Containers.lspcontainer_or_cmd = function(server, cmd)
  if not is_lspcontainers_available then return cmd end
  local enabled, container_cmd_sequence = pcall(lspcontainers.command, server)
  if not enabled then return cmd end
  local pat_container_name = "^(lspcontainers/%S-):[0-9.]-$"
  for idx, container_cmd in pairs(container_cmd_sequence) do
    if container_cmd:match(pat_container_name) then
      local container_name = container_cmd
      local latest_container = container_name:gsub(pat_container_name, "%1:latest")
      container_cmd_sequence[idx] = latest_container
    end
  end
  return container_cmd_sequence
end

return Containers
