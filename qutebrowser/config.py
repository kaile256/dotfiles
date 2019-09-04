# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

## Aliases for commands. The keys of the given dictionary are the
## aliases, while the values are the commands they map to.
## Type: Dict
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save', 'so': 'config-source', 'mess': 'messages', 'alias': 'config-dict-add aliases'}

# Load qutebrowser/autoconfig.yml
config.load_autoconfig()

# Name of the session to save by default. If this is set to null, the
# session which was last loaded is saved.
# Type: SessionName
c.session.default_name = 'LastSession.qt'

# Load a restored tab as soon as it takes focus.
# Type: Bool
c.session.lazy_restore = True

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = True

# List of URLs of lists which contain hosts to block.  The file can be
# in one of the following formats:  - An `/etc/hosts`-like file - One
# host per line - A zip-file of any of the above, with either only one
# file, or a file   named `hosts` (with any extension).  It's also
# possible to add a local file or directory via a `file://` URL. In case
# of a directory, all files in the directory are read as adblock lists.
# The file `~/.config/qutebrowser/blocked-hosts` is always read if it
# exists.
# Type: List of Url
c.content.host_blocking.lists = []

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow locally loaded documents to access remote URLs.
# Type: Bool
c.content.local_content_can_access_remote_urls = True

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications', False, 'https://www.reddit.com')

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '~/Downloads'

# Default program used to open downloads. If null, the default internal
# handler is used. Any `{}` in the string will be expanded to the
# filename, else the filename will be appended.
# Type: String
c.downloads.open_dispatcher = None

# Characters used for hint strings.
# Type: UniqueCharString
c.hints.chars = 'abcdefg'

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = False

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# Position of new tabs which are not opened from another tab. See
# `tabs.new_position.stacking` for controlling stacking behavior.
# Type: NewTabPosition
# Valid values:
#   - prev: Before the current tab.
#   - next: After the current tab.
#   - first: At the beginning.
#   - last: At the end.
c.tabs.new_position.unrelated = 'next'

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'ar': 'https://wiki.archlinux.org/?search={}', 'gh': 'http://github.com/search?q={}', 'th': 'https://www.freethesaurus.com/{}', 'tw': 'http://twitter.com/search/{}', 'wk': 'http://en.wikipedia.org/wiki/{}'}

# Font
# Default monospace fonts. Whenever "monospace" is used in a font
# setting, it's replaced with the fonts listed here.
# Type: Font
c.fonts.monospace = '"xos4 Terminus", Terminus, Monospace, "DejaVu Sans Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Courier New", Courier, "Liberation Mono", monospace, Fixed, Consolas, Terminal'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '12pt sf mono'

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = 'bold 12pt sf mono, Icons'

# Font used for the debugging console.
# Type: QtFont
c.fonts.debug_console = '12pt sf mono'

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = '12pt sf mono'

# Font used for the hints.
# Type: Font
c.fonts.hints = 'bold 12pt sf mono'

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = '12pt sf mono'

# Font used for error messages.
# Type: Font
c.fonts.messages.error = '12pt sf mono'

# Font used for info messages.
# Type: Font
c.fonts.messages.info = '12pt sf mono'

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = '12pt sf mono'

# Font used for prompts.
# Type: Font
c.fonts.prompts = '12pt sf mono, noto sans symbols'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '12pt sf mono, noto sans symbols, dejavu sans mono'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = '12pt sf mono, noto sans symbols, dejavu sans mono'

# Font family for standard fonts.
# Type: FontFamily
c.fonts.web.family.standard = 'sf mono, noto sans symbols, dejavu sans mono'

# Font family for fixed fonts.
# Type: FontFamily
c.fonts.web.family.fixed = 'sf mono, noto sans symbols, dejavu sans mono'

# Font family for serif fonts.
# Type: FontFamily
c.fonts.web.family.serif = 'sf mono, noto sans symbols, dejavu sans mono'

# Font family for sans-serif fonts.
# Type: FontFamily
c.fonts.web.family.sans_serif = 'sf mono, noto sans symbols, dejavu sans mono'

# Font family for cursive fonts.
# Type: FontFamily
c.fonts.web.family.cursive = 'sf mono, noto sans symbols, dejavu sans mono'

# Font family for fantasy fonts.
# Type: FontFamily
c.fonts.web.family.fantasy = 'sf mono, noto sans symbols, dejav sans mono'

# Default font size (in pixels) for regular text.
# Type: Int
c.fonts.web.size.default = 15

# Default font size (in pixels) for fixed-pitch text.
# Type: Int
c.fonts.web.size.default_fixed = 12

# Hard minimum font size (in pixels).
# Type: Int
c.fonts.web.size.minimum = 9

c.bindings.commands['prompt'] = {
  '<Ctrl-p>': 'prompt-item-focus prev',
  '<Ctrl-n>': 'prompt-item-focus next',
}

# Normal; with mod-keys
config.bind('<Alt+[>', 'tab-prev')
config.bind('<Alt+]>', 'tab-next')
config.bind('<Alt+b>', 'tab-prev')
config.bind('<Alt+f>', 'tab-next')
config.bind('<Alt+h>', 'tab-prev')
config.bind('<Alt+i>', 'tab-next')
config.bind('<Alt+l>', 'tab-next')
config.bind('<Alt+o>', 'tab-prev')
config.bind('<Alt+p>', 'tab-next')
config.bind('<Ctrl++>', 'zoom-in')
config.bind('<Ctrl+->', 'zoom-out')
config.bind('<Ctrl+2>', 'save')
config.bind('<Ctrl+Space><Ctrl+Space>', 'reload')
config.bind('<Ctrl+c>', 'download-cancel')
config.bind('<Ctrl+h>', 'tab-prev')
config.bind('<Ctrl+i>', 'forward')
config.bind('<Ctrl+l>', 'tab-next')
config.bind('<Ctrl+n>', 'tab-next')
config.bind('<Ctrl+o>', 'back')
config.bind('<Ctrl+p>', 'tab-prev')
config.bind('<Ctrl+q>', 'tab-close')
config.bind('<Ctrl+v>', None)
config.bind('<Ctrl+w>', None)
config.bind('<Ctrl+w><Ctrl+o>', 'window-only')
config.bind('<Ctrl+w><Ctrl+p>', 'tab-pin')
config.bind('<Ctrl+w><Ctrl+t>', 'tab-give')
config.bind('<Ctrl+w>T', 'tab-give')
config.bind('<Ctrl+w>p', 'tab-pin')
config.bind('<Ctrl+x>', None)
# Normal; Simple
config.bind('<Space>2', 'save')
config.bind('<Space><Space>', 'reload')
config.bind('<Space>P', 'open -t {primary}')
config.bind('<Space>Q', 'close')
config.bind('<Space>Z', 'close')
config.bind('<Space>p', 'open {primary}')
config.bind('<Space>q', 'save')
config.bind('<Space>w', 'save')
config.bind('D', None)
config.bind('H', None)
config.bind('J', None)
config.bind('K', None)
config.bind('L', None)
config.bind('P', 'open -t {clipboard}')
config.bind('U', 'undo')
config.bind('V', 'enter-mode caret, drop-selection')
config.bind('a', 'enter-mode insert')
config.bind('d', 'scroll-page 0 +0.5')
config.bind('e', 'edit-url')
config.bind('gf', 'spawn nvim-qt {url}')
config.bind('gi', 'enter-mode insert')
config.bind('i', 'hint inputs --first')
config.bind('mode', 'drop-selection')
config.bind('p', 'open {clipboard}')
config.bind('q', None)
config.bind('qq', 'tab-close')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('yv', 'enter-mode caret')

# Bindings for caret mode
config.bind(':', ':set-cmd-text :', mode='caret')
config.bind('<Ctrl+b>', 'scroll-page 0 -1', mode='caret')
config.bind('<Ctrl+d>', 'scroll-page 0 0.5', mode='caret')
config.bind('<Ctrl+f>', 'scroll-page 0 1', mode='caret')
config.bind('<Ctrl+u>', 'scroll-page 0 -0.5', mode='caret')
config.bind('W', 'move-to-next-char', mode='caret')
config.bind('b', 'move-to-prev-word', mode='caret')
config.bind('i', 'hint inputs --first', mode='caret')
config.bind('w', 'move-to-next-word', mode='caret')

# Bindings for command mode
config.bind('<Alt+e>', 'edit-command', mode='command')
config.bind('<Alt+k>', 'leave-mode', mode='command')
config.bind('<Ctrl+j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl+k>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl+n>', 'command-history-next', mode='command')
config.bind('<Ctrl+p>', 'command-history-prev', mode='command')
config.bind('<Ctrl+r><Ctrl+Space>', 'rl-yank', mode='command')
config.bind('<Ctrl+r><Space>', 'rl-yank', mode='command')

# Bindings for insert mode
config.bind('<Alt+h>', 'leave-mode', mode='insert')
config.bind('<Alt+j>', 'leave-mode', mode='insert')
config.bind('<Alt+k>', 'leave-mode', mode='insert')
config.bind('<Alt+l>', 'leave-mode', mode='insert')
#config.bind('<Ctrl+m>', 'follow-selected', mode='insert')
c.bindings.commands['insert'] = {
  '<ctrl-i>': 'fake-key <TAB>',
  '<alt-o>': 'fake-key <TAB>',
  '<alt-O>': 'fake-key <Shift-TAB>',
  '<ctrl-j>': 'fake-key <Enter>',
  '<ctrl-m>': 'fake-key <Enter>',
  '<alt-i>': 'fake-key <Right>',
  '<ctrl-f>': 'fake-key <Right>',
  '<alt-a>': 'fake-key <Left>',
  '<ctrl-b>': 'fake-key <Left>',
  '<ctrl-a>': 'fake-key <Home>',
  '<ctrl-e>': 'fake-key <End>',
  '<ctrl-n>': 'fake-key <Down>',
  '<ctrl-p>': 'fake-key <Up>',
  '<alt-f>': 'fake-key <Ctrl-Right>',
  '<alt-b>': 'fake-key <Ctrl-Left>',
  '<ctrl-h>': 'fake-key <Backspace>',
  '<ctrl-d>': 'fake-key <Delete>',
  '<alt-d>': 'fake-key <Ctrl-Delete>',
  '<alt-backspace>': 'fake-key <Ctrl-Backspace>',
  '<ctrl-w>': 'fake-key <Ctrl-backspace>',
  '<ctrl-u>': 'fake-key <Ctrl-backspace>',
  '<ctrl-y>': 'insert-text {primary}',
  '<ctrl-r><ctrl-0>': 'insert-text {primary}',
  '<ctrl-r>0': 'insert-text {primary}',
  '<ctrl-r><ctrl-space>': 'insert-text {clipboard}',
  '<ctrl-r><space>': 'insert-text {clipboard}',
}

# Editor (and arguments) to use for the `open-editor` command.
# `{file}`: Filename of the file to be edited.
# `{line}`: Line in which the caret is found in the text.
# `{column}`: Column in which the caret is found in the text.
# `{line0}`: Same as `{line}`, but starting from index 0.
# `{column0}`: Same as `{column}`, but starting from index 0.
# Type: ShellCommand
config.bind('<alt-e>', 'open-editor', mode='insert')
c.editor.command = ['nvim-qt', '{file}']
