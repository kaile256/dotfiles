
let s:save_cpo = &cpoptions
set cpoptions&vim

function! chundo#undoLine() abort
  " Keep track of what the line used to look like
  let originalline = getline('.')
  " Keep track of what final line we change
  let originalline_number = line('.')
  " Initial line pointer
  let line = line('.')

  " Initially set to the current line contents, so if we have no matches,
  " nothing should happen
  let newLine = getline('.')

  " Calculate the document length
  let buflen = line('$')

  " Skip undo states, allowing us to traverse instead of just toggle
  let skipper = 0

  let i = 0
  while i < 40
    " Do an undo operation
    silent undo

    " Go back to the line we're dealing with
    execute ':' . line

    " If the line has changed
    if getline('.') != originalline
      " update the line pointer to the current document length
      " This protects us when lines are deleted above the line we're
      " dealing with
      let line += line('$') - buflen
    endif

    " Update the current buffer length
    let buflen = line('$')

    " Go back to the (now shifted) line we're dealing with
    execute ':' . line

    " If it's different, we found a match
    if getline('.') != originalline
      " But will only accept if if we've traversed far enough
      if skipper < b:undoPosition
        let skipper += 1
      else
        " We did, so save the current line state
        let newLine = getline('.')

        " And put the file back the way it was
        let c = 0
        while c <= i
          silent redo
          let c += 1
        endwhile

        break
      endif
    endif

    let i += 1
  endwhile

  " Set the original line to the new content we found
  call setline(originalline_number, newLine)
  " And go back to that line
  execute ':' . originalline_number

endfunction

" Apply undo over a range
function! chundo#undoSelected() abort
  let [linestart, col1] = getpos("'<")[1:2]
  let [lineend, col2] = getpos("'>")[1:2]

  while linestart <= lineend
    execute ':' . linestart

    call chundo#undoLine()
    let linestart += 1
  endwhile

  let b:undoPosition += 1

  normal gv
endfunction

" Reset skip count
function! chundo#_resetCounter() abort
  let b:undoPosition = 0
endfunction

" Redo on visual selection
function! chundo#redo() abort
  normal <C-c>
  normal u
  normal gv
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
