-- Ref: lspconfig/efm.lua

local linter = {
  markdownlint = {
    lintCommand = { vim.env.HOME .. '/.yarn/bin/markdownlint', "--stdin" },
    lintStdin = true,
  },
}


local config = {
  init_options = {
    documentFormatting = true,
  },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      markdown = linter.markdownlint,
    }
  }
}

return config
