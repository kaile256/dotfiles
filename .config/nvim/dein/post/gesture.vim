" TOML: motion.toml
" Repo: notomo/gesture.nvim
" Another: post/gesture.vim

" register gestures
call gesture#register().up().down().noremap('G')
call gesture#register().down().up().noremap('gg')
call gesture#register().left().noremap(":\<C-u>tabprev\<CR>")
call gesture#register().right().noremap(":\<C-u>tabnext\<CR>")
