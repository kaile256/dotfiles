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
      \ 'nextBranch': 'x',
      \ 'prevBranch': 'X',
      \ 'nextRef': 'r',
      \ 'prevRef': 'R',
      \
      \ 'editCommit': [
      \ '<cr>', { 'keys': '<LeftMouse>', 'prefix': '<LeftMouse>' }
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
      \ 'merge': '<leader>m',
      \ 'vmerge': 'm',
      \
      \ 'cherryPick': 'cp',
      \ 'vcherryPick': 'cp',
      \
      \ 'reset': 'rb',
      \ 'vreset': 'rb',
      \ 'resetSoft': 'rbs',
      \ 'vresetSoft': 'rbs',
      \ 'resetHard': 'rbh',
      \ 'vresetHard': 'rbh',
      \
      \ 'revert': 'rev',
      \ 'vrevert': 'rev',
      \
      \ 'delete': 'd',
      \ 'vdelete': 'd',
      \
      \ 'rebase': 'grr',
      \ 'vrebase': 'grr',
      \ 'rebasePick': 'grP',
      \ 'vrebasePick': 'grP',
      \ 'rebaseReword': 'grR',
      \ 'vrebaseReword': 'grR',
      \ 'rebaseMarkEdit': 'grF',
      \ 'vrebaseMarkEdit': 'grF',
      \ 'rebaseSquash': 'grF',
      \ 'vrebaseSquash': 'grF',
      \ 'rebaseFixup': 'grF',
      \ 'vrebaseFixup': 'grF',
      \ 'rebaseExec': 'grF',
      \ 'vrebaseExec': 'grF',
      \ 'rebaseDrop': 'grF',
      \ 'vrebaseDrop': 'grF',
      \ 'rebaseAbort': 'gra',
      \ 'rebaseToggle': 'grs',
      \ 'vrebaseToggle': 'grs',
      \ 'rebaseSkip': 'grn',
      \ 'rebaseContinue': 'grc',
      \ 'rebaseEdit': 'gre',
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
      \ 'toggleWindow': 'gw',
      \ 'git': 'git',
      \ 'yank': 'yc'
      \ }
