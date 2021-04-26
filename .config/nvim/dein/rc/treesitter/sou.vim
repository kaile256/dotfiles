" TOML: treesitter.toml
" Repo: nvim-treesitter/nvim-treesitter
" Another: treesitter.lua

luafile $DEIN_RC_DIR/treesitter/sou.lua

function! s:set_filetypes_to_activate() abort "{{{1
  const filetypes_exclude = [
        \ 'json',
        \ 'toml',
        \ 'yaml',
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
        \ 'jsonc',
        \ 'julia',
        \ 'lua',
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

augroup myTreesitterSou-WithTreesitterActivated,DisableLocalSyntaxDetection
  exe 'au FileType' join(s:filetypes_to_activate, ',') 'setlocal syntax='
augroup END


function! s:overwrite_foldexpr() abort
  if &fdm !~# 'manual\|syntax' | return | endif
  if index(s:filetypes_to_activate, &ft) == -1 | return | endif
  setlocal fdm=expr fde=nvim_treesitter#foldexpr()
endfunction

augroup myTreesittter-setFoldExpr
  au FileType * call s:overwrite_foldexpr()
augroup END
