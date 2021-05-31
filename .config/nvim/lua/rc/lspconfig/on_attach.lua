local is_repmo_enabled = vim.fn['dein#tap']('repmo-vim')
local next_diagnostic = '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>'
local prev_diagnostic = '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'

if is_repmo_enabled then
  next_diagnostic, prev_diagnostic =
    [[repmo#Key('<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')]],
    [[repmo#Key('<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>')]]
end

local set_keymaps = function(client, bufnr)
  local maps = {
    n = {
      gd = '<Cmd>lua vim.lsp.buf.definition()<CR>',
      gD = '<Cmd>lua vim.lsp.buf.declaration()<CR>',
      gr = '<Cmd>lua vim.lsp.buf.references()<CR>',
      gR = '<Cmd>lua vim.lsp.buf.implementation()<CR>',
      gy = '<Cmd>lua vim.lsp.buf.type_definition()<CR>',
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

      ['='] = client.resolved_capabilities.document_range_formatting and '<Cmd>lua vim.lsp.buf.range_formatting()<CR>',
      ['=='] = client.resolved_capabilities.document_formatting and '<Cmd>lua vim.lsp.buf.formatting()<CR>',

      ['<C-w>d'] = '<Cmd>Telescope lsp_definitions<CR>',
      ['<C-w>r'] = '<Cmd>Telescope lsp_references<CR>',
      ['<C-w>R'] = '<Cmd>Telescope lsp_implementations<CR>',

      ['<C-w>x'] = '<Cmd>Telescope lsp_document_diagnostics<CR>',
      ['<C-w>gx'] = '<Cmd>Telescope lsp_workspace_diagnostics<CR>',

      ['<C-w>]'] = '<Cmd>Telescope lsp_document_symbols<CR>',
      ['<C-w>g]'] = '<Cmd>Telescope lsp_workspace_symbols<CR>',
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


local on_attach = function(client, bufnr)
  set_keymaps(client, bufnr)

  local buf_set_option = function(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- TOML: lsp.toml
  -- Repo: ray-x/lsp_signature
  local enabled, signature = pcall(require, "lsp_signature")
  if enabled then
    signature.on_attach()
  end
end

return on_attach
