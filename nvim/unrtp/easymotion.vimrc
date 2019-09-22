" From: motion.toml
" Repo: easymotion/vim-easymotion
" Alter: rc/easymotion.vimrc

" Enable '<' in easymotion
EMCommandLineNoreMap <S-lt> <
EMCommandLineNoreMap <NL> <CR>
EMCommandLineNoreMap <c-k> <CR>

EMCommandLineNoreMap <c-p> <Over>(buffer-complete)
EMCommandLineNoreMap <Tab> <Over>(buffer-complete)
EMCommandLineNoreMap <c-f> <Over>(em-scroll-f)
EMCommandLineNoreMap <c-b> <Over>(em-scroll-b)
EMCommandLineNoreMap <c-u> <Over>(em-scroll-f)
EMCommandLineNoreMap <c-d> <Over>(em-scroll-b)
" jumpback to original cursor position.
"EMCommandLineNoreMap <c-o> <Over>(em-jumpback)
"EMCommandLineNoreMap <c-z> <Over>(em-openallfold)

EMCommandLineNoreMap <a-k> <esc>
EMCommandLineNoreMap <a-j> <esc>

" TODO: work the hotkeys to change the direction.
"EMCommandLineNoreMap <a-h> <esc><Plug>(easymotion-T2)
"EMCommandLineNoreMap <a-l> <esc><Plug>(easymotion-t2)
