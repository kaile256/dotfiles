-- Ref: $VIMRUNTIME/lua/vim/lsp/buf.lua

local is_repmo_enabled = vim.fn['dein#tap']('repmo-vim')

local tostring = function(tbl)
  return vim.inspect(tbl):gsub('\n', '')
end

local config_goto = {
  wrap = false,
}

local next_diagnostic = '<Cmd>lua vim.lsp.diagnostic.goto_next(' .. tostring(config_goto) .. ')<CR>'
local prev_diagnostic = '<Cmd>lua vim.lsp.diagnostic.goto_prev(' .. tostring(config_goto) .. ')<CR>'

if is_repmo_enabled then
  next_diagnostic, prev_diagnostic =
    "repmo#Key('" .. next_diagnostic .. "', '" .. prev_diagnostic .. "')",
    "repmo#Key('" .. prev_diagnostic .. "', '" .. next_diagnostic .. "')"
end

local is_telescope_enabled = vim.fn["dein#tap"]("telescope.nvim")
local set_keymaps = function(client, bufnr)
  local maps = {
    n = {
      gd = is_telescope_enabled and '<Cmd>Telescope lsp_definitions<CR>'     or '<Cmd>lua vim.lsp.buf.definition()<CR>',
      gD = is_telescope_enabled and '<Cmd>Telescope lsp_declaration<CR>'     or '<Cmd>lua vim.lsp.buf.declaration()<CR>',
      gr = is_telescope_enabled and '<Cmd>Telescope lsp_references<CR>'      or '<Cmd>lua vim.lsp.buf.references()<CR>',
      gy = is_telescope_enabled and '<Cmd>Telescope lsp_implementations<CR>' or '<Cmd>lua vim.lsp.buf.implementation()<CR>',

      cs = '<Cmd>lua vim.lsp.buf.rename()<CR>',

      ['<C-]>'] = '<Cmd>lua vim.lsp.buf.hover()<CR>',
      ['<C-k>'] = '<Cmd>lua vim.lsp.buf.signature_help()<CR>',

      -- '<space>wa' = '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
      -- '<space>wr' = '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
      -- '<space>wl' = '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',

      ['[x'] = { prev_diagnostic, { noremap=false, nowait=true, expr=true } },
      [']x'] = { next_diagnostic, { noremap=false, nowait=true, expr=true } },
      gx = '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
      gX = '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',

      ["<M-Space>x"]   = is_telescope_enabled and '<Cmd>Telescope lsp_document_diagnostics<CR>'  or '<Cmd>lua vim.lsp.buf.document_diagnostics()<CR>',
      ["<M-Space>s"]   = is_telescope_enabled and '<Cmd>Telescope lsp_document_symbols<CR>'      or '<Cmd>lua vim.lsp.buf.document_symbols()<CR>',
      ["<M-S-Space>x"] = is_telescope_enabled and '<Cmd>Telescope lsp_workspace_diagnostics<CR>' or '<Cmd>lua vim.lsp.buf.workspace_diagnostics()<CR>',
      ["<M-S-Space>s"] = is_telescope_enabled and '<Cmd>Telescope lsp_workspace_symbols<CR>'     or '<Cmd>lua vim.lsp.buf.workspace_symbols()<CR>',

      ['='] = client.resolved_capabilities.document_range_formatting and '<Cmd>lua vim.lsp.buf.range_formatting()<CR>',
      ['=='] = client.resolved_capabilities.document_formatting and '<Cmd>lua vim.lsp.buf.formatting()<CR>',
    },

    x = {
      ['='] = client.resolved_capabilities.document_range_formatting and '<Cmd>lua vim.lsp.buf.range_formatting()<CR>'
    }
  }

  local opts = { noremap=true, silent=true, nowait=true }
  for mode, key2command in pairs(maps) do
    local buf_set_keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, mode, ...) end
    local was_mapped_locally = function(key) return vim.fn.maparg(key, mode, 0, 1).buffer end
    for key, command in pairs(key2command) do
      if command then
        ---@diagnostic disable-next-line:redefined-local
        local opts = opts
        if type(command) == "table" then
          opts = command[2]
          command = command[1]
        end
        if was_mapped_locally(key) ~= 1 then
          buf_set_keymap(key, command, opts)
        end
      end
    end
  end
end

---@type table<string, function> # key represents a dependent module.
local additional_actions = {
  -- TOML: lsp.toml
  -- Repo: ray-x/lsp_signature
  lsp_signature = function(_, _)
    require"lsp_signature".on_attach()
  end;
  -- TOML: lsp.toml
  -- Repo: kosayoda/nvim-lightbulb
  ["nvim-lightbulb"] = function(client, bufnr)
    local is_code_action_unavailable = not client.resolved_capabilities.code_action
    if is_code_action_unavailable then return end
    local config = {
      sign = {
        priority = 100,
      };
    }
    local autocmds = ([[
    augroup myLightbulb/CheckIfCodeActionsAreAvailable
    autocmd!
    autocmd CursorHold,CursorHoldI <buffer%s> lua require"nvim-lightbulb".update_lightbulb(%s)
    augroup END
    ]]):format(bufnr == 0 and "" or "=" .. bufnr, tostring(config))
    vim.cmd(autocmds)
  end;
}

local on_attach = function(client, bufnr)
  set_keymaps(client, bufnr)

  local buf_set_option = function(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  for module, induce_action in pairs(additional_actions) do
    local enabled, _ = pcall(require, module)
    if enabled then
      induce_action(client, bufnr)
    end
  end
end

return on_attach
