-- TOML: memo.toml
-- Repo: kristijanhusak/orgmode.nvim

require"orgmode".setup {
  org_agenda_files = { vim.env.MY_MEMO .. "/org/*" },
  org_default_notes_file = vim.env.MY_MEMO .. "/org/index.org",
  --
  -- mappings = {
  --   global = {
  --     org_agenda = "<space>oa",
  --     org_capture = "<space>oc",
  --   }
  -- };
}
