" TOML: motion.toml
" Repo: haya14busa/vim-asterisk
" Another: add/asterisk.vim

if ! &ignorecase | finish | endif

augroup myAsteriskSo-IgnorecaseToggle
  if exists('#myAsteriskSo-IgnorecaseToggle') | au! myAsteriskSo-IgnorecaseToggle
  endif
  " This
  au CmdlineEnter [/?] set ignorecase   smartcase
  au CmdlineLeave [/?] set noignorecase nosmartcase
augroup END

