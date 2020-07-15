" From: fugitive.toml
" Repo: sodapopcan/vim-twiggy
" Ref: add/merginal.vim
" Another: add/twiggy.vim

"let g:twiggy_enable_remote_delete = 1

" just makes 'gl' available on twiggy-buffer
let g:twiggy_git_log_command = 1

let g:twiggy_split_method = 'vert bot'
let g:twiggy_num_columns = 35
"let g:twiggy_group_locals_by_slash = 0

" Values can be 'aplha', 'mru', 'date' or 'track'
let g:twiggy_close_on_fugitive_command = 1
let g:twiggy_local_branch_sort = 'mru'
"let g:twiggy_local_branch_sorts = ['mru', 'date']
" Values can be either 'alpha'or 'date'.
let g:twiggy_remote_branch_sort = 'date'

if exists('#myTwiggySource') | au! myTwiggySource
endif
augroup myTwiggySource
  au FileType twiggy setl winfixwidth
augroup END

let g:twiggy_keymaps_on_branch = {
      \ '<CR>': ['Checkout',   [1]],
      \ 'c':    ['Checkout',   [1]],
      \ 'C':    ['Checkout',   [0]],
      \ 'o':    ['Checkout',   [1]],
      \ 'O':    ['Checkout',   [0]],
      \ 'gc':   ['CheckoutAs', []],
      \ '%':    ['CheckoutAs', []],
      \ 'dd':   ['Delete',     []],
      \ 'F':    ['Fetch',      [0]],
      \ 'f':    ['Fetch',      [0]],
      \ 'm':    ['Merge',      [0, '']],
      \ 'M':    ['Merge',      [1, '']],
      \ 'gm':   ['Merge',      [0, '--no-ff']],
      \ 'gM':   ['Merge',      [1, '--no-ff']],
      \ 'r':    ['Rebase',     [0]],
      \ 'R':    ['Rebase',     [1]],
      \ 'V':    ['Pull',       []],
      \ 'P':    ['Push',       []],
      \ 'gP':   ['Push',       ['REMOTE']],
      \ '!P':   ['Push',       ['--force']],
      \ 'p':    ['Pull',       []],
      \ ',':    ['Rename',     []],
      \ '<<':   ['Stash',      [0]],
      \ '>>':   ['Stash',      [1]],
      \ }

finish

" 0 to remote; 1 to local
"let g:twiggy_keymaps_on_branch = {
"      \ '<CR>': ['Checkout',   []],
"      \ 'c':    ['Checkout',   []],
"      \ 'o':    ['Checkout',   []],
"      \ 'C':    ['Checkout',   ['remote']],
"      \ 'O':    ['Checkout',   ['remote']],
"      \ 'gc':   ['CheckoutAs', []],
"      \ '%':    ['CheckoutAs', []],
"      \ 'dd':   ['Delete',     []],
"      \ 'D':    ['Delete',     []],
"      \ 'F':    ['Fetch',      [0]],
"      \ 'f':    ['Fetch',      [0]],
"      \ 'm':    ['Merge',      [0, '']],
"      \ 'm':    ['Merge',      [0, '']],
"      \ 'M':    ['Merge',      [1, '']],
"      \ 'gm':   ['Merge',      [0, '--no-ff']],
"      \ 'gM':   ['Merge',      [1, '--no-ff']],
"      \ 'r':    ['Rebase',     [0]],
"      \ 'R':    ['Rebase',     [1]],
"      \ 'P':    ['Push',       []],
"      \ 'gP':   ['Push',       ['remote']],
"      \ '!P':   ['Push',       ['--force']],
"      \ 'p':    ['Pull',       []],
"      \ ',':    ['Rename',     []],
"      \ '<<':   ['Stash',      [0]],
"      \ '>>':   ['Stash',      [1]],
"      \ }

" s:Merge: a:remote, flags.
" s:Rebase: a:remote.
" s:Push: is_to_upstream, force.
" 'P':  ['Push', [0, 0]], push
" 'gP': ['Push', [1, 0]], push (prompted)
" '!P': ['Push', [0, 1]], force push

"let g:twiggy_keymaps_to_sort = {
"      \ 'i':    ['CycleSort',        [0, 1]],
"      \ 'I':    ['CycleSort',        [0, -1]],
"      \ 'gi':   ['CycleSort',        [1, 1]],
"      \ 'gI':   ['CycleSort',        [1, -1]],
"      \ 'a':    ['ToggleSlashSort',  []],
"      \ }

" 'i':    ['CycleSort',        [0, 1]],
" 'I':    ['CycleSort',        [0, -1]],
" 'gi':   ['CycleSort',        [1, 1]],
" 'gI':   ['CycleSort',        [1, -1]],
" 0 to remote; 1 to local

let g:twiggy_keymaps_on_branch = {
     \ '<CR>': ['Checkout',   []],
     \ 'c':    ['Checkout',   []],
     \ 'o':    ['Checkout',   []],
     \ 'C':    ['Checkout',   'remote'],
     \ 'O':    ['Checkout',   'remote'],
     \ 'gc':   ['CheckoutAs', ],
     \ '%':    ['CheckoutAs', ],
     \ 'dd':   ['Delete',     ],
     \ 'f':    ['Fetch',      ],
     \ 'm':  ['Merge', ],
     \ 'M':  ['Merge', 'remote'],
     \ 'gm': ['Merge', '--no-ff'],
     \ 'gM': ['Merge', 'remote', '--no-ff'],
     \ 'r':    ['Rebase',     ],
     \ 'R':    ['Rebase',   'remote'],
     \ 'P':    ['Push',       []],
     \ 'gP':   ['Push',       'remote'],
     \ '!P':   ['Push',       '--force'],
     \ 'p':    ['Pull',       []],
     \ ',':    ['Rename',     []],
     \ '<<':   ['Stash',      [0]],
     \ '>>':   ['Stash',      [1]],
     \ }

