-- TOML: default.toml
-- Repo: notomo/cmdbuf.nvim

local set_options = function()
  vim.bo.bufhidden = "wipe"
  U.augroup("CmdbufCloseOnWinLeave", {
      { "WinLeave", "<buffer>", "bdelete" }
    }
  )
end

local execute_and_exit = function()
  local cmdbuf = require"cmdbuf"
  cmdbuf.execute()
  -- TODO: Make sure this is cmdbuf.
  vim.cmd("quit")
end

local set_mappings = function()
  local cmdbuf = require"cmdbuf"
  U.nnoremap({ "buffer" }, ":", ":" )
  U.nnoremap({ "buffer" }, "/", "/" )
  U.nnoremap({ "buffer" }, "?", "?" )

  U.nnoremap({ "buffer" }, "dd", cmdbuf.delete  )
  U.nnoremap({ "buffer" }, "cc", function()
    cmdbuf.delete()
    vim.cmd("normal! i")
  end )

  U.nnoremap({ "buffer" }, "Zz", execute_and_exit )
  U.nnoremap({ "buffer" }, "ZZ", execute_and_exit )

  U.nnoremap({ "buffer" }, "ZZ", execute_and_exit )
  U.nnoremap({ "buffer" }, "ZZ", execute_and_exit )
end

U.augroup({
  CmdbufSetupOnEntry = {
    { "User", "CmdbufNew", function()
      set_options()
      set_mappings()
    end }
  }
})
