" Ref: $VIMRUNTIME/syntax/dockerfile.vim

if exists('b:current_syntax')
  finish
endif
let b:current_syntax = 'dockerfile_with_shell'

try
  syntax include @Shell syntax/sh.vim
  unlet b:current_syntax
catch /E403/
  " Ignore errors about syntax files that can't be loaded more than once
endtry

syn keyword dockerfileTodo contained display FIXME NOTE NOTES TODO XXX
syn region dockerfileComment start="#" end="\n" contains=dockerfileTodo,@Spell

syn region dockerfileEmail start=/</ end=/>/ contains=@ oneline
syn match dockerfileUrl /\(http\|https\|ssh\|hg\|git\)\:\/\/[a-zA-Z0-9\/\-\._]\+/

let s:docker_keywords = [
      \ 'ADD',
      \ 'ARG',
      \ 'CMD',
      \ 'COPY',
      \ 'ENTRYPOINT',
      \ 'ENV',
      \ 'EXPOSE',
      \ 'FROM',
      \ 'HEALTHCHECK',
      \ 'LABEL',
      \ 'MAINTAINER',
      \ 'ONBUILD',
      \ 'RUN',
      \ 'SHELL',
      \ 'STOPSIGNAL',
      \ 'USER',
      \ 'VOLUME',
      \ 'WORKDIR',
      \ ]

syn case ignore
syn region dockerfileString start=/\z(['"]\)/ skip=/\\\z1|\\\\/ end=/\z1/
syn match dockerfileKeyword / AS / skipwhite containedin=dockerfileCommands
exe 'syn match dockerfileKeyword'
      \ '/\v\s*('. join(s:docker_keywords, '|') .')\s+/'
      \ 'containedin=dockerfileCommands'
      \ 'skipwhite'
exe 'syn region dockerfileCommands'
      \ 'start=/^\s*'. join(s:docker_keywords, '\|') .'\>/'
      \ 'end=/[^\\]\s*$/'
      \ 'contains=dockerfileKeyword,@Shell'

unlet s:docker_keywords

hi link dockerfileKeyword Keyword
hi link dockerfileComment Comment
hi link dockerfileEmail   Identifier
hi link dockerfileUrl     Identifier
hi link dockerfileTodo    Todo
hi link bashStatement     Function

" vim:ft=vim
