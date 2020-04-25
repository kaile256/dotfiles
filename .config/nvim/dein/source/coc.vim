" From: external.toml
" Repo: neoclide/coc.nvim
" Branch: neoclide/coc.nvim_release
" XDG: $XDG_CONFIG_HOME/coc/extensions/node_modules/
" Json: coc-settings.json
" Another: add/coc.vim

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
      \ 'coc-emmet',
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
      \ 'https://github.com/dansomething/coc-java-debug',
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
  if exists('#myCocSource') | au! myCocSource
  endif
  " " No Status Line on coc's buffer; useless {{{2
  " au FileType coc,list setl laststatus=0
  "     \ | au BufWinEnter,WinLeave,BufLeave * ++once set laststatus=2
  " Snippets on Coc {{{2
  au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
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
      if exists('#myCocSource_StopDebugJava') | au! myCocSource_StopDebugJava
      endif
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
  au BufWritePre *.go   silent call s:cocImport('editor.action.organizeImport')
  " Either editor's or java's fails to work on java
  " au BufWritePre *.java silent call s:cocImport('java.action.organizeImports')
  function! s:cocImport(coc_cmd) abort "{{{3
    if line('$') < 1000
      " Synchronized import is better with some commands like QuickRun
      call CocAction('runCommand', a:coc_cmd)
    endif
    call CocActionAsync('runCommand', a:coc_cmd)
  endfunction

  "" CocPairs {{{2
  "  au FileType vim let b:coc_pairs_disabled = ['"']
augroup END

