-- TOML: appearance.toml
-- Repo: ojroques/nvim-hardline

local sign = {
  truncatable_if_too_long = '%<',
  regular_intervals = '%=',
}

local part = {
  mode = {
    class = 'mode',
    item = require('hardline.parts.mode').get_item,
  },
  git = {
    class = 'high',
    item = require('hardline.parts.git').get_item,
    hide = 80,
  },
  lsp = {
    error = {
      class = 'error',
      item = require('hardline.parts.lsp').get_error,
    },
    warning = {
      class = 'warning',
      item = require('hardline.parts.lsp').get_warning,
    },
  },

  style = {
    whitespace = {
      class = 'warning',
      item = require('hardline.parts.whitespace').get_item
    },
  },

  buffer = {
    filename = {
      class = 'med',
      item = require('hardline.parts.filename').get_item,
    },

    filetype = {
      class = 'high',
      item = require('hardline.parts.filetype').get_item,
      hide = 80,
    },

    word_count = {
      class = 'low',
      item = require('hardline.parts.wordcount').get_item,
      hide = 80,
    },

    line = {
      class = 'mode',
      item = require('hardline.parts.line').get_item,
    },
  }
}

local sections = {
  part.mode,
  part.git,

  sign.truncatable_if_too_long,

  part.buffer.filename,
  {
    class = 'med',
    item = sign.regular_intervals,
  },
  part.buffer.word_count,
  part.lsp.error,
  part.lsp.warning,

  part.style.whitespace,
  part.buffer.filetype,
  part.buffer.line,
}

require('hardline').setup {
  sections = sections,
  -- theme = 'one',
  bufferline = false,
  bufferline_settings = {
    exclude_terminal = false,
    show_index = false,
  },
}
