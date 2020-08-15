" From: fugitive.toml
" Repo: gregsexton/gitv

" Gitv_CommitStep decides the line that shows '-- Load More --'
"let g:Gitv_CommitStep = &lines

"let     g:Gitv_OpenHorizontal = 1
let g:Gitv_DoNotMapCtrlKey = 1

      "\ 'quit': 'q',
let g:Gitv_CustomMappings = {
      \ 'update': 'U',
      \ 'toggleAll': 'a',
      \
      \ 'nextBranch': '<C-y>',
      \ 'prevBranch': '<C-e>',
      \
      \ 'nextRef': '<C-n>',
      \ 'prevRef': '<C-p>',
      \
      \ 'editCommit': [
      \   '<cr>', {
      \     'keys': '<LeftMouse>',
      \     'prefix': '<LeftMouse>'
      \   },
      \ ],
      \
      \ 'prevCommit': '<c-j>',
      \ 'nextCommit': '<c-k>',
      \ 'splitCommit': 'o',
      \ 'vertSplitCommit': 's',
      \ 'tabeCommit': 'O',
      \ 'editCommitDetails': 'i',
      \
      \ 'diff': 'D',
      \ 'vdiff': 'D',
      \ 'stat': 'S',
      \ 'vstat': 'S',
      \ 'checkout': 'co',
      \
      \ 'merge': 'M',
      \ 'vmerge': 'M',
      \
      \ 'cherryPick': 'cp',
      \ 'vcherryPick': 'cp',
      \
      \ 'reset': 'R',
      \ 'vreset': 'R',
      \ 'resetSoft': 'rS',
      \ 'vresetSoft': 'rS',
      \ 'resetHard': 'rH',
      \ 'vresetHard': 'rH',
      \
      \ 'revert': 'rv',
      \ 'vrevert': 'rv',
      \
      \ 'delete': 'd',
      \ 'vdelete': 'd',
      \
      \ 'rebase': 'ri',
      \ 'vrebase': 'ri',
      \ 'rebasePick': 'rp',
      \ 'vrebasePick': 'rp',
      \ 'rebaseReword': 'rw',
      \ 'vrebaseReword': 'rw',
      \ 'rebaseMarkEdit': 'rF',
      \ 'vrebaseMarkEdit': 'rF',
      \ 'rebaseSquash': 'rs',
      \ 'vrebaseSquash': 'rs',
      \ 'rebaseFixup': 'rF',
      \ 'vrebaseFixup': 'rF',
      \ 'rebaseExec': 'rF',
      \ 'vrebaseExec': 'rF',
      \ 'rebaseDrop': 'rd',
      \ 'vrebaseDrop': 'rd',
      \ 'rebaseAbort': 'ra',
      \ 'rebaseToggle': 'rt',
      \ 'vrebaseToggle': 'rt',
      \ 'rebaseSkip': 'rs',
      \ 'rebaseContinue': 'rr',
      \ 'rebaseEdit': 're',
      \
      \ 'bisectStart': 'gbs',
      \ 'vbisectStart': 'gbs',
      \ 'bisectGood': 'gbg',
      \ 'vbisectGood': 'gbg',
      \ 'bisectBad': 'gbb',
      \ 'vbisectBad': 'gbb',
      \ 'bisectSkip': 'gbn',
      \ 'vbisectSkip': 'gbn',
      \ 'bisectReset': 'gbr',
      \ 'bisectLog': 'gbl',
      \ 'bisectReplay': 'gbp',
      \
      \ 'head': 'P',
      \ 'parent': 'p',
      \ 'toggleWindow': '<C-w>p',
      \ 'git': 'git',
      \ 'yank': 'y#'
      \ }
