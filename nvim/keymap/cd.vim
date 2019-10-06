" From: init.vim

function! s:cd_and_echo(path) abort
  exe 'cd '. a:path
  echo 'cd '. getcwd()
endfunction

" N/P Directory
nnoremap <expr><silent> <space>wi <SID>cd_to_echo('-')
nnoremap <expr><silent> <space>wo <SID>cd_to_echo('..')

nnoremap <expr><silent> <space>w. <SID>cd_to_echo('.')
nnoremap <expr><silent> <space>wr <SID>cd_to_echo('/')
nnoremap <expr><silent> <space>wh <SID>cd_to_echo('~')

" Working Directory
nnoremap <expr><silent> <space>ww <SID>cd_and_echo('%:p:h')
nnoremap <expr><silent> <space>wc <SID>cd_to_echo('~/.cache')
nnoremap <expr><silent> <space>wf <SID>cd_to_echo('~/.config')
nnoremap <expr><silent> <space>wd <SID>cd_to_echo('~/dotfiles')

" Dev Root
nnoremap <expr><silent> <space>wp <SID>cd_and_echo(expand(g:dev_root))

function! s:cd_and_terminal(path, split) abort
  try
    " TODO: make it work
    exe 'cd '. a:path
    exe a:split
    terminal
  catch
    exe a:split
    terminal
  endtry
endfunction

" Open Terminal {{{1
noremap <silent> <space>t. :<c-u>te fish<cr>
noremap <silent> <space>te :<c-u>cd %:p:h <space>    <bar>te fish<cr>
noremap <silent> <space>to :<c-u>cd %:p:h <bar>:sp   <bar>te fish<cr>
noremap <silent> <space>tv :<c-u>cd %:p:h <bar>:vs   <bar>te fish<cr>
noremap <silent> <space>tt :<c-u>cd %:p:h <bar>:tabe <bar>te fish<cr>

" Open Terminal with `cd` {{{1
noremap <silent> <space>tw :<c-u>cd %:p:h      <bar>:te fish<cr>
noremap <silent> <space>th :<c-u>cd ~          <bar>:te fish<cr>
noremap <silent> <space>td :<c-u>cd ~/dotfiles <bar>:te fish<cr>
noremap <silent> <space>tc :<c-u>cd ~/.config  <bar>:te fish<cr>
