" TOML: insert.toml
" Repo: mattn/vim-sonictemplate
" Another: source/sonictemplate.vim
" Else: data/sonictemplate

augroup mySonicTemplate-autoStart
  au BufNewFile,BufRead *tmp* call s:expand_template('')

  au BufNewFile,BufRead .themisrc call s:expand_template('themis')
  au BufNewFile,BufRead *.vimspec call s:expand_template('vimspec')

  au BufNewFile,BufRead *.sh call s:expand_template('shebang')
  au BufNewFile,BufRead *.py call s:expand_template('shebang')

  au BufNewFile,BufRead *{D,d}ockerfile call s:expand_template('alpine')

  au BufNewFile,BufRead */doc/*.txt call s:expand_template('help')
  au BufNewFile,BufRead */atcoder**/* call s:expand_template('atcoder')

  au BufNewFile,BufRead LICENSE call s:expand_template('LICENSE-mit')
augroup END

function! s:expand_template(label) abort
  if line('$') != 1 || getline(1) !=# ''
    return
  endif

  let prefix = 'SonicTemplate:'
  if @% =~# 'tmp' && len(@+) > 800
    put! =@+
    echo prefix 'generated from clipboard!'
    return
  endif

  if len(a:label) == 0 | return | endif

  exe 'Template' a:label
  echo prefix 'generated "'. a:label .'"'
endfunction

nnoremap <silent> <A-s>t :<C-u>call <SID>sonictemplate_edit()<CR>
nmap <A-s><A-t> <A-s>t
function! s:sonictemplate_edit() abort
  let dir = $VIM_ANOTHER_HOME .'/sonictemplate/'. &ft
  let targets = readdir(dir)

  let file = ''
  if len(targets) == 0
    let file = 'base-init.'. &ft
  elseif len(targets) == 1
    let file = targets[0]
  endif
  let path = dir .'/'. file

  exe 'SensibleSplit' path
endfunction

finish

" intelligent asks which template to use in command line
" the difference than <Plug>(sonictemplate) is the completion
" Note: Vim regards <C-S-_> as <C-_>
imap <C-S-_> <Plug>(sonictemplate-intelligent)
nmap <C-S-_> <Plug>(sonictemplate-intelligent)

imap <c-=> <Plug>(sonictemplate-postfix)
nmap <c-=> <Plug>(sonictemplate-postfix)
