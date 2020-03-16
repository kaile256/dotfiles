" ============================================================================
" File: autoload/keymapsDL/cmd_after.vim
" Author: kaile256
" License: MIT license {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
" ============================================================================

let s:path_dict = get(g:, 'keymapsDL_cd_path_dict', {'': '~'})

" TODO: g:split_dict.&ft
" Note: also available to give a number like :30vs
let s:split_dict = get(g:, 'keymapsDL_split_dict', {
      \ 'v': 'vsplit',
      \ 's': 'split',
      \ 't': 'tabe',
      \ 'e': 'edit',
      \ })

function! keymapsDL#cmd_after#cd(prefix, command, cd_access) abort "{{{
  " To: like :Fzf
  let l:map_arg = '<silent>'
  let l:lhs_raw = l:map_arg . a:prefix
  let l:cd_type = a:cd_access .'cd'

  for key_path in keys(s:path_dict)
    let lhs =  l:lhs_raw . key_path

    if s:path_dict[key_path] =~# '^:'
      " To: otherwise, commands to cd.
      " Note: if E:trainling-character, check if ':command -bar' in plugin's vimscript.
      let l:cmd_cd = s:path_dict[key_path]
    else
      let l:cmd_cd = ':<c-u>'. l:cd_type .' '. s:path_dict[key_path]
    endif

    let rhs = l:cmd_cd .'<bar>'. a:command .'<cr>'

    exe 'nnoremap ' lhs rhs
    exe 'xnoremap ' lhs rhs
  endfor
endfunction "}}}

function! keymapsDL#cmd_after#split(prefix, command) abort "{{{
  " To: like :Scratch
  let l:map_arg = '<silent>'
  let l:lhs_raw = l:map_arg . a:prefix

  for key_split in keys(s:split_dict)
    let lhs = l:lhs_raw . key_split

    let l:cmd_split = ':'. s:split_dict[key_split]
    let rhs = l:cmd_split .'<bar>'. a:command .'<cr>'

    exe 'nnoremap ' lhs rhs
    exe 'xnoremap ' lhs rhs
  endfor
endfunction "}}}

function! keymapsDL#cmd_after#cd_split(prefix, command, cd_access) abort "{{{
  let l:split_dict = copy(s:split_dict)
  if exists("s:split_dict['']")
    " Note: requires a dummy command unless :| works as :print;
    "       tell me better one than :echo.
    let l:split_dict[''] = 'echo'
  endif

  " To: like :termianl
  let l:map_arg = '<silent>'
  let l:cd_type = a:cd_access .'cd'

  for key_split in keys(l:split_dict)
    for key_path in keys(s:path_dict)
      let lhs = l:map_arg . a:prefix . key_path . key_split

      if s:path_dict[key_path] =~# '^:'
        let l:cmd_cd = s:path_dict[key_path]
      else
        let l:cmd_cd = ':<c-u>'. l:cd_type .' '. s:path_dict[key_path]
      endif

      let l:cmd_split = l:split_dict[key_split]
      let rhs = l:cmd_cd .'<bar>'. l:cmd_split .'<bar>'. a:command .'<cr>'

      " TODO: let it available to change the order of split and path keys.
      exe 'nnoremap ' lhs rhs
      exe 'xnoremap ' lhs rhs
    endfor
  endfor
endfunction "}}}

" vim: ts=2 sts=2 sw=2 et fdm=marker
