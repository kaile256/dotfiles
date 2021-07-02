-- TOML: motion.toml
-- Repo: ggandor/lightspeed.nvim

-- Note: `ft` means the f/t motions.
require"lightspeed".setup {
  jump_to_first_match = true,
  jump_on_partial_input_safety_timeout = 400,

  grey_out_search_area = true,
  highlight_unique_chars = true,

  limit_ft_matches = 10,
  match_only_the_start_of_same_char_seqs = true, -- It's useful on such characters as "small", "look", "speed".

  -- By default, the values of these will be decided at runtime, based on `jump_to_first_match`
  labels = nil,
  cycle_group_fwd_key = nil,
  cycle_group_bwd_key = nil,

  full_inclusive_prefix_key = '<C-x>', -- It's used on 2 or more character search like the `e` flag for vim.fn.search.
}

vim.cmd([[
hi! LightspeedOneCharMatch ctermfg=Magenta guifg=Magenta ctermbg=NONE guibg=NONE cterm=bold gui=bold

silent! unmap s
silent! unmap S
]])
