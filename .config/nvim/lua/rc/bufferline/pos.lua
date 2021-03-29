-- TOML: appearance.toml
-- Repo: akinsho/nvim-bufferline.lua

local vim = vim

require'bufferline'.setup {
  options = {
    view = 'multiwindow', -- 'multiwindow' | 'default'
    numbers = 'ordinal', -- 'none' | 'ordinal' | 'buffer_id'
    number_style = 'superscript', -- 'superscript' | ''
    mappings = true, -- true | false

    buffer_close_icon  = '',
    modified_icon      = '●',
    close_icon         = '',
    left_trunc_marker  = '',
    right_trunc_marker = '',

    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,

    diagnostics = 'nvim_lsp', -- false | 'nvim_lsp',
    diagnostics_indicator = function(count, level)
      return '('.. count ..')'
    end;

    -- NOTE: custom_filter will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= '<i-dont-want-to-see-this>' then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= '<buffer-name-I-dont-want>' then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == '<work-repo>' and vim.bo[buf_number].filetype ~= 'wiki' then
        return true
      end
    end,

    show_buffer_close_icons = false, -- true | false,
    show_close_icon = false, -- true | false,
    show_tab_indicators = true, -- true | false,

    -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    persist_buffer_sort = true,

    separator_style = 'slant', -- 'slant' | 'thick' | 'thin' | { 'any', 'any' },
    enforce_regular_tabs = true, -- false | true,
    always_show_bufferline = true, -- true | false,
    sort_by = 'directory', -- 'extension' | 'relative_directory' | 'directory' | [custom sort function]
  }
}
