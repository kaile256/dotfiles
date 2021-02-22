" From: motion.toml
" Repo: easymotion/vim-easymotion
" Another: add/easymotion.vim
" Another: source/easymotion.vim

hi! EasyMotionTarget        ctermfg=Magenta guifg=Magenta cterm=bold gui=bold
hi! EasyMotionTarget2First  ctermfg=Green   guifg=Green3
hi! EasyMotionTarget2Second ctermfg=Red     guifg=Red

hi! link EasyMotionMoveHL    EasyMotionTarget
hi! link EasyMotionShade     Comment
hi! link EasyMotionIncSearch Search

" Enable '<' in easymotion
EMCommandLineNoreMap <S-lt> <
EMCommandLineNoreMap <NL> <CR>
EMCommandLineNoreMap <c-k> <CR>

EMCommandLineNoreMap <c-p> <Over>(buffer-complete)
EMCommandLineNoreMap <Tab> <Over>(buffer-complete)
EMCommandLineNoreMap <c-f> <Over>(em-scroll-f)
EMCommandLineNoreMap <c-b> <Over>(em-scroll-b)
EMCommandLineNoreMap <c-d> <Over>(em-scroll-f)
EMCommandLineNoreMap <c-u> <Over>(em-scroll-b)
" jumpback to original cursor position.
"EMCommandLineNoreMap <c-o> <Over>(em-jumpback)
"EMCommandLineNoreMap <c-z> <Over>(em-openallfold)

EMCommandLineNoreMap <a-k> <esc>
EMCommandLineNoreMap <a-j> <esc>
EMCommandLineNoreMap <c-k> <esc>
EMCommandLineNoreMap <c-j> <esc>

" TODO: work the hotkeys to change the direction.
"EMCommandLineNoreMap <c-h> <esc><Plug>(easymotion-T2)
"EMCommandLineNoreMap <c-l> <esc><Plug>(easymotion-t2)
