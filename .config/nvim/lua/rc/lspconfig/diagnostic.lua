-- Ref: lspconfig/diagnosticls.lua

local linters = {
  markdownlint = {
    sourceName = "markdownlint",
    command = vim.env.HOME .. '/.yarn/bin/markdownlint',
    args = { "--stdin" },
    rootPatterns = { ".git" },
    debounce = 100,
  },
}


local formatters = {

}

local config = {
  filetypes = {
    "lua", -- For async formatter
    "markdown", -- markdownlint
  },

  init_options = {
    linters = linters,
    filetypes = {
      -- TODO: Activate markdownlint
      markdown = { "markdownlint" },
    },

    formatters = formatters,
    formatFiletypes = {
      --  lua = "lua"
    },
  }
}

return config
