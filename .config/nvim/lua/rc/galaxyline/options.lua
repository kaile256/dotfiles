local vim = vim

local cond = require 'galaxyline.condition'

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
   highlight = 'GalaxyDefault',
}

local Options = {
  FoldMethod={FoldMethod=FoldMethod},
}

return Options
