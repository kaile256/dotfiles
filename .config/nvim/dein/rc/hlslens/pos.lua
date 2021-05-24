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

  ---@param pos_list table[number]
  ---@param idx number: an index for pos_list.
  ---@param r_idx number: the relative index to current cursor position.
  override_lens = function(render, pos_list, _, idx, r_idx)
    local ind_above = '▲'
    local ind_below = '▼'

    local text, hl_group
    local matches = #pos_list
    if r_idx == 0 then
      -- For the match the very beginning of which cursor attaches.
      text = ('[%d/%d]'):format(idx, matches)
      hl_group = 'HlSearchNear'
    else
      local distance = math.abs(r_idx)
      local sfw = vim.v.searchforward == 1
      local ind_direction = sfw == (r_idx > 0) and ind_below or ind_above
      if distance == 1 then
        local indicator = ind_direction
        text = ('[%s %d]'):format(indicator, idx)
        hl_group = 'HlSearchLensNear'
      else
        local indicator = ('%d%s'):format(distance, ind_direction)
        text = ('[%s %d/%d]'):format(indicator, idx, matches)
        hl_group = 'HlSearchLens'
      end
    end

    local row, col = unpack(pos_list[idx])
    local chunks = {
      -- { ' ', 'Ignore' },
      { text, hl_group },
    }
    render.set_virt(0, row - 1, col - 1, chunks, {})
  end;
})
