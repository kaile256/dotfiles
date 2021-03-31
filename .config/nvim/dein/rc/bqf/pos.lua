-- TOML: default.toml
-- Repo: kevinhwang91/nvim-bqf

require('bqf').setup {
  filter = {
    fzf = {
      action_for = {
        -- ['ctrl-t'] = 'tabedit',
        -- ['ctrl-v'] = 'vsplit',
        -- ['ctrl-x'] = 'split',
        ['ctrl-i'] = 'signtoggle',
      },
    },

    func_map = {
      -- Table: https://github.com/kevinhwang91/nvim-bqf#function-table

      prevfile = '<C-o>',
      nextfile = '<C-i>',

      prevhist = '<C-p>',
      nexthist = '<C-n>',

      sclear = '<C-c>', -- Sign clear

      fzffilter = 'zf',
    },
  },
}
