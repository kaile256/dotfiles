-- TOML: appearance.toml
-- Repo: kevinhwang91/nvim-hlslens

vim.cmd [[
hi! link HlSearchNear     Search    " For the nearest matched text.
hi! link HlSearchLensNear Search    " For the nearest virtual text.
hi! link HlSearchLens     WildMenu  " For virtual texts but the nearest one.
hi! link HlSearchFloat    IncSearch " For the nearest text in the floating window.
]]

require('hlslens').setup({
  -- Enable hlslens on searching
  auto_enable = true,

  -- -- Finish searching as soon as cursor gets out of matched instance.
  -- calm_down = true,

  override_lens = function(render, plist, nearest, idx, r_idx)
    -- r_idx: reverse index

    local sfw = vim.v.searchforward == 1
    local indicator, text, chunks
    local abs_r_idx = math.abs(r_idx)

    local hl_group = 'HlSearchLens'
    local ind_above = '▲'
    local ind_below = '▼'

    if abs_r_idx > 1 then
      indicator = ('%d%s'):format(abs_r_idx, sfw == (r_idx > 1) and ind_below or ind_above)
    elseif abs_r_idx == 1 then
      indicator = sfw == (r_idx == 1) and ind_below or ind_above
    else
      indicator = ''
    end

    local row, col = unpack(plist[idx])
    local steps = #plist
    if not nearest then
      text = ('[%s %d]'):format(indicator, idx)
    elseif indicator == '' then
      -- For the match the very beginning of which cursor attaches.
      text = ('[%d/%d]'):format(idx, steps)
    else
      -- For the other matches around.
      text = ('[%s %d/%d]'):format(indicator, idx, steps)
      hl_group = 'HlSearchLensNear'
    end

    text = text
    chunks = {
      { ' ', 'Ignore' },
      { text, hl_group },
    }
    render.set_virt(0, row - 1, col - 1, chunks, {})
  end;
})
