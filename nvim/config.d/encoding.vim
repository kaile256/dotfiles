"" Encoding
""set enc=utf-8
" when different from utf-8, convert it.
set fenc=utf-8
""set formatoptions=tcqj
" for multi-byte code
scriptencoding utf-8
set ambiwidth=double

if has('unix')
  " vim shows .bin as Hex.
  augroup BinToHex
    au!
    au BufReadPre *.bin let &bin=1
    au BufReadPost *.bin if &bin | silent %!xxd -g 1
    au BufReadPost *.bin set ft=xxd | endif

    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | silent %!xxd -g 1
    au BufWritePost *.bin set nomod | endif
augroup END
endif
