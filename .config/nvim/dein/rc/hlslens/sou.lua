-- TOML: appearance.toml
-- Repo: kevinhwang91/nvim-hlslens

require('hlslens').setup({
    -- Enable hlslens on searching
    auto_enable = true,

    calm_down = true,

    override_line_lens = function(lnum, loc, idx, r_idx, count, hls_ns)
      -- r_idx: reverse index

      local sfw = vim.v.searchforward == 1
      local indicator, text, chunks
      local a_r_idx = math.abs(r_idx)

      local ind_above = '▲'
      local ind_below = '▼'

      if a_r_idx > 1 then
        indicator = string.format('%d%s', a_r_idx, sfw ~= (r_idx > 1)
          and ind_above
          or ind_below)
      elseif a_r_idx == 1 then
        indicator = sfw ~= (r_idx == 1) and ind_above or ind_below
      else
        indicator = ''
      end

      if loc ~= 'c' then
        text = string.format('[%s %d]', indicator, idx)
        chunks = {{' ', 'Ignore'}, {text, 'HlSearchLens'}}
      else
        if indicator ~= '' then
          text = string.format('[%s %d/%d]', indicator, idx, count)
        else
          text = string.format('[%d/%d]', idx, count)
        end
        chunks = {{' ', 'Ignore'}, {text, 'HlSearchLensCur'}}
      end
      vim.api.nvim_buf_clear_namespace(0, -1, lnum - 1, lnum)
      vim.api.nvim_buf_set_extmark(0, hls_ns, lnum - 1, 0, {virt_text = chunks})
    end
  })
