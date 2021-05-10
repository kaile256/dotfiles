local vim = vim

local lsp = {}

lsp.loading = {
  enabled = vim.g.coc_status ~= nil,
  provider = function ()
    local loading_stat = vim.fn['coc#status']() or '100%'
    if loading_stat:match('100%%') then
      return loading_stat
    end
    return ''
  end
}

return lsp
