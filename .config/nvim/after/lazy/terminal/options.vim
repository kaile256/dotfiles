" Without the check that current buffer is terminal, opening terminal
" background like with QuickRun apply all the config on non-terminal buffer.
if &bt !=# 'terminal' | finish | endif

setlocal titlestring=%{matchstr(expand('%:p'),'\\S*')}

setlocal nonumber signcolumn=

norm! 0
" startinsert " Some plugin start terminal with inserting 'i'.
