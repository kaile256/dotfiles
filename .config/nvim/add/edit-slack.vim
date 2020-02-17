" From: web.toml
" Repo: yaasita/edit-slack.vim
" Another: source/edit-slack.vim

command! -bar -nargs=1 Slack :call edit_slack#OpenCh('slack://'. <q-args>)

command! -bar -nargs=? SlackCh
      \ :call edit_slack#OpenCh('slack://ch/'. <q-args>)
command! -bar -nargs=? SlackDM
      \ :call edit_slack#OpenCh('slack://dm/'. <q-args>)
command! -bar -nargs=? SlackPrivateGroup
      \ :call edit_slack#OpenCh('slack://pg/'. <q-args>)
command! -bar -nargs=? SlackSearchWord
      \ :call edit_slack#OpenCh('slack://sw/'. <q-args>)
