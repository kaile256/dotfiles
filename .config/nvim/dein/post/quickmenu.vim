" TOML: default.toml
" Repo: skywind3000/quickmenu.vim
" Another: post/quickmenu.vim

call quickmenu#reset()

call quickmenu#header('# Debug with Vimspector')

" Format: call quickmenu#append(text, action [, help = '' [, ft = '']])
call quickmenu#append('Start', 'DebugStart')

call quickmenu#append('# In Progress', '')

call quickmenu#append('Continue', 'call vimspector#Continue()')
call quickmenu#append('Pause',    'call vimspector#Pause()')

call quickmenu#append('Restart', 'call vimspector#Restart()')
call quickmenu#append('Stop',    'call vimspector#Stop()')
call quickmenu#append('Reset',   'call vimspector#Reset()')

call quickmenu#append('# Step', '')

call quickmenu#append('StepOver', 'call vimspector#StepOver()')
call quickmenu#append('StepInto', 'call vimspector#StepInto()')
call quickmenu#append('StepOut',  'call vimspector#StepOut()')
