local lsp = {}

local coc_loading = {
  enabled = vim.g.coc_status ~= nil,
  provider = function ()
    local loading_stat = vim.fn['coc#status']() or '100%'
    if loading_stat:match('100%%') then
      return loading_stat
    end
    return ''
  end
}

lsp.loading = coc_loading

return lsp
