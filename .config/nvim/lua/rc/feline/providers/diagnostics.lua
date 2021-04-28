local vim = vim
local colors = require('rc.feline.colors')
local separators = require('rc.feline.separators')

local theme = {
  bg = colors.bg,
  error   = colors.red,
  warning = colors.yellow,
  hint    = colors.green,
  info    = colors.oceanblue,
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

local get_diagnostics_loclist = function (bufnr)
  bufnr = tostring(bufnr or vim.fn.bufnr())
  local info = vim.g.ale_buffer_info or {}
  local buf_info = info[bufnr] or {}
  local list = buf_info.loclist or {}
  return list
end
local diag_format = function (loc)
  local truncatable_if_too_long = '%<'
  return truncatable_if_too_long
    .. loc.type .. ':'
    .. ' ' .. loc.text
    .. ' [' .. loc.linter_name .. ']'
end
local get_first_diag_msg = function (type, bufnr)
  bufnr = bufnr or vim.fn.bufnr()
  local loclist = get_diagnostics_loclist(bufnr)
  for _, loc in pairs(loclist) do
    if loc.type == type then
      return diag_format(loc)
    end
  end
  return ''
end
diagnostics.error_msg = function (bufnr)
  return get_first_diag_msg('E')
end
diagnostics.warning_msg = function (bufnr)
  return get_first_diag_msg('W')
end
diagnostics.hint_msg = function (bufnr)
  return get_first_diag_msg('H')
end
diagnostics.info_msg = function (bufnr)
  return get_first_diag_msg('I')
end

diagnostics.error = function (bufnr)
  local dc = diagnostics_counts(bufnr)
  local error = (dc.error > 0 and dc.error or 0) + (dc.style_error > 0 and dc.style_error or 0)
  return error == 0 and ''
    or ' ' .. error .. ' '
end
diagnostics.warning = function (bufnr)
  local dc = diagnostics_counts(bufnr)
  local warning = (dc.warning > 0 and dc.warning or 0) + (dc.style_warning > 0 and dc.style_warning or 0)
  return warning == 0 and ''
    or ' ' .. warning .. ' '
end
diagnostics.hint = function (bufnr)
  local dc = diagnostics_counts(bufnr)
  return dc.hint == 0 and ''
    or ' ' .. dc.hint .. ' '
end
diagnostics.info = function (bufnr)
  local dc = diagnostics_counts(bufnr)
  return dc.info == 0 and ''
    or ' ' .. dc.info .. ' '
end

local sep_right = function(fg, bg) return separators.right.rounded_broad(fg, bg) end

-- TODO: Replace g:ale_echo_cursor.
diagnostics.right.error_msg = {
  provider = function () return diagnostics.error_msg() end,
  hl = {
    fg = colors.black,
    bg = theme.error,
  },
}

diagnostics.right.warning_msg = {
  provider = function () return diagnostics.warning_msg() end,
  hl = {
    fg = colors.black,
    bg = theme.warning,
  },
}

diagnostics.right.hint_msg = {
  provider = function () return diagnostics.hint_msg() end,
  hl = {
    fg = colors.black,
    bg = theme.hint,
  },
}

diagnostics.right.info_msg = {
  provider = function () return diagnostics.info_msg() end,
  hl = {
    fg = colors.black,
    bg = theme.info,
  },
}

diagnostics.right.error = {
  provider = function () return diagnostics.error() end,
  hl = {
    fg = colors.black,
    bg = theme.error,
  },
  left_sep = sep_right(theme.error, theme.bg),
}

diagnostics.right.warning = {
  provider = function () return diagnostics.warning() end,
  hl = {
    fg = colors.black,
    bg = theme.warning,
  },
  left_sep = sep_right(theme.warning, theme.error),
}

diagnostics.right.hint = {
  provider = function () return diagnostics.hint() end,
  hl = {
    fg = colors.black,
    bg = theme.hint,
  },
  left_sep = sep_right(theme.hint, theme.warning),
}

diagnostics.right.info = {
  provider = function () return diagnostics.info() end,
  hl = {
    fg = colors.black,
    bg = theme.info,
  },
  left_sep = {
    sep_right(theme.info, theme.hint),
  },
  right_sep = {
    sep_right(theme.bg, theme.info),
  },
}

return diagnostics
