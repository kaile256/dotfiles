-- TOML: default.toml
-- Repo: notomo/cmdbuf.nvim

local height = 15

local cmdbuf_in_normal = function(opts)
  local cmdbuf_types = {
    [":"] = "vim/cmd",
    ["/"] = "vim/search/forward",
    ["?"] = "vim/search/backward",
  }
  return function()
    local cmdbuf = require"cmdbuf"
    local cmdtype = vim.fn.getcmdtype()
    opts.type = cmdbuf_types[cmdtype] or "vim/cmd"
    cmdbuf.split_open(height, opts)
    U.feedkeys("<Esc>", "ni")
    vim.cmd([[
      startinsert
    ]])
  end
end

local replace_cmdline = function(opts)
  return function()
    local cmdbuf = require"cmdbuf"
    cmdbuf.split_open(height, opts)
    vim.cmd([[
      normal! G
      startinsert
    ]])
  end
end

local keep_position = function()
  local opts = {
    line = vim.fn.getcmdline(),
    column = vim.fn.getcmdpos(),
  }
  return unpack(opts)
end

U.cnoremap("<C-]>", cmdbuf_in_normal({ keep_position() }))

-- TODO: Integrate with trace.vim.
U.nnoremap("g:", replace_cmdline({ type = "lua/cmd" }))
---U.nnoremap(":", replace_cmdline({ type = "vim/cmd" }))
---U.nnoremap("/", replace_cmdline({ type = "vim/search/forward" }))
---U.nnoremap("?", replace_cmdline({ type = "vim/search/backward" }))
