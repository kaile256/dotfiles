" From: motion.toml
" Repo: junegunn/vim-easy-align

" Excerpt:
" * Filter
"   1.in interactive mode <c-f>: type g/pat/ or v/pat/
"   2.in command-line, after :EasyAlign,
"      put `{'filter': 'g/pat/'}`, or g/pat/ or v/pat/
"      (just type only '/'; no need to type '\/')

" Note: type <c-g> (as ignore-Group) at times required
"let g:easy_align_ignore_groups = ['String'] " default: ['Comment', 'String']

"nnoremap <silent> <Plug>(easy-align-keeping-cursor) :keepjumps<cr><Plug>(EasyAlign)

" Mnemonic: Queue Up!
nmap \q <Plug>(EasyAlign)
xmap \q <Plug>(EasyAlign)

" TODO: not limited to cursorline, but let it behave as an operatopr
nnoremap <silent> <Plug>(EasyAlign-on-space) :EasyAlign<cr>$*<space>
xnoremap <silent> <Plug>(EasyAlign-on-space) :EasyAlign<cr>$*<space>

" Space Adjustment; limited only to space adjustment.
" On Selected Area;
xmap \Q        <Plug>(EasyAlign-on-space)
xmap \q<space> <Plug>(EasyAlign-on-space)
" Line-wise;
nmap \Q        <Plug>(EasyAlign-on-space)
nmap \q<space> <Plug>(EasyAlign-on-space)
