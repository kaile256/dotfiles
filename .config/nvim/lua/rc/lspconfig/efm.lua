-- Ref: lspconfig/efm.lua

local program = {
  markdownlint = {
    -- markdown
    lintCommand = { vim.env.HOME .. '/.yarn/bin/markdownlint', "--stdin" },
    lintStdin = true,
  },
  stylua = {
    -- lua
    formatCommand = { "stylua" },
  },
  shellcheck = {
    -- sh/zsh
    lintCommand = { "shellcheck", "-f", "gcc", "x" },
  }
}


local config = {
  filetypes = {
    "lua",
    "markdown",
    "sh",
  },
  --  cmd = { "efm-langserver", "-logfile", "/tmp/efm.log", "-loglevel", "2" },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      markdown = program.markdownlint,
      lua = program.stylua,
    },
  }
}

return config
