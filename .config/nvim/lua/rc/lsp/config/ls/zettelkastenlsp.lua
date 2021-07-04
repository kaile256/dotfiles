-- Installation: https://github.com/danymat/lsp-zettelkasten#Installation

local lspconfig = require"lspconfig"

local config = {
  default_config = {
    -- FIXME: it won't run.
    cmd = { "node",  "/tmp/lsp-zettelkasten/server/out/server.js", "--stdio" };
    filetypes = { "markdown" };
    root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname) or vim.loop.cwd()
    end;
    settings = {};
  };
}

return config
