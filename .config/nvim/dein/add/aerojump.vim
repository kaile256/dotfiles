" From: motion.toml
" Repo: ripxorip/aerojump.nvim

" Space mode but unmatched lines are left intact.
nmap qd <Plug>(AerojumpDefault)
" Quickly move the cursor the line you want to go by typing some letters present in the line. All other lines are filtered away as you continue typing.
nmap qs <Plug>(AerojumpSpace)
" Perform a search using fuzzy-matching, results are graded through a scoring system presenting the most relevant hits first.
nmap qb <Plug>(AerojumpBolt)

nmap qf <Plug>(AerojumpFromCursorBolt)

command! AJshowLog    :AerojumpShowLog<cr>
command! AJresumeNext :AerojumpResumeNext<cr>
command! AJresumePrev :AerojumpResumePrev<cr>
