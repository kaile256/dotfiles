-- TOML: motion.toml
-- Repo: ggandor/lightspeed.nvim

local repeat_motion = function(is_opposite)
  return function()
    local ls = require"lightspeed"
    ls.ft["instant-repeat?"] = true
    local was_exclusive_motion = ls.ft["prev-t-like?"]
    ls.ft:to(is_opposite, was_exclusive_motion)
  end
end

U.noremap_motion("<Plug>(lightspeed-repeat-as-it-was)",   repeat_motion(false))
U.noremap_motion("<Plug>(lightspeed-repeat-in-opposite)", repeat_motion(true))
