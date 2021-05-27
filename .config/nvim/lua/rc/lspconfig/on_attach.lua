local is_repmo_enabled = vim.fn['dein#tap']('repmo-vim')
local next_diagnostic = '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>'
local prev_diagnostic = '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'

if is_repmo_enabled then
  next_diagnostic, prev_diagnostic =
    [[repmo#Key('<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')]],
    [[repmo#Key('<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>')]]
end

local set_keymaps = function(client, bufnr)

  local buf_set_keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=true, silent=true, nowait=true }
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gR', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gy', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'cs', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)

  buf_set_keymap('n', '<C-]>', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  -- buf_set_keymap('n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  buf_set_keymap('n', '[x', prev_diagnostic, { noremap=false, nowait=true, expr=true })
  buf_set_keymap('n', ']x', next_diagnostic, { noremap=false, nowait=true, expr=true })
  buf_set_keymap('n', 'gx', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', 'gX', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)


  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '==', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('n', '=', '<Cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
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
