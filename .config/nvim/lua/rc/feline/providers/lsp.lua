local lsp = vim.lsp

local Lsp = {}

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

local lsp_loading = {
  enabled = function() return not vim.tbl_isempty(lsp.buf_get_clients()) end,
  provider = function() return require"lsp_spinner".status() end,
}

if vim.fn["dein#tap"]("lsp_spinner") then
  Lsp.loading = lsp_loading
else
  Lsp.loading = coc_loading
end

return Lsp
