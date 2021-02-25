-- TOML: appearance.toml
-- Repo: kevinhwang91/nvim-hlslens

local vim = vim

require('hlslens').setup({
  -- Enable hlslens on searching
  auto_enable = true,

  calm_down = true,

  override_line_lens = function(lnum, loc, idx, r_idx, count, namespace)
    -- r_idx: reverse index

    local sfw = vim.v.searchforward == 1
    local indicator, text, chunks
    local a_r_idx = math.abs(r_idx)

    local hl_group = 'HlSearchLens'
    local ind_above = '▲'
    local ind_below = '▼'

    if a_r_idx > 1 then
      indicator = string.format('%d%s', a_r_idx, sfw == (r_idx > 1) and ind_below or ind_above)
    elseif a_r_idx == 1 then
      indicator = sfw == (r_idx == 1) and ind_below or ind_above
    else
      indicator = ''
    end

    if loc ~= 'c' then
      text = string.format('[%s %d]', indicator, idx)
    elseif indicator ~= '' then
      -- For the other matches around.
      text = string.format('[%s %d/%d]', indicator, idx, count)
    else
      -- For the match the very beginning of which cursor attaches.
      text = string.format('[%d/%d]', idx, count)
      hl_group = 'HlSearchLensCur'
    end

    vim.api.nvim_buf_clear_namespace(0, namespace, lnum - 1, lnum)

    text = ' ' .. text
    chunks = {
      { text, hl_group },
    }
    vim.api.nvim_buf_set_virtual_text(0, namespace, lnum - 1, chunks, {})
  end;
})
