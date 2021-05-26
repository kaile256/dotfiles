-- TOML: treesitter.toml
-- Repo: nvim-treesitter/nvim-treesitter
-- From: source/treesitter.vim

-- Ref: Use rainbow bracket together with treesitter
--      https://github.com/luochen1990/rainbow/issues/151
require'nvim-treesitter.highlight'
local hlmap = vim.treesitter.highlighter.hl_map

hlmap.error = nil
hlmap["punctuation.bracket"] = nil
hlmap["punctuation.delimiter"] = "Delimiter"

require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "all", -- tree-sitter-lua too frequentry contains bugs.
  ensure_installed = "maintained",

  highlight = {
    enable = true,
    disable = {
      'toml',
      'yaml',
    },
    -- additional_vim_regex_highlighting = {
    --   'toml',
    -- }
  },

  indent = {
    enable = true,
  },

  -- Repo: p00f/nvim-ts-rainbow
  -- Edit the colors on p00f/nvim-ts-rainbow/lua/rainbow/colors.lua
  rainbow = {
    enable = true,
    disable = {
      'bash',
      'toml',
    },
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      -- init_selection = "<space>v",
      -- scope_incremental = "g<C-a>",
      node_decremental = "<C-x>",
      node_incremental = "<C-a>",
    },
  },
}

-- TODO: Activate it if neovim installs autocmd handler.
--  local filetypes_excluded = {
--    'json',
--    'toml',
--    'yaml',
--  }
--
--  local filetypes_available = {
--    'c',
--    'cpp',
--    'css',
--    'dart',
--    'go',
--    'html',
--    'java',
--    'javascript',
--    'javascriptreact',
--    'json',
--    'jsonc',
--    'julia',
--    'lua',
--    'nix',
--    'ocaml',
--    'php',
--    'python',
--    'rst',
--    'ruby',
--    'rust',
--    'scala',
--    'sh',
--    'swift',
--    'toml',
--    'typescript',
--    'typescriptreact',
--    'vue',
--    'yaml',
--  }
--
--  local filetypes_activated = {}
--  for _, ft in filetypes_available do
--    for _, ft_x in filetypes_excluded do
--      if ft ~= ft_x then
--        filetypes_activated[ft] = true
--      end
--    end
--  end
--
--  local overwrite_foldexpr = function()
--    local fdm = vim.wo.foldmethod
--    if fdm == 'manual' or fdm == 'syntax' then return end
--    if filetypes_activated[vim.bo.filetype] == nil then return end
--    vim.wo.foldmethod = 'expr'
--    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
--  end
--
--  vim.cmd([[
--  augroup myTreesitterSou-WithTreesitterActivated,DisableLocalSyntaxDetection
--  exe 'au FileType' join(]] .. filetypes_activated .. [[, ',') 'setlocal syntax='
--  augroup END
--
--  augroup myTreesittter-setFoldExpr
--  au FileType * call overwrite_foldexpr()
--  augroup END
--  ]])
