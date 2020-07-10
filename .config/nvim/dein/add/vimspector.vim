" From: debug.toml
" Repo: puremourning/vimspector
" Another: source/vimspector.vim
" Another: post/vimspector.vim

" JSON: data/vimspector
" JSON: .vimspector.json

" Web: https://puremourning.github.io/vimspector-web/
" Depends: https://github.com/Microsoft/vscode-cpptools
" Ref: see https://qiita.com/deresmos/items/01a59df438e1b881ef11

nnoremap <F5> :<C-u>VimspectorContinue<CR>

nmap <F9>   <Plug>VimspectorToggleBreakpoint
nmap <S-F9> <Plug>VimspectorAddFunctionBreakpoint

nmap mb <Plug>VimspectorToggleBreakpoint
nmap mf <Plug>VimspectorAddFunctionBreakpoint

nmap <expr> mB vimspector#ClearBreakpoints()

" set values name in configuration at .vimspector.json as you like
command! -bar -bang VimspectorContinue :call s:debug_start()

function! s:debug_start() abort
  if bufwinnr('vimspector.Watches') != -1
    call vimspector#Continue()
    return
  endif

  call s:setup_symlink()

  if &ft ==# 'java'
    CocCommand java.debug.vimspector.start
  else
    call vimspector#Continue()
  endif

  windo call s:set_options()
  windo call s:mappings()
endfunction

function! s:setup_symlink() abort
  let ft = &ft
  if ft ==# ''
    for bufnr in tabpagebuflist()
      let ft = getbufvar(bufnr, '&filetype')
      if ft !=# '' | break | endif
    endfor
  endif

  let config_file = $VIM_ANOTHER_HOME .'/vimspector/'. ft .'.json'
  if !filereadable(config_file)
    echoerr 'Vimspector: You have no "'. config_file .'"'
    return
  endif

  let path = fnamemodify(@%, ':p')
  if path =~# '^/tmp/'
    let dest = '/tmp'
  elseif path =~# $HOME
    let dest = $HOME
  else
    echoerr 'Invalid Path:' path
  endif
  let dest .= '/.vimspector.json'

  if system('readlink '. dest) !=# config_file ."\n"
    echo 'Vimspector: Generating a symbolic link from' config_file .'...'
    let Setup_config = 'ln -sf '. config_file .' '. dest
    call system(Setup_config)
  endif
endfunction

function! s:mappings() abort
  nnoremap <buffer><expr> mw vimspector#AddWatch()
  nnoremap <buffer><expr> mW vimspector#DeleteWatch()

  nnoremap <buffer> mt :<C-u>call vimspector#ShowOutput('Telemetry')<CR>
  nnoremap <buffer> me :<C-u>call vimspector#ShowOutput('stderr')<CR>

  nnoremap <buffer> mv :<C-u>call vimspector#ShowOutput('Vimspector-out')<CR>
  nnoremap <buffer> mV :<C-u>call vimspector#ShowOutput('Vimspector-err')<CR>

  nnoremap <buffer> mt :<C-u>call vimspector#ShowOutput('server')<CR>
  nnoremap <buffer> mc :<C-u>call vimspector#ShowOutput('Console')<CR>

  if &bt ==# ''  | return | endif

  nmap <buffer> R :<C-u>VimspectorReset<CR>

  nmap <buffer> c <Plug>VimspectorContinue
  nmap <buffer> s <Plug>VimspectorStop
  nmap <buffer> S <Plug>VimspectorRestart
  nmap <buffer> p <Plug>VimspectorPause

  nmap <buffer> o <Plug>VimspectorStepInto
  nmap <buffer> O <Plug>VimspectorStepOver
  nmap <buffer> a <Plug>VimspectorStepOut

  nnoremap <buffer><expr> zo vimspector#ExpandVariable()
endfunction

function! s:set_options() abort
  setlocal nofoldenable

  if @% ==# 'vimspector.Console'
    setlocal nonumber ft=vimspector
  endif

  if &bt ==# ''  | return | endif

  setlocal wrap colorcolumn=

  " augroup myVimspector-autoReset
  "   au!
  "   windo exe @% ==# ''
  "         \ ? 'quit'
  "         \ : 'au BufWinLeave <buffer> :silent! VimspectorReset'
  " augroup END
endfunction
