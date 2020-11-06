" TOML: motion.toml
" Repo: yuttie/comfortable-motion.vim
" Another: source/comfortable-motion.vim

" nnoremap <silent> <C-d> :<C-u>call comfortable_motion#flick( 100  * v:count1 )<CR>
" nnoremap <silent> <C-f> :<C-u>call comfortable_motion#flick( 200  * v:count1 )<CR>
" nnoremap <silent> <C-u> :<C-u>call comfortable_motion#flick( -100 * v:count1 )<CR>
" nnoremap <silent> <C-b> :<C-u>call comfortable_motion#flick( -200 * v:count1 )<CR>

" Relative to winheight mappings
nnoremap <silent> <C-d> :call comfortable_motion#flick( 2  * winheight(0) * v:count1 )<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick( 4  * winheight(0) * v:count1 )<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick( -2 * winheight(0) * v:count1 )<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick( -4 * winheight(0) * v:count1 )<CR>

