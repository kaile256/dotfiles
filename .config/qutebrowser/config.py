# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html
#   /usr/share/qutebrowser/userscripts/README.md

import re
import subprocess

from qutebrowser.api import interceptor

config.load_autoconfig()  # load ./autoconfig.yml


# Youtube adblock (Interrupt the request)
# https://www.reddit.com/r/qutebrowser/comments/hcn2e5/what_are_your_favorite_custom_qutebrowser/
def filter_youtube(info: interceptor.Request):
    """Block request to get Advt."""
    url = info.request_url
    if (url.host() == 'www.youtube.com' and url.path() == '/get_video_info'
            and '&adformat=' in url.query()):
        info.block()


interceptor.register(filter_youtube)

# Hint to yank codes in xml
# https://github.com/LaurenceWarne/qute-code-hint
# Script: $GHQ_ROOT/github.com/LaurenceWarne/qute-code-hint/code_select.py
c.hints.selectors["code"] = [
    # Select all code tags whose direct parent is not a <pre> tag.
    ":not(pre) > code",
    "pre"
]


def should_be_darkmode():
    monitor_sizes_to_darkmode = [
        '1040mm x 590mm',
        '530mm x 300mm',
    ]

    possible_monitors = subprocess.check_output(['xrandr'], text=True)
    pat_monitor_size = '\\d+mm x \\d+mm'

    connected_monitors_sizes = re.findall(pat_monitor_size, possible_monitors)
    for m in connected_monitors_sizes:
        for s in monitor_sizes_to_darkmode:
            is_monitor_size_to_darkmode = re.fullmatch(s, m)
            if is_monitor_size_to_darkmode:
                return True
    return False


SHOULD_BE_DARKMODE = should_be_darkmode()
c.colors.webpage.darkmode.enabled = SHOULD_BE_DARKMODE
# c.colors.webpage.darkmode.grayscale.all = SHOULD_BE_DARKMODE
# c.colors.webpage.prefers_color_scheme_dark = SHOULD_BE_DARKMODE
