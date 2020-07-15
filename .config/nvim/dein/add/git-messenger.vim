" From: tool.toml
" Repo: rhysd/git-messenger.vim

" mili-second; for CursorHold

"let g:git_messenger_include_diff = 'current'
let g:git_messenger_always_into_popup = v:false
"let g:git_messenger_no_default_mappings = v:true

" Normal color in popup window
hi link gitmessengerPopupNormal CursorLine
" Header such as 'Commit:', 'Author:'
hi link gitmessengerHeader Statement
" Commit hash at 'Commit:' header
hi link gitmessengerHash Special
" History number at 'History:' header
hi link gitmessengerHistory Title

"hi gitmessengerPopupNormal term=None guifg=#eeeeee guibg=#333333 ctermfg=255 ctermbg=234
"hi gitmessengerHeader term=None guifg=#88b8f6 ctermfg=111
"hi gitmessengerHash term=None guifg=#f0eaaa ctermfg=229
"hi gitmessengerHistory term=None guifg=#fd8489 ctermfg=210

"let g:git_messenger_no_default_mappings = v:true
"let g:git_messenger_always_into_popup = v:true
"let g:git_messenger_max_popup_height =
"let g:git_messenger_max_popup_width =

nnoremap <silent> <space>gm :<c-u>call <SID>simple_gitmessenger()<cr>
xnoremap <silent> <space>gm :<c-u>call <SID>simple_gitmessenger()<cr>

function! s:keymap_on_gitmessenger_popup() abort
  " For example, set go back/forward history to <C-o>/<C-i>
  nmap <buffer><C-o> o
  nmap <buffer><C-i> O

  "nmap <buffer><silent> <c-e> <Plug>(git-messenger-scroll-down-1)
  "nmap <buffer><silent> <c-y> <Plug>(git-messenger-scroll-up-1)

  "nmap <buffer><silent> <c-f> <Plug>(git-messenger-scroll-down-page)
  "nmap <buffer><silent> <c-b> <Plug>(git-messenger-scroll-up-page)

  "nmap <buffer><silent> <c-d> <Plug>(git-messenger-scroll-down-half)
  "nmap <buffer><silent> <c-u> <Plug>(git-messenger-scroll-up-half)
endfunction

function! s:simple_gitmessenger()
    "if g:git_messenger_include_diff !=# ''
    "  let g:git_messenger_include_diff = 'none'
    "endif
    if g:git_messenger_always_into_popup != v:false
      let g:git_messenger_always_into_popup = v:false
    endif

    "let s:blame = {}
    "let b = deepcopy(s:blame)
    "if b.git_root !=# ''
    set updatetime=5000
    GitMessenger
endfunction

function! s:gitmessenger_with_hunks()
  if !pumvisible()
    if g:git_messenger_include_diff !=# 'current'
      let g:git_messenger_include_diff = 'current'
    endif
    if g:git_messenger_always_into_popup !=# v:true
      let g:git_messenger_always_into_popup = v:true
    endif
    GitMessenger
  endif
endfunction

augroup myGitMessengerAdd
  au FileType gitmessengerpopup call s:keymap_on_gitmessenger_popup()
  "au CursorHold * call s:simple_gitmessenger()
augroup END
