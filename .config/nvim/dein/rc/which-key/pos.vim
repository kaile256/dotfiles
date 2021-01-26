" TOML: default.toml
" Repo: liuchengxu/vim-which-key

function! s:register_keys() abort
  " Add prefix 'v_' to xmaps

  function! s:repo() abort
    return fnamemodify(FindRootDirectory(), ':s_.*/\ze[^/]*/[^/]*__')
  endfunction
  function! s:set_in_reg(target) abort
    const reg = v:register ==# '"' ? '+' : v:register
    call setreg(reg, a:target)
    echo a:target 'in @'. reg
  endfunction

  nnoremap <silent> <Plug>(yank-repo)  :<C-u>call <SID>set_in_reg(<SID>repo())<CR>
  noremap! <expr>   <Plug>(paste-repo)
  nnoremap <silent> <Plug>(yank-repo-rootpath)  :<C-u>call <SID>set_in_reg(FindRootDirectory())<CR>
  noremap! <expr>   <Plug>(paste-repo-rootpath) FindRootDirectory()

  nnoremap <silent> <Plug>(yank-fullpath)  :<C-u>call <SID>set_in_reg(expand('%:p'))<CR>
  noremap! <expr>   <Plug>(paste-fullpath) expand('%:p')
  nnoremap <silent> <Plug>(yank-fname)  :<C-u>call <SID>set_in_reg(expand('%:t'))<CR>
  noremap! <expr>   <Plug>(paste-fname) expand('%:t')

  nnoremap <silent> <Plug>(yank-dirpath)  :<C-u>call <SID>set_in_reg(expand('%:p:h'))<CR>
  noremap! <expr>   <Plug>(paste-dirpath) expand('%:p:h:t')
  nnoremap <silent> <Plug>(yank-dirname)  :<C-u>call <SID>set_in_reg(expand('%:p:h'))<CR>
  noremap! <expr>   <Plug>(paste-dirname) expand('%:p:h:t')

  nnoremap <silent> <Plug>(yank-bufnr)  :<C-u>call <SID>set_in_reg(bufnr())<CR>
  noremap! <expr>   <Plug>(paste-bufnr) bufnr('%')

  let l:nmaps = {}

  let l:nmaps['Yank Path:'] = {
        \ 'name': '[ local ]',
        \
        \ 'f': ['<Plug>(yank-fname)', 'Get current filename'],
        \ 'F': ['<Plug>(yank-fullpath)',  'Get current full-path'],
        \
        \ 'd': ['<Plug>(yank-dirname)',  'Get name of current directory'],
        \ 'D': ['<Plug>(yank-dirpath)',  'Get full-path of current directory'],
        \
        \ 'b': ['<Plug>(yank-bufnr)', 'Get current bufnr'],
        \ 'r': ['<Plug>(yank-repo)',  'Get current repo'],
        \ 'R': ['<Plug>(yank-repo-rootpath)', "Get current repo's root path"],
        \ }
  let l:nmaps['Paste Path:'] = {
        \ 'name': '[ local ]',
        \
        \ 'f': ['<Plug>(paste-fname)', 'Paste current filename'],
        \ 'F': ['<Plug>(paste-fullpath)',  'Paste current full-path'],
        \
        \ 'd': ['<Plug>(yank-dirname)',  'Get name of current directory'],
        \ 'D': ['<Plug>(yank-dirpath)',  'Get full-path of current directory'],
        \
        \ 'b': ['<Plug>(paste-bufnr)', 'Paste current bufnr'],
        \ 'r': ['<Plug>(paste-repo)',  'Paste current repo'],
        \ 'R': ['<Plug>(paste-repo-rootpath)', "Paste current repo's root path"],
        \ }

  if dein#tap('vim-caser') "{{{1
    let l:nmaps['Caser:'] = {
          \ 'name': '[arthurxavierx/vim-caser]',
          \
          \ 't': ['<Plug>CaserTitleCase',    'Title Case'],
          \ '(': ['<Plug>CaserSentenceCase', 'Start a sentence'],
          \ ')': ['<Plug>CaserSpaceCase',    'continue a sentence'],
          \
          \ 'p': ['<Plug>CaserMixedCase', 'PascalCase'],
          \ 'c': ['<Plug>CaserCamelCase', 'camelCase'],
          \
          \ '_': ['<Plug>CaserSnakeCase', 'snake_case'],
          \ 'U': ['<Plug>CaserUpperCase', 'UPPER_CASE'],
          \
          \ '-': ['<Plug>CaserKebabCase', 'kebab-case'],
          \ '.': ['<Plug>CaserDotCase',   'dot.separated'],
          \ }

    let l:nmaps['Caser in Visual:'] = {
          \ 'name': '[arthurxavierx/vim-caser]',
          \
          \ 't': ['<Plug>CaserVTitleCase',    'Title Case'],
          \ '(': ['<Plug>CaserVSentenceCase', 'Start a sentence'],
          \ ')': ['<Plug>CaserVSpaceCase',    'continue a sentence'],
          \
          \ 'p': ['<Plug>CaserVMixedCase', 'PascalCase'],
          \ 'c': ['<Plug>CaserVCamelCase', 'camelCase'],
          \
          \ '_': ['<Plug>CaserVSnakeCase', 'snake_case'],
          \ 'U': ['<Plug>CaserVUpperCase', 'UPPER_CASE'],
          \
          \ '-': ['<Plug>CaserVKebabCase', 'kebab-case'],
          \ '.': ['<Plug>CaserVDotCase',   'dot.separated'],
          \ }
  endif

  " " if dein#tap('open-browser.vim') "{{{1
  "   let l:nmaps['OpenBrowser:'] = {}
  "
  "   function! s:define_mappings() abort
  "     let prefix_for_openbrowser = '\b'
  "     let key2engine = {
  "          \ 'a': 'archwiki@en',
  "          \ 'b': 'duckduckgo',
  "          \ 'd': 'duckduckgo',
  "          \ 'h': 'github.com/',
  "          \ 'k': 'wikipedia',
  "          \ 'l': 'gitlab',
  "          \ 't': 'thesaurus',
  "          \ 'w': 'weblio',
  "          \ }
  "
  "     function! s:openbrowser(engine, args) abort
  "       if a:engine =~# '/$'
  "         let prefix = 'https://'. a:engine
  "         let url = prefix . a:args
  "         echo 'OpenBrowser' url
  "         exe  'OpenBrowser' url
  "       else
  "         let engine = '-'. a:engine
  "         echo 'OpenBrowserSearch' engine a:args
  "         exe  'OpenBrowserSearch' engine a:args
  "       endif
  "     endfunction
  "
  "     let which_keys = {}
  "     for key in keys(key2engine)
  "       let raw_engine = key2engine[key]
  "       let description = 'Open in '. raw_engine
  "       let engine = substitute(raw_engine, '[@/.]', '_', 'g')
  "
  "       let s:op = {}
  "       function! s:op_browser(raw_engine, ...) abort
  "         if a:0
  "           let args = getline('.')[col("'[") - 1 : col("']") -1]
  "         else
  "           let args = getline('.')[col("'<") - 1 : col("'>") -1]
  "         endif
  "         call s:openbrowser(a:raw_engine, args)
  "       endfunction
  "       let s:op[engine] = funcref('s:op_browser', [raw_engine])
  "       let opfunc = '<SID>op.'. engine
  "
  "       let Plug = '<Plug>(OpenBrowser-'. engine .')'
  "       exe 'nnoremap <silent>' Plug ':<C-u>set opfunc='. opfunc .'<CR>g@'
  "       exe 'xnoremap <silent>' Plug ':call' opfunc .'()<CR>'
  "
  "       call extend(which_keys, {key : [Plug, description]})
  "     endfor
  "
  "     return which_keys
  "   endfunction
  "   call extend(l:nmaps['OpenBrowser:'], s:define_mappings())
  " endif
  "
  if dein#tap('vim-windowswap') "{{{1
    function! s:SwapWindow(direction) abort
      call WindowSwap#MarkWindowSwap()
      exe 'wincmd' a:direction
      call WindowSwap#DoWindowSwap()
    endfunction

    let l:nmaps['Window:'] = {
          \ 'h': [funcref('s:SwapWindow', ['h'])],
          \ 'j': [funcref('s:SwapWindow', ['j'])],
          \ 'k': [funcref('s:SwapWindow', ['k'])],
          \ 'l': [funcref('s:SwapWindow', ['l'])],
          \ }
  endif

  if dein#tap('fzf.vim') "{{{1
    let l:nmaps['FZF:'] = {
          \ 'N': [':Nmaps', 'Show Nmaps'],
          \ 'I': [':Imaps', 'Show Imaps'],
          \ 'X': [':Xmaps', 'Show Xmaps'],
          \ 'S': [':Smaps', 'Show Smaps'],
          \ 'V': [':Vmaps', 'Show Vmaps'],
          \ 'C': [':Cmaps', 'Show Cmaps'],
          \ 'O': [':Omaps', 'Show Omaps'],
          \ 'T': [':Tmaps', 'Show Tmaps'],
          \ }
  endif

  if dein#tap('telescope.nvim') "{{{1
    let l:nmaps['Telescope:'] = {
          \ 'name': 'telescope',
          \
          \ 'm': [':Telescope man_pages', 'Man pages'],
          \ 'h': [':Telescope help_tags', 'Vim Help'],
          \
          \ 'H': {
          \   'name': 'GitHub',
          \   'g': [':Telescope gh_gist', 'Gists'],
          \   'i': [':Telescope gh_issues', 'Issues'],
          \   'p': [':Telescope gh_pull_request', 'Pull Requests'],
          \ },
          \ }
  endif

  for key in keys(l:nmaps)
    call which_key#register(key, l:nmaps[key])
  endfor
endfunction
call s:register_keys()
delfunction s:register_keys

function! s:register_git_keys() abort
  let git_nmaps = {
        \ 'name': '[ Git ]',
        \ }

  let git_xmaps = {
        \ 'name': '[ Git ]',
        \ }

  if dein#tap('agit.vim') "{{{1
    call extend(git_nmaps, {
          \ 'l': [':AgitFile', 'View Git log of current buffer with Agit'],
          \ 'L': [':Agit', 'View Git log with Agit'],
          \ })
  endif

  if dein#tap('coc.nvim') "{{{1
    call extend(git_nmaps, {
          \ 'm': ['<Plug>(coc-git-chunkinfo)', 'Show diff of chunk at cursor'],
          \ 'M': ['<Plug>(coc-git-commit)', 'Show the commit that includes cursor line'],
          \ })

    call extend(git_nmaps, {
          \ 'B': [
          \   ':CocCommand git.browserOpen',
          \   'Open the remote file at the line in your browser',
          \ ],
          \ })
  endif

  if dein#tap('vim-fugitive') "{{{1
    function! s:is_nothing_staged() abort
      let git_root = shellescape(FindRootDirectory() .'/.git')
      let git_diff_cached = system('git --git-dir='. git_root .' diff --cached')
      let is_nothing_staged = len(git_diff_cached) == 0
      return is_nothing_staged
    endfunction
    function! s:CommitAtBottom(...) abort
      let opts = join(a:000)
      const is_amending = opts =~# '--amend\>'

      if !is_amending && s:is_nothing_staged()
        echo '[fugitive] nothing staged yet'
        return
      elseif is_amending && opts =~# '--no-edit\>'
            \ && input('[fugitive] Amend the staged changes? y[es]/n[o] ')
            \         !~# 'y\%[es]'
        echo "\nabort"
        return
      endif

      exe 'Git commit' opts
      wincmd J
      resize 25
    endfunction

    function! s:Gvstatus() abort
      vert bot Gstatus
      if bufwinnr('\.git/index') == -1 | return | endif

      vert resize 70
      setl winfixwidth
      let Go_to_Staged_section = 'norm gs'
      exe Go_to_Staged_section
      norm! zz
    endfunction

    " Tips: Append a space after `':foo bar()'`; without the trailing space,
    " the command-pattern will be regarded as a function.
    call extend(git_nmaps, {
          \ 's': [funcref('s:Gvstatus'), 'Show Status in a column'],
          \ 'S': [':tab Gstatus', 'Show Status in another tab'],
          \
          \ 'w': [':Gwrite', ':w | Stage the file'],
          \
          \ 'u': [':silent G reset HEAD %', 'Unstage current buffer'],
          \ 'U': [':silent G reset HEAD',   'Unstage all'],
          \
          \ 'c' : {
          \     'name': 'Commit',
          \     'c': [funcref('s:CommitAtBottom'), 'Commit'],
          \     'a': [funcref('s:CommitAtBottom', ['--amend']), 'Amend to the last commit'],
          \     'e': [funcref('s:CommitAtBottom', ['--amend --no-edit']), 'Amend witout editing commit'],
          \     'w': [
          \       ":Gwrite \<bar> call call(". string(funcref('s:CommitAtBottom')) .', [])',
          \       ':Stage the file and edit a commit message',
          \     ],
          \     },
          \
          \ 'r': {
          \     'name': 'Remote',
          \     'p': [':Git pull', 'Pull'],
          \     'P': [':Git push', 'Push'],
          \
          \     'U': [':exe "Git push -u origin" FugitiveHead() ', 'Set upstream branch to `origin`'],
          \
          \     'f': [':Git fetch --all',       'Fetch all the remote commits'],
          \     'F': [':Git fetch --unshallow', 'Unshallow fetching all the remote history'],
          \
          \     'B': [':Gbrowse', 'Open current file in browser'],
          \     },
          \ })

    " Tips: Make delay to show which-key window at &timeoutlen.
    nnoremap <space>gc<SID> <Nop>
    nnoremap <space>gr<SID> <Nop>
  endif

  if dein#tap('vim-gitgutter') "{{{1
    " TOML: git.toml
    " Repo: airblade/vim-gitgutter
    function! s:StageHunksOnRange(above, below) abort
      let save_view = winsaveview()
      let [above, below] = sort([a:above, a:below], 'n')
      exe above
      let last_lnum = line('.')
      while last_lnum <= below
        silent! GitGutterStageHunk
        silent! GitGutterNextHunk

        let curr_lnum = line('.')
        if last_lnum == curr_lnum | break | endif
        let last_lnum = curr_lnum
      endwhile
      call winrestview(save_view)
    endfunction
    function! s:stage_hunks_op(wise) abort
      call s:StageHunksOnRange(line("'["), line("']"))
      " Note: because gitgutter set g:repeat_sequence in their functions,
      " `repeat#set()` must be called here.
      silent! call repeat#set("\<Plug>(GitGutterStageHunksOperator)")
    endfunction
    nnoremap <silent> <Plug>(GitGutterStageHunksOperator)
          \ :<C-u>set operatorfunc=<SID>stage_hunks_op<CR>g@
    nnoremap <expr><silent> <Plug>(GitGutterStageHunkAtCursor)
          \ (foldclosed('.') == -1 ? ':<C-u>' : 'V')
          \ .':GitGutterStageHunk<CR>'

    call extend(git_nmaps, {
          \ 'p': ['<Plug>(GitGutterStageHunksOperator)', 'Operator to stage hunks'],
          \ 'P': ['<Plug>(GitGutterStageHunkAtCursor)', 'Stage the hunk at cursor'],
          \ })

    call extend(git_xmaps, {
          \ 'p': [funcref('s:StageHunksOnRange', [line("'<"), line("'>")]), 'Stage hunks on the visualized area'],
          \
          \ 'U': ['<Plug>(GitGutterUndoHunk)', 'Reset hunks on the visualized area to HEAD'],
          \ })
  endif

  if dein#tap('octo.nvim') "{{{1
    call extend(git_nmaps, {
          \ 'h': {
          \   'name': 'Telescope for GitHub',
          \
          \   'p': [':Octo pr list', 'List of Pull Request'],
          \   'g': [':Octo gist list', 'List of Gist'],
          \
          \   'i': {
          \     'name': 'Issue',
          \     'l': [':Octo issue list', 'List at the Repository'],
          \     'c': [':Octo issue create', 'Create Issue at the Repository'],
          \   },
          \ },
          \ })
  endif
  call which_key#register('Git:', git_nmaps)
  call which_key#register('Git in Visual:', git_xmaps)
endfunction
call s:register_git_keys()
delfunction s:register_git_keys
