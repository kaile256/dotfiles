" From: init.vim
" Treat default plugins as already loaded to prohibit load it.
" Ref: $VIMRUNTIME

let g:loaded_vimball       = 1
let g:loaded_vimballPlugin = 1

let g:loaded_tutor_mode_plugin = 1

let g:loaded_2html_plugin = 1
command -range=% -bar TOhtml :call tohtml#Convert2HTML(<line1>, <line2>)

let g:loaded_fzf = 1

augroup ReloadDefaultPlugins
  au!
  au FileType netrw ++once runtime source/netrw.vim
  " FIXME: work all below
  "au BufReadPre *.tar ++once call s:runtime_tar() "{{{1
  ""let g:loaded_tarPlugin = 1
  "let g:loaded_tar       = 1
  "function! s:runtime_tar()
  "  unlet g:loaded_tarPlugin
  "  unlet g:loaded_tar
  "  runtime! globpath('$VIMRUNTIME', '**/tar*.vim')
  "endfunction

  "au BufReadPre *.zip,*.gzip ++once call s:runtime_zip() "{{{1
  ""let g:loaded_zipplugin = 1
  "let g:loaded_zip       = 1
  "let g:loaded_gzip      = 1
  "function! s:runtime_zip()
  "  unlet g:loaded_zipplugin
  "  unlet g:loaded_zip
  "  unlet g:loaded_gzip
  "  runtime! globpath('$VIMRUNTIME', '**/*zip*.vim')
  "endfunction
  "}}}1
augroup END
