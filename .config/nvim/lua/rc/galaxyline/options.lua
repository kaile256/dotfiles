local vim = vim

local cond = require 'galaxyline.condition'
local colors = require 'rc.galaxyline.colors'

local FoldMethod = {
  condition = cond.hide_in_width,
  provider = function()
    local fdm = vim.wo.foldmethod
    if fdm == 'expr' then
      return 'fde='.. vim.wo.foldexpr:gsub('%(.*%)$', '')
      -- return 'fdm=expr,'.. vim.wo.foldexpr:gsub('%(.*%)$', '')
    end
    return 'fdm='.. fdm
   end;

   condition = cond.hide_in_width,
   highlight = 'GalaxyDefault',
}

local Options = {
  FoldMethod={FoldMethod=FoldMethod},
}

return Options