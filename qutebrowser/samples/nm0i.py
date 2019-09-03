# unbinds some standard qutebrowser bindings. M-x will handle missing
# functions
c.bindings.default = {}

# reload config
config.bind('<Ctrl-x><Ctrl-l>', 'config-source')

# generic navigation
config.bind('<Ctrl-E>', 'open-editor', mode='insert')
config.bind('<Alt-,>', 'scroll-to-perc 0')
config.bind('<Alt-.>', 'scroll-to-perc')
config.bind('<Ctrl-n>', 'scroll down')
config.bind('<Ctrl-p>', 'scroll up')
config.bind('<Ctrl-a>', 'back')
config.bind('B', 'back')
config.bind('<Ctrl-e>', 'forward')
config.bind('F', 'forward')
config.bind('<Ctrl-x><Ctrl-f>', 'set-cmd-text -s :open -t')
config.bind('G', 'set-cmd-text -s :open -t')
config.bind('<Ctrl-u><Ctrl-x><Ctrl-f>', 'set-cmd-text -s :open')
config.bind('g', 'set-cmd-text -s :open')

config.bind('<Escape>', 'leave-mode', mode='insert')
config.bind('<Ctrl-g>', 'leave-mode', mode='insert')
config.bind('<Ctrl-m>', 'enter-mode insert')

# close qutebrowser
config.bind('<Ctrl-x><Ctrl-c>', 'quit') 

# tab management
config.bind('<Ctrl-x>0', 'tab-close')
config.bind('q', 'tab-close')
config.bind('<Ctrl-x>1', 'tab-only')
config.bind('<Alt-a>', 'tab-prev')
config.bind('<Ctrl-c><Ctrl-p>', 'tab-prev')
config.bind('<Alt-e>', 'tab-next')
config.bind('<Ctrl-c><Ctrl-n>', 'tab-next')
config.bind('r', 'reload')
config.bind('c','yank')

# searching
config.bind('<Ctrl-s>', 'set-cmd-text /', mode='normal')
config.bind('<Ctrl-r>', 'set-cmd-text ?', mode='normal')
config.bind('<Ctrl-s>', 'search-next', mode='command')
config.bind('<Ctrl-r>', 'search-prev', mode='command')

# zooming
config.bind('+', 'zoom-in')
config.bind('-', 'zoom-out')

# command mode
config.bind('<Alt-x>', 'set-cmd-text :')
config.bind('<Up>', 'command-history-prev', mode='command')
config.bind('<Ctrl-p>', 'command-history-prev', mode='command')
config.bind('<Down>', 'command-history-next', mode='command')
config.bind('<Ctrl-n>', 'command-history-next', mode='command')
config.bind('<Escape>', 'leave-mode', mode='command')
config.bind('<Ctrl-g>', 'leave-mode', mode='command')
config.bind('<Return>', 'command-accept', mode='command')
config.bind('<Ctrl-m>', 'command-accept', mode='command')
config.bind('<Shift-Tab>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl-Shift-i>', 'completion-item-focus prev', mode='command')
config.bind('<Tab>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-i>', 'completion-item-focus next', mode='command')

# promt mode
config.bind('<Up>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Ctrl-p>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Down>', 'prompt-item-focus next', mode='prompt')
config.bind('<Ctrl-n>', 'prompt-item-focus next', mode='prompt')
config.bind('<Escape>', 'leave-mode', mode='prompt')
config.bind('<Ctrl-g>', 'leave-mode', mode='prompt')
config.bind('<Return>', 'prompt-accept', mode='prompt')
config.bind('<Ctrl-m>', 'prompt-accept', mode='prompt')
config.bind('<Shift-Tab>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Ctrl-Shift-i>', 'prompt-item-focus next', mode='prompt')
config.bind('<Tab>', 'prompt-item-focus next', mode='prompt')
config.bind('<Ctrl-i>', 'prompt-item-focus next', mode='prompt')
config.bind('n', 'prompt-accept no', mode='prompt')
config.bind('y', 'prompt-accept yes', mode='prompt')

# hinting
config.bind('<Ctrl-u>f', 'hint --rapid links tab-bg')
config.bind('f', 'hint')
config.bind('if', 'hint images')
config.bind('cf', 'hint links yank-primary') 
config.bind('<Escape>', 'leave-mode', mode='hint')
config.bind('<Ctrl-g>', 'leave-mode', mode='hint')
config.bind('<Return>', 'follow-hint', mode='hint')
config.bind('<Ctrl-m>', 'follow-hint', mode='hint')

#yesno
config.bind('y','prompt-accept yes',mode='yesno')
config.bind('n','prompt-accept no',mode='yesno')
config.bind('<Alt-w>','prompt-yank',mode='yesno')
config.bind('<Alt-u><Alt-w>','prompt-yank --sel',mode='yesno')
config.bind('<Escape>','leave-mode',mode='yesno')
config.bind('<Ctrl-g>','leave-mode',mode='yesno')
config.bind('<Return>','prompt-accept',mode='yesno')

# mpv
config.bind('<Ctrl-v>', 'spawn mpv {url}')
config.bind('<Ctrl-Shift-v>', 'hint links spawn mpv {hint-url}')

