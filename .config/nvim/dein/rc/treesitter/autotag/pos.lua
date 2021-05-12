-- TOML: insert.toml
-- Repo: windwp/nvim-ts-autotag

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,

    filetypes = {
      'eco',
      'ejs',
      'eruby',
      'html',
      'htmldjango',
      'javascript',
      'javascript.jsx',
      'javascriptreact',
      'jsx',
      'php',
      'svelte',
      'typescript',
      'typescript.tsx',
      'typescriptreact',
      'vue',
      'xml',
    }
  }
}

