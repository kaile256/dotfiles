" TOML: vimscript.toml
" Repo: mattn/benchvimrc-vim

comman! -nargs=? -complete=file BenchVimrcWrap :call s:benchvimrc(<q-args>)

function! s:benchvimrc(target) abort
  let bufnr = bufnr('__BENCHVIMRC__')
  if bufnr != -1
    let path = bufname(bufnr)
    call delete(path)
  endif

  let target = a:target ==# '' ? '%:p' : a:target
  try
    silent! exe 'silent! BenchVimrc' target
  catch /E95/
    setlocal syn=vim
  endtry
endfunction

" Benchmark: Which command is faster, `source` with $var or `runtime`?
"
" Benchmarks are recorded as below:
" 1. Make two files contains all the files under `$DEIN_ADD_HOME/`.
" 2. Append `source $DEIN_ADD_HOME/` or `runtime` before every pasted files
"    on each files.
" 3. Delete lines which has a file which causes errors, trying `source %:p`.
" 4. Using `:BenchVimrcWrap` (my wrapper command) in a macro,
"    'q:BenchVimrcWrap<CR>:<C-u>sort! u<CR>ZQq'.
"
" The records are sorted by descending order.
"
" Conclusion:
" Use `source` instead of `runtime` esp. for startup; `source` with $var is
" faster than `runtime`
"
" Neovim-Qt: `source` with $var is faster than `runtime` {{{1
"
" 1. runtime:
" 0.004943
" 0.004673
" 0.004503
" 0.004437
" 0.004366
" 0.004237
" 0.004228
" 0.004219
" 0.004214
" 0.004208
" 0.004191
" 0.004166
" 0.004155
" 0.004119
" 0.004110
" 0.004012
" 0.004010
"
" 2. source:
" 0.003773
" 0.003759
" 0.003746
" 0.003731
" 0.003720
" 0.003712
" 0.003710
" 0.003706
" 0.003675
" 0.003642
" 0.003611
" 0.003604
"
" Neovim in urxvt: `source` with $var is faster than `runtime` {{{1
"
" 1. runtime:
" 0.006645
" 0.004780
" 0.004647
" 0.004625
" 0.004600
" 0.004581
" 0.004482
" 0.004445
" 0.003915
" 0.003911
" 0.003869
" 0.003786
" 0.003764
" 0.003745
" 0.003716
" 0.003704
" 0.003691
" 0.003646
"
" 2. source:
" 0.004277
" 0.004150
" 0.004101
" 0.004076
" 0.004060
" 0.003942
" 0.003937
" 0.003935
" 0.003802
" 0.003538
" 0.003495
" 0.003445
" 0.003287
" 0.003226
" 0.003183
" 0.003164
" 0.003108
" 0.003104
" 0.003024
"
" GVim in urxvt: `source` with $var is faster than `runtime` {{{1
"
" 1. runtime:
" 0.004849
" 0.004261
" 0.004136
" 0.004123
" 0.004079
" 0.004071
" 0.003999
" 0.003982
" 0.003978
" 0.003943
" 0.003932
" 0.003915
" 0.003906
" 0.003903
" 0.003870
" 0.003853
" 0.003662
"
" 2. source:
" 0.003258
" 0.003243
" 0.003238
" 0.003213
" 0.003178
" 0.003158
" 0.003152
" 0.003101
" 0.003095
" 0.003092
" 0.003076
" 0.003056
" 0.003008
" 0.002947
" 0.002918
" 0.002849
"
" Vim in Kitty: `source` with $var is faster than `runtime` {{{1
"
" 1. runtime:
" 0.006632
" 0.006348
" 0.005873
" 0.005849
" 0.005506
" 0.005443
" 0.005346
" 0.005336
" 0.005076
" 0.004831
" 0.004786
" 0.004633
" 0.004612
" 0.004581
" 0.004511
" 0.004446
" 0.004438
" 0.004325
" 0.004267
" 0.004181
"
" 2. source:
" 0.004408
" 0.004317
" 0.004127
" 0.004043
" 0.004032
" 0.004001
" 0.003909
" 0.003886
" 0.003862
" 0.003822
" 0.003790
" 0.003789
" 0.003747
" 0.003702
" 0.003679
" 0.003673
" 0.003654
" 0.003611
" 0.003583
