-- TOML: lsp.toml
-- Repo: doums/lsp_spinner.nvim

local lsp_spinner = require'lsp_spinner'

-- register an handler for `$/progress` method
-- options are optional
lsp_spinner.setup {
  spinner = {'⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'},
  interval = 80, -- spinner frame rate in ms
  redraw_rate = 100, -- max refresh rate of statusline in ms
  placeholder = '  ', -- it will be displayed when there is no activity
}

local enable_work_done_progress = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  --- Turn on `window/workDoneProgress` capability
  lsp_spinner.init_capabilities(capabilities)
  return capabilities
end

return {
  enable_work_done_progress = enable_work_done_progress,
}
