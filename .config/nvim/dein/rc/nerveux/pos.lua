-- TOML: memo.toml
-- Repo: pyrho/nerveux.nvim

require"nerveux".setup {
    neuron_cmd = "neuron",
    neuron_dir = vim.env.MY_MEMO .. "/neuron", -- no trailing slash (default: current directory)

    use_cache = true,
    start_daemon = true,
    kill_daemon_at_exit = true,

    virtual_titles = true,
    virtual_title_hl = "Special",
    virtual_title_hl_folge = "Repeat",

    create_default_mappings = true, -- Define the mappings below on `BufRead`.
    mappings = {
       search_zettels = "z<C-]>", -- Search your zettels, `<CR>` to edit; `<Tab>` to insert the zettel ID under the cursor

       backlinks_search = "z<C-b>", -- Search the backlinks to the current zettel
       uplinks_search = "z<C-f>", -- Search the only the uplinks to the current zettel

       new = "z<C-w>", -- Create a new zettel via neuron and :edit it.
       search_content = "gzs", -- Search for content inside all the zettels.

       insert_link = "gzl", -- Insert the last zettel ID.
       insert_link_folge = "gzL", -- Insert as a folgezettel.

       follow = "<CR>", -- Open the zettel ID that's under the cursor

       help = "z?", -- Show help (defined mappings)
    }
}
