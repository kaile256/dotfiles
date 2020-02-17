" From: web.toml
" Repo: yaasita/edit-slack.vim
" Another: source/edit-slack.vim

command! -bar -nargs=? SlackCh
      \ :call s:open_slack(<q-mods>, 'ch', <f-args>)

command! -bar -nargs=? SlackDM
      \ :call s:open_slack(<q-mods>, 'dm', <f-args>)

command! -bar -nargs=? SlackPrivateGroup
      \ :call s:open_slack(<q-mods>, 'pg', <f-args>)

command! -bar -nargs=? SlackSearchWord
      \ :call s:open_slack(<q-mods>, 'sw', <f-args>)

function! s:open_slack(mods, ...) abort
  if a:0 == 0 | throw 'requires path as arguments addition to <q-mods>' | endif
  let open = a:mods ==# '' ? 'e slack://' : a:mods .' sp slack://'
  exe open . join(a:000, '/')
endfunction

function! s:complete_workspaces(ArgLead, CmdLine, CursorPos) abort
  return keys(g:yaasita_slack_token)
endfunction

