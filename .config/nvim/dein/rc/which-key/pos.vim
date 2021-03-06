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

  nnoremap <silent> <Plug>(yank-zero)  :<C-u>call <SID>set_in_reg(@0)<CR>

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
        \ "\<C-g>": [':echo expand("%:p") ', 'Echo current full-path'],
        \
        \ '0': ['<Plug>(yank-zero)', 'Get current @0'],
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
        \ "\<C-g>": ["\<C-o>:echo expand('%:p') \<CR>", 'Echo current full-path'],
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

  if dein#tap('open-browser.vim') "{{{1
    function! s:openbrowser_in(engine, ...) abort
      let engine = a:engine =~# '/$'
            \ ? a:engine
            \ : '-'. a:engine .' '

      let words = get(a:, 1, '') ==# 'x'
            \ ? getline('.')[col("'<") - 1 : col("'>") - 1]
            \ : engine =~# '/$'
            \   ? expand('<cfile>')
            \   : expand('<cword>')

      let args = engine . words

      echo 'OpenBrowserSmartSearch '. args
      exe  'OpenBrowserSmartSearch '. args
    endfunction

    let l:nmaps['OpenBrowser:'] = {
          \ 'H': [funcref('s:openbrowser_in', ['github.com/']), 'Search in GitHub'],
          \
          \ 'Y': [funcref('s:openbrowser_in', ['duckduckgo&year']),  'Duckduckgo in Year'],
          \ 'M': [funcref('s:openbrowser_in', ['duckduckgo&month']), 'Duckduckgo in Month'],
          \ 'W': [funcref('s:openbrowser_in', ['duckduckgo&week']),  'Duckduckgo in Week'],
          \ 'D': [funcref('s:openbrowser_in', ['duckduckgo&day']),   'Duckduckgo in Day'],
          \
          \ 'd': [funcref('s:openbrowser_in', ['duckduckgo']),  'Search in Duckduckgo'],
          \ 'a': [funcref('s:openbrowser_in', ['archwiki@en']), 'Search in Archwiki in English'],
          \ 'k': [funcref('s:openbrowser_in', ['wikipedia']),   'Search in Wikipedia'],
          \ 'h': [funcref('s:openbrowser_in', ['github']),      'Search in GitHub'],
          \ 'l': [funcref('s:openbrowser_in', ['gitlab']),      'Search in GitLab'],
          \ 't': [funcref('s:openbrowser_in', ['thesaurus']),   'Search in Thesaurus'],
          \ 'w': [funcref('s:openbrowser_in', ['weblio']),      'Search in Weblio'],
          \ }

    function! s:openbrowser(args) abort
      let engine = s:opb_engine
      if engine ==? 'url'
        echo 'OpenBrowser' a:args
        exe 'OpenBrowser' a:args
        return
      endif

      if engine =~# '/$'
        const prefix = 'https://'. engine
        const url = prefix . a:args
        echo 'OpenBrowser' url
        exe  'OpenBrowser' url
      else
        let engine = '-'. engine
        echo 'OpenBrowserSearch' engine a:args
        exe  'OpenBrowserSearch' engine a:args
      endif
    endfunction

    function! s:open_browser_op(...) abort
      if a:0
        let args = getline('.')[col("'[") - 1 : col("']") -1]
      else
        let args = getline('.')[col("'<") - 1 : col("'>") -1]
      endif
      call s:openbrowser(args)
    endfunction

    function! s:OpenBrowserOp(engine) abort
      let s:opb_engine = a:engine
      let &operatorfunc = expand('<SID>') .'open_browser_op'
      call feedkeys('g@', 'n')
    endfunction

    function! s:OpenBrowserVisual(engine) abort
      let s:opb_engine = a:engine
      call s:open_browser_op()
    endfunction

    let l:nmaps['OpenBrowser in Operator:'] = {
          \ 'B': [funcref('s:OpenBrowserOp', ['url']), 'Search in URL'],
          \
          \ 'd': [funcref('s:OpenBrowserOp', ['duckduckgo']), 'Duckduckgo'],
          \
          \ 'w': [funcref('s:OpenBrowserOp', ['weblio']),    'Weblio: English-Japanese'],
          \ 't': [funcref('s:OpenBrowserOp', ['thesaurus']), 'Thesaurus: English'],
          \
          \ 'a': [funcref('s:OpenBrowserOp', ['archwiki@en']), 'ArchWiki@en'],
          \ 'k': [funcref('s:OpenBrowserOp', ['wikipedia']),   'Wikipedia'],
          \
          \ 'h': [funcref('s:OpenBrowserOp', ['github']), 'GitHub'],
          \ 'l': [funcref('s:OpenBrowserOp', ['gitlab']), 'GitLab'],
          \
          \ 'H': [funcref('s:OpenBrowserOp', ['github.com/']), 'Open the Repo in GitHub'],
          \ }

    let l:nmaps['OpenBrowser in Visual:'] = {
          \ 'B': [funcref('s:OpenBrowserVisual', ['url']), 'Search in URL'],
          \
          \ 'd': [funcref('s:OpenBrowserVisual', ['duckduckgo']), 'Duckduckgo'],
          \
          \ 'w': [funcref('s:OpenBrowserVisual', ['weblio']), 'Weblio: English-Japanese'],
          \ 't': [funcref('s:OpenBrowserVisual', ['thesaurus']), 'Thesaurus: English'],
          \
          \ 'a': [funcref('s:OpenBrowserVisual', ['archwiki@en']), 'ArchWiki@en'],
          \ 'k': [funcref('s:OpenBrowserVisual', ['wikipedia']), 'Wikipedia'],
          \
          \ 'h': [funcref('s:OpenBrowserVisual', ['github']), 'GitHub'],
          \ 'l': [funcref('s:OpenBrowserVisual', ['gitlab']), 'GitLab'],
          \
          \ 'H': [funcref('s:OpenBrowserVisual', ['github.com/']), 'archwiki@en'],
          \ }
  endif

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
    call which_key#register('<Plug>'. key, l:nmaps[key])
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

  let github_nmaps = {
        \ 'name': '[ GitHub ]',
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
    function! s:Grebase_interactive() abort
      const upstream = input('[User] Input a <upstream> for git-rebase-i: ')
      exe 'G rebase --interactive' upstream
    endfunction

    " Tips: Append a space after `':foo bar()'`; without the trailing space,
    " the command-pattern will be regarded as a function.
    call extend(git_nmaps, {
          \ 'R': {
          \     'name': 'Rebase',
          \     'i': [funcref('s:Grebase_interactive'), 'Run `git-rebase --interactive`'],
          \     'a': [':G rebase --abort', 'Abort rebase'],
          \     'r': [':G rebase --continue', 'Continue the current rebase'],
          \     's': [':G rebase --skip', 'Skip the current rebase'],
          \ },
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
    function! s:stage_hunks_op(...) abort
      if a:0
        call s:StageHunksOnRange(line("'["), line("']"))
      else
        call s:StageHunksOnRange(line("'<"), line("'>"))
      endif
      " Note: because gitgutter set g:repeat_sequence in their functions,
      " `repeat#set()` must be called here.
      " silent! call repeat#set("\<Plug>(GitGutterStageHunksOperator)")
    endfunction
    nnoremap <silent> <Plug>(GitGutterStageHunksOperator)
          \ :<C-u>set operatorfunc=<SID>stage_hunks_op<CR>g@
    nnoremap <expr><silent> <Plug>(GitGutterStageHunkAtCursor)
          \ (foldclosed('.') == -1 ? ':<C-u>' : 'V')
          \ .':GitGutterStageHunk<CR>'

    xnoremap gu u
    xnoremap gU U
    xnoremap u <Esc>u
    xnoremap U <Esc><Plug>(GitGutterUndoHunk)

    call extend(git_nmaps, {
          \ 'p': ['<Plug>(GitGutterStageHunksOperator)', 'Operator to stage hunks'],
          \ 'P': ['<Plug>(GitGutterStageHunkAtCursor)', 'Stage the hunk at cursor'],
          \ })

    call extend(git_xmaps, {
          \ 'p': [function('s:stage_hunks_op'), 'Stage hunks on the visualized area'],
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

  if dein#tap('gh.vim') "{{{1
    function! s:gh_get_repo() abort
      if !exists('b:git_dir')
        throw expand('%:p') .' is not a git repository'
      endif

      const git_dir = b:git_dir
      const Get_repo = 'GIT_DIR='. git_dir .' git remote get-url origin'
      const url = systemlist(Get_repo)[0]
      const repo = substitute(url, '^https://github.com/', '', '')
      return repo
    endfunction

    function! s:gh_prefix_repo() abort
      const gh_prefix = 'gh://'
      const repo = s:gh_get_repo()
      const gh_path = gh_prefix . repo
      return gh_path
    endfunction

    function! s:gh_prefix_author() abort
      const gh_prefix = 'gh://'
      const repo = s:gh_get_repo()
      const author = substitute(repo, '/[^/]\+/\?$', '', '')
      const gh_author = gh_prefix . author
      return gh_author
    endfunction

    function! s:gh_open_at_repo(open, path) abort
      const prefix = s:gh_prefix_repo() .'/'
      const gh_path = prefix . a:path
      exe a:open gh_path
    endfunction

    function! s:gh_open_at_author(open, path) abort
      const prefix = s:gh_prefix_author() .'/'
      const gh_path = prefix . a:path
      exe a:open gh_path
    endfunction

    call extend(github_nmaps, {
          \ 'b': {
          \   'name': 'Bookmark',
          \
          \   'e': [':e    gh://bookmarks', ':edit'],
          \   's': [':sp   gh://bookmarks', ':split'],
          \   'v': [':vs   gh://bookmarks', ':vsplit'],
          \   't': [':tabe gh://bookmarks', ':tabe'],
          \   },
          \
          \ 'R': {
          \   'name': 'Your Repoitory List',
          \
          \   'e': [':e    gh://user/repos', ':edit'],
          \   's': [':sp   gh://user/repos', ':split'],
          \   'v': [':vs   gh://user/repos', ':vsplit'],
          \   't': [':tabe gh://user/repos', ':tabe'],
          \   },
          \
          \ 'r': {
          \   'name': 'Current Repository',
          \
          \
          \   'm': {
          \     'name': 'README',
          \
          \     'e': [function('s:gh_open_at_repo', ['e',    'readme']), ':edit'],
          \     's': [function('s:gh_open_at_repo', ['sp',   'readme']), ':split'],
          \     'v': [function('s:gh_open_at_repo', ['vs',   'readme']), ':vsplit'],
          \     't': [function('s:gh_open_at_repo', ['tabe', 'readme']), ':tabe'],
          \     },
          \
          \   'i': {
          \     'name': 'Issue',
          \
          \     'e': [function('s:gh_open_at_repo', ['e',    'issues']), ':edit'],
          \     's': [function('s:gh_open_at_repo', ['sp',   'issues']), ':split'],
          \     'v': [function('s:gh_open_at_repo', ['vs',   'issues']), ':vsplit'],
          \     't': [function('s:gh_open_at_repo', ['tabe', 'issues']), ':tabe'],
          \     },
          \
          \   'p': {
          \     'name': 'Pull-Request',
          \
          \     'e': [function('s:gh_open_at_repo', ['e',    'pulls']), ':edit'],
          \     's': [function('s:gh_open_at_repo', ['sp',   'pulls']), ':split'],
          \     'v': [function('s:gh_open_at_repo', ['vs',   'pulls']), ':vsplit'],
          \     't': [function('s:gh_open_at_repo', ['tabe', 'pulls']), ':tabe'],
          \     },
          \
          \   },
          \
          \ })
  endif

  call which_key#register('<Plug>Git:', git_nmaps)
  call which_key#register('<Plug>Git in Visual:', git_xmaps)
  call which_key#register('<Plug>GitHub:', github_nmaps)
endfunction
call s:register_git_keys()
delfunction s:register_git_keys
