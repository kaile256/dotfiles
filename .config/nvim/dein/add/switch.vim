" TOML: operator.toml
" Repo: AndrewRadev/switch.vim
" Another: source/switch.vim

nnoremap <silent> <SID>(switch-next)
      \ :<c-u>call <SID>get_word_head('Switch')<cr>
nnoremap <silent> <SID>(switch-prev)
      \ :<c-u>call <SID>get_word_head('SwitchReverse')<cr>
nnoremap <script> <c-+> <SID>(switch-next)
nnoremap <script> <c--> <SID>(switch-prev)

inoremap <script> <c-+> <Esc><SID>(switch-next)a
inoremap <script> <c--> <Esc><SID>(switch-prev)a

function! s:get_word_head(cmd) abort "{{{1
  let word_boundary = '\S\+'
  " switched word can be different length so that keep on top before switched
  call search(word_boundary, 'bc')
  exe a:cmd
  call search(word_boundary, 'ec')
endfunction

