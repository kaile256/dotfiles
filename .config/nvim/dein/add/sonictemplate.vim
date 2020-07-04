" TOML: insert.toml
" Repo: mattn/vim-sonictemplate
" Another: source/sonictemplate.vim
" Else: data/sonictemplate

augroup mySonicTemplate-autoStart
  if exists('#mySonicTemplate-autoStart') | au! mySonicTemplate-autoStart
  endif

  au BufWinEnter *tmp* :call s:expand_template('')

  au BufWinEnter */atcoder**/*.cpp :call s:expand_template('atcoder')
  au BufWinEnter LICENSE :call s:expand_template('LICENSE-mit')
augroup END

function! s:expand_template(label) abort
  if line('$') != 1 || getline(1) !=# ''
    return
  endif

  let prefix = 'SonicTemplate:'
  if @% =~# 'tmp' && len(@+) > 800
    put! =@+
    echo prefix 'Expanded from clipboard!'
    return
  endif

  if len(a:label) == 0 | return | endif

  exe 'Template' a:label
  echo prefix 'Expanded "'. a:label .'"'
endfunction

finish

" intelligent asks which template to use in command line
" the difference than <Plug>(sonictemplate) is the completion
" Note: Vim regards <C-S-_> as <C-_>
imap <C-S-_> <Plug>(sonictemplate-intelligent)
nmap <C-S-_> <Plug>(sonictemplate-intelligent)

imap <c-=> <Plug>(sonictemplate-postfix)
nmap <c-=> <Plug>(sonictemplate-postfix)
