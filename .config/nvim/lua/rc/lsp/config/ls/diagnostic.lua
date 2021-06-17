-- Ref: lspconfig/diagnosticls.lua

local linters = {
  -- TODO: Activate markdownlint
  markdownlint = {
    sourceName = "markdownlint",
    command = vim.env.HOME .. '/.yarn/bin/markdownlint',
    args = { "--stdin" },
    rootPatterns = { ".git" },
    debounce = 100,
  },
  -- TODO: Activate shellcheck
  shellcheck = {
    sourceName = "shellcheck",
    command = vim.env.HOME .. '/.yarn/bin/shellcheck',
    --  args = { "--format=gcc", "-" },
    --  requiredFiles = { ".shellcheck", "shellcheckrc" } -- Only run if these files exist.
  }
}


local formatters = {

}

local config = {
  filetypes = {
    "lua",
    "markdown",
    "sh",
  },

  init_options = {
    linters = linters,
    filetypes = {
      sh = { "shellcheck" },
      markdown = { "markdownlint" },
    },

    formatters = formatters,
    formatFiletypes = {
      --  lua = "lua"
    },
  }
}

return config
