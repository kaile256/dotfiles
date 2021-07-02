-- TOML: telescope.toml
-- Repo: nvim-telescope/telescope.nvim

local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },

    selection_strategy = "reset", -- reset, row, follow
    sorting_strategy = "ascending",

    layout_strategy = "horizontal", -- horizontal, vertical, or flex.
    layout_config = {
      horizontal = {
        prompt_position = "top",
      },
    },

    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,

    winblend = 20,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe

    -- file_previewer = require'telescope.previewers'.cat.new,
    -- grep_previewer = require'telescope.previewers'.vimgrep.new,
    -- qflist_previewer = require'telescope.previewers'.qflist.new,
    -- buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,

    mappings = {
      -- Ref: telescope/mappings.lua

      -- To disable a keymap, set [map] to false.
      i = {
        ["<C-c>"] = actions.close,

        ["<C-n>"] = false,
        ["<C-p>"] = false,
        ["<C-g>"] = actions.move_selection_next,
        ["<C-t>"] = actions.move_selection_previous,

        ["<C-x>"] = false,
        ["<C-v>"] = false,
        -- ["<C-t>"] = false,
        ["<A-s>"] = actions.select_horizontal,
        ["<A-v>"] = actions.select_vertical,
        ["<A-t>"] = actions.select_tab,

        -- ["<Tab>"] = actions.add_selection, -- Not implemented yet.
        -- Disable scrolling in Insert Mode.

        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },

      n = {
        ["<C-c>"] = actions.close,
        ["<Esc>"] = actions.close,

        ["<CR>"] = actions.select_default + actions.center,

        ["<C-x>"] = false,
        ["<C-v>"] = false,
        ["<C-t>"] = false,
        ["o"]  = actions.select_horizontal,
        ["O"]  = actions.select_vertical,
        ["gO"] = actions.select_tab,


        -- Note: This would be weird when we switch the ordering, currently.
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,

        ["<Up>"] = false,
        ["<Down>"] = false,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      },
    },
  },
}
