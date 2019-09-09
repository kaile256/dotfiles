" From: motion.toml
" Repo: easymotion/easymotion

" Let; mapping {{{
" `g:EasyMotion_do_mapping = 1` provides all the default keymaps.
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" Set apart vim's default n-key history.
let g:EasyMotion_add_search_history = 0
"}}}
" Let; Chars "{{{
let g:EasyMotion_smartcase = 0
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
"}}}
" Let; Prompt "{{{
" verbose: such as "EasyMotion: Jumping to [l,c]" and "EasyMotion: Cancelled".
let g:EasyMotion_verbose = 0
let g:EasyMotion_prompt = 'EasyMotion: {n} Chars >>> '
"}}}
" Let; Migemo {{{
" TODO: Associate with eskk.vim?
" `g:EasyMotion_use_migemo` is independentt to 'cmigemo'.
" because Easymotion includes basic regex patterns.
let g:EasyMotion_use_migemo = 0 "{{{
function! s:ezmotion_migemo_toggle()
  if exists('g:EasyMotion_use_migemo')
    let g:EasyMotion_use_migemo = 0
  else
    let g:EasyMotion_use_migemo = 1
  endif
endfunction "}}}
command! MigemoToggle :call <SID>ezmotion_migemo_toggle()
"}}}
" Highlight {{{
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionTarget2First ErrorMsg
hi link EasyMotionTarget2Second ErrorMsg
hi link EasyMotionShade Nontext
hi link EasyMotionMoveHL ErrorMsg
hi link EasyMotionIncSearch Search
"}}}

" Excerpt of Help; about keymap
" 0: keep cursor colum JK motion
" <Plug>(easymotion-web/WEB): replace word/WORD with Keys.
" <Plug>(easymotion-s): the range is inside current screen.
" <Plug>(easymotion-sl): the range is limited to current line.

nmap . <Plug>(easymotion-dotrepeat)

" Keymap; Catch Over window
nmap <nowait> co         <Plug>(easymotion-overwin-f2)
imap <nowait> <a-c><a-o> <esc><Plug>(easymotion-overwin-f2)
imap <nowait> <a-c>o     <esc><Plug>(easymotion-overwin-f2)
" TODO: yank over window.
"nmap <nowait> yo <Plug>(easymotion-overwin-f2)

" Keymap; ft;,
function! s:adjust_maps_easymotion() abort "{{{
  if exists('g:loaded_sneak_plugin')
    map <nowait> <space>f   <Plug>(easymotion-f2)
    map <nowait> <space>t   <Plug>(easymotion-t2)
    map <nowait> <space>F   <Plug>(easymotion-F2)
    map <nowait> <space>T   <Plug>(easymotion-T2)
    map <nowait> <s-space>F <Plug>(easymotion-F2)
    map <nowait> <s-space>T <Plug>(easymotion-T2)
  else
    map <nowait> f <Plug>(easymotion-f2)
    map <nowait> t <Plug>(easymotion-t2)
    map <nowait> F <Plug>(easymotion-F2)
    map <nowait> T <Plug>(easymotion-T2)
  endif
endfunction "}}}
augroup MyEasymotionConf
  au!
  au VimEnter * call <SID>adjust_maps_easymotion()
augroup END

" Keymap; hjkl
"noremap <silent> <c-j> 10j
"noremap <silent> <c-k> 10k
noremap <c-h> gT
noremap <c-l> gt
map <nowait> <c-j> <Plug>(easymotion-next)
map <nowait> <c-k> <Plug>(easymotion-prev)

" Keymap; Evacuat for default tf;, "{{{
" Mnemonic: 'Quicker', or shorter typing than those of EasyMotion
"           as EasyMotion expects another typing to select.
noremap qt t
noremap qT T
noremap qf f
noremap qF F
"noremap q; ;
"noremap q, ,
"}}}
