" TOML: syntax.toml
" Repo: nvim-treesitter/nvim-treesitter

luafile $DEIN_SOURCE_HOME/treesitter.lua

augroup myTreesittter-setFoldExpr
  au FileType * call s:overwrite_foldexpr()
augroup END

function! s:set_filetypes_to_activate() abort "{{{1
  const filetypes_exclude = [
        \ 'toml',
        \ ]

  const filetypes_available = [
        \ 'c',
        \ 'cpp',
        \ 'css',
        \ 'dart',
        \ 'go',
        \ 'html',
        \ 'java',
        \ 'javascript',
        \ 'javascriptreact',
        \ 'json',
        \ 'julia',
        \ 'lua',
        \ 'markdown',
        \ 'nix',
        \ 'ocaml',
        \ 'php',
        \ 'python',
        \ 'rst',
        \ 'ruby',
        \ 'rust',
        \ 'scala',
        \ 'sh',
        \ 'swift',
        \ 'toml',
        \ 'typescript',
        \ 'typescriptreact',
        \ 'vue',
        \ 'yaml',
        \ ]

  const filetypes_to_activate = filter(deepcopy(filetypes_available),
        \ 'index(filetypes_exclude, v:val) == -1')

  return filetypes_to_activate
endfunction

let s:filetypes_to_activate = s:set_filetypes_to_activate()
delfunction s:set_filetypes_to_activate
"}}}1

function! s:overwrite_foldexpr() abort
  if index(s:filetypes_to_activate, &ft) >= 0
    setlocal fdm=expr fde=nvim_treesitter#foldexpr()
  endif
endfunction

