#!/usr/bin/env xkeysnail

# -*- coding: utf-8 -*-

# Ref: Script sample
#   https://hidakatsuya.hateblo.jp/entry/2019/11/20/215608

import re
from xkeysnail.transform import (
    # define_timeout,  # timeout for multipurpose (seconds=1)
    # Key, # for modmaps
    # define_modmap,
    # define_multipurpose_modmap,
    # define_conditional_modmap,
    # define_conditional_multipurpose_modmap,
    K,  # for ordinary keymaps
    define_keymap,
)

# define_multipurpose_modmap({
#     # Capslock is escape when pressed and released. Control when held down.
#     Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
#
#     # SandS
#     Key.SPACE: [Key.SPACE, Key.LEFT_SHIFT],
# })

define_keymap(
    None,
    {
        K('capslock'): K('backslash'),
        K('LShift-capslock'): K('LShift-backslash'),

        # # Send CapsLock
        # K('backslash'): K('capslock'),
        # K('LShift-backslash'): K('capslock'),
    },
    "CapsLock <-> Backslash")

define_keymap(
    not re.compile(r'nvim|qutebrowser'),
    {
        K("C-m"): K("enter"),
        K("C-j"): K("enter"),

        # Delete
        K("C-d"): K("delete"),
        K("C-h"): K("backspace"),
        K("C-w"): [K("C-Shift-left"), K("backspace")],
        K("C-u"): [K("Shift-home"), K("backspace")],
    },
    "Equivalent keys (Overwritten on Fcitx)")
