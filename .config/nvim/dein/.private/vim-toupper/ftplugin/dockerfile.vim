" vim:ft=vim

let s:docker_words = []

let s:docker_words += [
      \ 'add',
      \ 'arg',
      \ 'cmd',
      \ 'copy',
      \ 'entrypoint',
      \ 'env',
      \ 'expose',
      \ 'from',
      \ 'healthcheck',
      \ 'label',
      \ 'maintainer',
      \ 'onbuild',
      \ 'run',
      \ 'shell',
      \ 'stopsignal',
      \ 'user',
      \ 'volume',
      \ 'workdir',
      \ ]

call toupper#buflocal(s:docker_words)
unlet s:docker_words
