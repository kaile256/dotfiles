local inactive = {
  left = {},
  right = {},
}

inactive.left[1] = {
  provider = 'file_type',
  hl = {
    fg = 'white',
    bg = 'oceanblue',
    style = 'bold'
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = 'NONE',
      bg = 'oceanblue'
    }
  },
  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'oceanblue'
      }
    },
    'slant_right'
  }
}

return inactive
