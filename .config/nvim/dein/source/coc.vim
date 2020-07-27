" From: lsp.toml
" Repo: neoclide/coc.nvim
" Branch: neoclide/coc.nvim_release
" XDG: $XDG_CONFIG_HOME/coc/extensions/node_modules/
" Json: coc-settings.json
" Another: add/coc.vim

nnoremap <space>cr :<C-u>silent CocRestart<CR>

function! s:CodeLensToggle() abort
  const on  = 'ctermfg=226 guifg=#ffff00'
  const off = 'ctermfg=240 guifg=#585858'

  let color = on
  if execute('hi CocCodeLens') =~# on
    let color = off
  endif
  exe 'hi! CocCodeLens' color
endfunction
command! -bar CodeLensToggle :call s:CodeLensToggle()
hi! CocCodeLens ctermfg=240 guifg=#585858

let g:coc_channel_timeout = 50

" the List of CocExtentions; "{{{1
" Note: have to install LSPs independently.
" Note: coc-highlight made CPU overwork
" Note: coc-clangd only provides completion support; use ccls instead.
" Note: coc-conventional provides completion support for gitcommit.
let g:coc_global_extensions = [
      \ 'coc-actions',
      \ 'coc-angular',
      \ 'coc-bookmark',
      \ 'coc-cmake',
      \ 'coc-conjure',
      \ 'coc-cspell-dicts',
      \ 'coc-css',
      \ 'coc-deno',
      \ 'coc-diagnostic',
      \ 'coc-dictionary',
      \ 'coc-docker',
      \ 'coc-docthis',
      \ 'coc-elixir',
      \ 'coc-emmet',
      \ 'coc-emoji',
      \ 'coc-eslint',
      \ 'coc-fish',
      \ 'coc-flow',
      \ 'coc-flutter',
      \ 'coc-git',
      \ 'coc-go',
      \ 'coc-godot',
      \ 'coc-homeassistant',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-java-debug',
      \ 'coc-json',
      \ 'coc-julia',
      \ 'coc-lists',
      \ 'coc-lua',
      \ 'coc-markdownlint',
      \ 'coc-neosnippet',
      \ 'coc-omni',
      \ 'coc-phpls',
      \ 'coc-post',
      \ 'coc-prettier',
      \ 'coc-project',
      \ 'coc-pyright',
      \ 'coc-python',
      \ 'coc-rust-analyzer',
      \ 'coc-solargraph',
      \ 'coc-spell-checker',
      \ 'coc-sql',
      \ 'coc-tag',
      \ 'coc-texlab',
      \ 'coc-todolist',
      \ 'coc-translator',
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-vimlsp',
      \ 'coc-word',
      \ 'coc-xml',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ ]

" CocCheckProvider {{{1
command! CocHasProvider   :call s:has_provider()
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

augroup myCocSource "{{{1
  au FileType list nnoremap <buffer> <CR> <TAB>
  " " CocNvimInit triggered after coc services have started.
  " au User CocNvimInit call CocAction('runCommand', 'tsserver.watchBuild')

  au CursorHoldI * call CocActionAsync('doHover')
  au CursorHoldI * call CocActionAsync('showSignatureHelp')
  au BufRead coc-settings.json setl commentstring=//%s
  " " No Status Line on coc's buffer; useless {{{2
  " au FileType coc,list setl laststatus=0
  "     \ | au BufWinEnter,WinLeave,BufLeave * ++once set laststatus=2
  " Snippets on Coc {{{2
  " au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Highlight symbol under cursor on CursorHold
  "au CursorHold * silent call CocActionAsync('highlight')

  " Vimspector on Coc {{{2
  " Ref: Override DebugStart of Vimspector @add/vimspector.vim
  "   https://github.com/dansomething/coc-java-debug
  " Note: the same named commands will be shown duplicated and confuse you;
  "   you had better name another distinguished.
  au FileType java command! -bar -buffer JavaDebugStart :call s:debug_start_java()
  function! s:debug_start_java() abort "{{{3
    let port = '5005'
    let port_check = 'lsof -i:'. port
    let java_class = expand('%:t:r')
    if system(port_check)
      " enable remote debugging
      call system('java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,suspend=y,address='. port .' '. java_class)
    endif

    augroup myCocSource_StopDebugJava
      au!
      au VimLeavePre *        call s:kill_java_remote_debugger()
      au BufWinLeave <buffer> call s:kill_java_remote_debugger()
      function! s:kill_java_remote_debugger() closure "{{{4
        let pid = matchstr(system(port_check), 'java\s*\zs\d\+')
        call system('kill '. pid)
        silent! augroup! myCocSource_StopDebugJava
      endfunction
    augroup END

    " Ref: add/vimspector.vim & .vimspector.json
    " configure in coc-settings.json
    CocCommand java.debug.vimspector.start
    " function! JavaDebugCallback(err, port) abort
    "   call vimspector#LaunchWithSettings({'configuration': 'coc-java-debug', 'AdapterPort': a:port})
    " endfunction
    " call CocActionAsync('runCommand', 'vscode.java.startDebugSession', function('JavaDebugCallback'))
  endfunction
  " Auto Import {{{2
  " Either editor's or java's fails to work on java
  " au BufWritePre *.java silent call CocActionAsync('runCommand', 'java.action.organizeImports')
  " Note: Keep it BufWrite (not BufWritePre); format could be different from
  " that by <Plug>(coc-format-selected)
  au BufWrite *.go,*.ts call CocActionAsync('runCommand', 'editor.action.organizeImport')
  "" CocPairs {{{2
  "  au FileType vim let b:coc_pairs_disabled = ['"']
augroup END

