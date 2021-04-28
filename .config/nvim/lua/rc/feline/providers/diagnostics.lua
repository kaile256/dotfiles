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
  local default = {
    error = 0,
    hint = 0,
    warning = 0,
    style_error = 0,
    style_warning = 0,
  }
  -- Note: Without merging with default, ale#statusline#Count() possibly returns empty dictionary.
  local counts = vim.tbl_extend('keep', vim.fn['ale#statusline#Count'](bufnr), default)
  return counts
end

diagnostics.error = function (bufnr)
  local dc = diagnostics_counts(bufnr)
  local error = (dc.error > 0 and dc.error or 0) + (dc.style_error > 0 and dc.style_error or 0)
  return error > 0 and error or ''
end
diagnostics.warning = function (bufnr)
  local dc = diagnostics_counts(bufnr)
  local warning = (dc.warning > 0 and dc.warning or 0) + (dc.style_warning > 0 and dc.style_warning or 0)
  return warning > 0 and warning or ''
end
diagnostics.hint = function (bufnr)
  local dc = diagnostics_counts(bufnr)
  return dc.hint > 0 and dc.hint or ''
end
diagnostics.info = function (bufnr)
  local dc = diagnostics_counts(bufnr)
  return dc.info > 0 and dc.info or ''
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
