" From: web.toml
" Repo: yaasita/edit-slack.vim
" Another: source/edit-slack.vim

let g:loaded_edit_slack = 1

command! -bar -count -nargs=? Slack
      \ :call edit_slack#open#buffer(<q-mods>, <count>, <q-args>)

command! -bar -count -nargs=? SlackSidebar
      \ :call edit_slack#open#sidebar(<q-mods>, <count>, <q-args>)

augroup SlackEdit
  autocmd!
  autocmd BufReadCmd  slack://* call edit_slack#OpenCh(expand("<amatch>"))
  autocmd BufWriteCmd slack://* call edit_slack#WriteCh(expand("<amatch>"))
augroup END

augroup SlackKeymaps
  au!
  au FileType slack call edit_slack#keymap#noremap()
  if !get(g:, 'edit_slack_no_default_mappings')
    au FileType slack call edit_slack#keymap#map()
  endif
augroup END

"command! -bar -range=1 -nargs=? SlackCh
"      \ :call edit_slack#open#buffer(<q-mods>, <q-count>, 'ch', <f-args>)
"
"command! -bar -range=1 -nargs=? SlackDM
"      \ :call edit_slack#open#buffer(<q-mods>, <q-count>, 'dm', <f-args>)
"
"command! -bar -range=1 -nargs=? SlackChPrivate
"      \ :call edit_slack#open#buffer(<q-mods>, <q-count>, 'pg', <f-args>)
"
"command! -bar -range=1 -nargs=? SlackSearchWord
"      \ :call edit_slack#open#buffer(<q-mods>, <q-count>, 'sw', <f-args>)
