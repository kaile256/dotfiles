" From: external.toml
" Repo: neoclide/coc.nvim
" Branch: neoclide/coc.nvim_release
" XDG: .config/coc/extensions
" Json: coc-settings.json
" Another: add/coc.vim

augroup myCocSource
  au!
  au FileType coc,list setl laststatus=0
        \ | au BufWinEnter,WinLeave,BufLeave * ++once set laststatus=2
  "" Only for snippet's feature?
  "au User     CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Highlight symbol under cursor on CursorHold
  "au CursorHold * silent call CocActionAsync('highlight')
augroup END

augroup myCocSourceAutoImport
  au!
  au BufWritePre *.go   silent call s:cocImport('editor.action.organizeImport')
  au BufWritePre *.java silent call s:cocImport('java.action.organizeImports')
augroup END
function! s:cocImport(coc_cmd) abort "{{{1
  if line('$') < 1000
    " Synchronized import is better with some commands like QuickRun
    call CocAction('runCommand', a:coc_cmd)
  endif
  call CocActionAsync('runCommand', a:coc_cmd)
endfunction

" the List of CocExtentions; "{{{1
" Note: have to install LSPs independently.
" Note: coc-highlight made CPU overwork
let g:coc_global_extensions = [
      \ 'coc-angular',
      \ 'coc-bookmark',
      \ 'coc-conjure',
      \ 'coc-css',
      \ 'coc-diagnostic',
      \ 'coc-dictionary',
      \ 'coc-docker',
      \ 'coc-elixir',
      \ 'coc-emoji',
      \ 'coc-fish',
      \ 'coc-flow',
      \ 'coc-flutter',
      \ 'coc-git',
      \ 'coc-go',
      \ 'coc-homeassistant',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-lua',
      \ 'coc-markdownlint',
      \ 'coc-neosnippet',
      \ 'coc-omni',
      \ 'coc-phpls',
      \ 'coc-post',
      \ 'coc-prettier',
      \ 'coc-project',
      \ 'coc-python',
      \ 'coc-rust-analyzer',
      \ 'coc-solargraph',
      \ 'coc-sql',
      \ 'coc-tag',
      \ 'coc-texlab',
      \ 'coc-todolist',
      \ 'coc-translator',
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-vimlsp',
      \ 'coc-word',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ ]

" CocPairs {{{1
"augroup myCocPairsDisable
"  au!
"  au FileType vim let b:coc_pairs_disabled = ['"']
"augroup END

" CocCheckProvider {{{1
command! CifHasProvider :call s:has_provider()
command! ChasProvider   :call s:has_provider()
command! Cprovider      :call s:has_provider()
function! s:has_provider()
  let coc_providers = [
        \ 'hover',
        \ 'rename',
        \ 'format',
        \ 'codeAction',
        \ 'onTypeEdit',
        \ 'reference',
        \ 'definition',
        \ 'declaration',
        \ 'typeDefinition',
        \ 'implementation',
        \ 'codeLens',
        \ 'documentColor',
        \ 'documentHighlight',
        \ 'documentLink',
        \ 'documentSymbol',
        \ 'workspaceSymbols',
        \ 'formatRange',
        \ 'foldingRange',
        \ 'selectionRange',
        \ ]

  let available   = []
  let cntT = 1
  let unavailable = []
  let cntF = 1
  for provider in coc_providers
    if CocHasProvider(provider) == v:true
      call add(available, cntT .'. '. provider)
      let cntT = cntT +1
    elseif CocHasProvider(provider) == v:false
      call add(unavailable, cntF .'. '. provider)
      let cntF = cntF +1
    endif
  endfor

  echohl Normal
  echon " The providers below are available on this buffer: \n\n"
  echohl Type
  echon " ======== True ==================================\n\t  "
  echohl Identifier
  echon join(available, "\n\t  ")
  echohl Normal
  echohl Type
  echon "\n\n"
  echon " ======== False =================================\n\t  "
  echohl WarningMsg
  echon join(unavailable, "\n\t  ")
  echon "\n"
endfunction

