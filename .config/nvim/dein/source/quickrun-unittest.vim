" From: shell.toml
" Repo: heavenshell/vim-quickrun-hook-unittest
" Ref: add/quickrun.vim

" TODO: install testing framework respectively
let g:quickrun_config['php.unit'] = {
      \ 'command': 'testrunner',
      \ 'cmdopt': 'phpunit' }

let g:quickrun_config['python.unit'] = {
      \ 'command': 'nosetests',
      \ 'cmdopt': '-v -s' }
let g:quickrun_config['python.pytest'] = {
      \ 'command': 'py.test',
      \ 'cmdopt': '-v' }
let g:quickrun_config['python.django'] = {
      \ 'command': 'python',
      \ 'cmdopt': 'test --pararell=2 --keepdb -v2'}
" let g:quickrun_config['python.django']    = {
      \ 'command': 'python',
      \ 'cmdopt: 'test --noinput -- --verbose --reuse-db',
      \ 'test_fw': 'pytest' }

let g:quickrun_config['ruby.rspec'] = {
      \ 'command': 'rspec', 'cmdopt': '-f d' }
let g:quickrun_config['ruby.minitest'] = {
      \ 'command': 'ruby' }

let g:quickrun_config['go.test'] = {
      \ 'command': 'go', 'cmdopt': 'test -v' }

let g:quickrun_config['javascript.mocha'] = {
      \ 'command': 'mocha' }
let g:quickrun_config['javascript.jest'] = {
      \ 'command': 'jest'  }

if exists('#QuickRunUnitTest') | au! myQuickrunUnitTestSource
endif
augroup myQuickrunUnitTestSource "{{{1
  au BufWinEnter,BufNewFile *test.php setl filetype=php.unit
  " Note: need to choose UnitTest, py.test or Django.
  au BufWinEnter,BufNewFile test_*.py setl filetype=python.unit
  "au BufWinEnter,BufNewFile test_*.py setl filetype=python.pytest
  "au BufWinEnter,BufNewFile test_*.py setl filetype=python.django
  au BufWinEnter,BufNewFile *.t       setl filetype=perl.unit
  au BufWinEnter,BufNewFile *_spec.rb setl filetype=ruby.rspec
  au BufWinEnter,BufNewFile *_test.rb setl filetype=ruby.minitest
  au BufWinEnter,BufNewFile *_test.go setl filetype=go.test
  " Note: Jest is only supported on TypeScript
  au BufWinEnter,BufNewFile *.spec.ts setl filetype=typescript.jest
  " Note: need to choose Mocha or Jest
  "au BufWinEnter,BufNewFile *.test.js setl filetype=javascript.mocha
  au BufWinEnter,BufNewFile *.test.js setl filetype=javascript.jest
  " TODO: make it sure to work
  au BufWinEnter,BufNewFile *.test.rs setl filetype=rust.cargo.test
augroup END

