local vim = vim
local colors = require('rc.feline.colors')

local theme = {
  error   = colors.red,
  warning = colors.yellow,
  hint    = colors.green,
  info    = colors.skyblue,
}

local diagnostics = {
  left = {},
  mid = {},
  right = {},
}

local diagnostics_counts = function (bufnr)
  bufnr = bufnr or vim.fn.bufnr()
  return vim.fn['ale#statusline#Count'](bufnr) or {}
end

diagnostics.error = function (bufnr)
  local dc = diagnostics_counts(bufnr)
  return (dc.error + dc.style_error) or 0
end
diagnostics.warning = function (bufnr)
  local dc = diagnostics_counts(bufnr)
  return (dc.warning + dc.style_warning) or 0
end
diagnostics.hint = function (bufnr)
  local dc = diagnostics_counts(bufnr)
  return dc.hint or 0
end
diagnostics.info = function (bufnr)
  local dc = diagnostics_counts(bufnr)
  return dc.info or 0
end

diagnostics.mid.error = {
  provider = function () return diagnostics.error() end,
  enabled = function() return diagnostics.error() > 0 end,
  hl = {
    fg = colors.black,
    bg = theme.error,
  },
}

diagnostics.mid.warning = {
  provider = function () return diagnostics.warning() end,
  enabled = function() return diagnostics.warning() > 0 end,
  hl = {
    fg = colors.black,
    bg = theme.warning,
  },
}

diagnostics.mid.hint = {
  provider = function () return diagnostics.hint() end,
  enabled = function() return diagnostics.hint() > 0 end,
  hl = {
    fg = colors.black,
    bg = theme.hint,
  },
}

diagnostics.mid.info = {
  provider = function () return diagnostics.info() end,
  enabled = function() return diagnostics.info() > 0 end,
  hl = {
    fg = colors.black,
    bg = theme.info,
  },
}

return diagnostics
