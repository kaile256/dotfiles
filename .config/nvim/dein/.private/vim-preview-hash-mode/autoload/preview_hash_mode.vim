
let s:augroup_name = 'preview-hash-mode'

function! s:preview_gdiff(mod) abort
  let buflist = tabpagebuflist()

  let hash = matchstr(getline('.'), '\x\{6,}')
  if len(hash) > 0
    exe a:mod 'Gpedit' hash
  endif
endfunction

function! preview_hash_mode#enable(mod) abort
  if exists(':Gpedit')
    throw 'preview-hash-mode requires `:Gpedit`'
  endif

  exe 'augroup' s:augroup_name
  au! CursorMoved <buffer> call s:preview_gdiff(a:mod) | augroup END
endfunction

function! preview_hash_mode#disable() abort
  exe 'au! <buffer>' s:augroup_name
endfunction

function! preview_hash_mode#toggle(mod) abort
  if exist('#'. s:augroup_name .'#<buffer>')
    call preview_hash_mode#disable()
  else
    call preview_hash_mode#enable(a:mod)
  endif
endfunction

