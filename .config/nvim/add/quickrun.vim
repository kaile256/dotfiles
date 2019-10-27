" From: shell.toml
" Repo: thinca/vim-quickrun
" Ext: heavenshell/vim-quickrun-hook-unittest

let g:quickrun_no_default_key_mappings = 1

let g:quickrun_config = {
      \ 'runner': 'vimproc',
      \ 'runner/vimproc/updatetime': 100,
      \ 'outputter': 'loclist',
      \ 'outputter/buffer/append': 1,
      \ 'outputter/buffer/into': 1,
      \ 'outputter/buffer/close_on_empty': 1,
      \ 'hook/time/enable': 1,
      \ }

let g:quickrun_config.markdown = {
      \ 'type': 'markdown/pandoc',
      \ 'outputter/browser/name': 'qutebrowser'
      \ }

" TODO: install testing framework respectively
let g:quickrun_config['php.unit']         = { 'command': 'testrunner', 'cmdopt': 'phpunit' }
let g:quickrun_config['python.unit']      = { 'command': 'nosetests',  'cmdopt': '-v -s'   }
let g:quickrun_config['python.pytest']    = { 'command': 'py.test',    'cmdopt': '-v'      }
" Django unittest
let g:quickrun_config['python.django']    = { 'command': 'python',     'cmdopt': 'test --pararell=2 --keepdb -v2'}
" pytest-django
" let g:quickrun_config['python.django']    = { 'command': 'python',   'cmdopt: 'test --noinput -- --verbose --reuse-db', 'test_fw': 'pytest' }
let g:quickrun_config['ruby.rspec']       = { 'command': 'rspec',      'cmdopt': '-f d'    }
let g:quickrun_config['ruby.minitest']    = { 'command': 'ruby'                            }
let g:quickrun_config['go.test']          = { 'command': 'go',         'cmdopt': 'test -v' }
let g:quickrun_config['javascript.mocha'] = { 'command': 'mocha' }
let g:quickrun_config['javascript.jest']  = { 'command': 'jest'  }

augroup QuickRunUnitTest
  au!
  au BufWinEnter,BufNewFile *test.php setlocal filetype=php.unit
  " Note: Choose UnitTest, py.test or Django.
  au BufWinEnter,BufNewFile test_*.py setlocal filetype=python.unit
  "au BufWinEnter,BufNewFile test_*.py setlocal filetype=python.pytest
  "au BufWinEnter,BufNewFile test_*.py setlocal filetype=python.django
  au BufWinEnter,BufNewFile *.t       setlocal filetype=perl.unit
  au BufWinEnter,BufNewFile *_spec.rb setlocal filetype=ruby.rspec
  au BufWinEnter,BufNewFile *_test.rb setlocal filetype=ruby.minitest
  au BufWinEnter,BufNewFile *_test.go setlocal filetype=go.test
  " Note: TypeScript support only Jest
  au BufWinEnter,BufNewFile *.spec.ts setlocal filetype=typescript.jest
  " Note: Choose Mocha or Jest
  "au BufWinEnter,BufNewFile *.test.js setlocal filetype=javascript.mocha
  "au BufWinEnter,BufNewFile *.test.js setlocal filetype=javascript.jest
  " TODO: make it sure to work
  au BufWinEnter,BufNewFile *.test.rs setlocal filetype=rust.cargo.test
augroup END

xnoremap <silent> qr :QuickRun<cr>
xnoremap <silent> qR :QuickRun<cr>

nnoremap <silent> qR  :<c-u>QuickRun<cr>
nnoremap <silent> qrr :<c-u>QuickRun<cr>
nmap qr <Plug>(quickrun-op)

function! s:quickrun_holding_ft() abort "{{{
  let ft_prev = &ft
  let id_prev = bufwinid('.')
  QuickRun
  let id_qr = bufwinid('\[quickrun output\]')
  call win_gotoid(id_qr)
  exe 'setl ft='. ft_prev
  call win_gotoid(id_prev)
endfunction "}}}
nnoremap <silent> qR  :<c-u>call <SID>quickrun_holding_ft()<cr>
nnoremap <silent> qrr :<c-u>call <SID>quickrun_holding_ft()<cr>
