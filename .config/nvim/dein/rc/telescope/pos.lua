-- TOML: telescope.toml
-- Repo: nvim-telescope/telescope.nvim

local actions = require('telescope.actions')

require('telescope').setup{
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

    prompt_position = "top",
    prompt_prefix = ">",
    selection_strategy = "reset", -- reset, row, follow
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_defaults = {
      -- TODO add builtin options.
    },

    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,

    winblend = 20,
    width = 0.85,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
    file_previewer = require'telescope.previewers'.cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,


    mappings = {
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
        ["<A-s>"] = actions.goto_file_selection_split,
        ["<A-v>"] = actions.goto_file_selection_vsplit,
        ["<A-t>"] = actions.goto_file_selection_tabedit,

        -- ["<Tab>"] = actions.add_selection, -- Not implemented yet.
        -- Disable scrolling in Insert Mode.

        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },

      n = {
        ["<Esc>"] = actions.close,

        ["<CR>"] = actions.goto_file_selection_edit + actions.center,

        ["<C-x>"] = false,
        ["<C-v>"] = false,
        ["<C-t>"] = false,
        ["o"]  = actions.goto_file_selection_split,
        ["O"]  = actions.goto_file_selection_vsplit,
        ["gO"] = actions.goto_file_selection_tabedit,


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

