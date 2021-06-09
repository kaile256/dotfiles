#!/usr/bin/env xkeysnail

# -*- coding: utf-8 -*-

# Ref: Script sample
#   https://hidakatsuya.hateblo.jp/entry/2019/11/20/215608

import re
from xkeysnail.transform import (
    define_timeout,  # Timeout for multipurpose (seconds=1)

    # For any keys
    K,  # For ordinary keymaps
    define_keymap,

    # Only for modmaps
    Key,  # For modkeys like CapsLock, Ctrl, etc.
    define_modmap,
    define_multipurpose_modmap,  # The first value in List for solo; second for comibination.
    define_conditional_modmap,  # Set condition for each class or something else.
    define_conditional_multipurpose_modmap,
)

# define_multipurpose_modmap({
#     # Capslock is escape when pressed and released. Control when held down.
#     Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
#
#     # SandS
#     Key.SPACE: [Key.SPACE, Key.LEFT_SHIFT],
# })

# define_keymap(
#     None,
#     {
#         K('capslock'): K('backslash'),
#         K('LShift-capslock'): K('LShift-backslash'),
#
#         # # Send CapsLock
#         # K('backslash'): K('capslock'),
#         # K('LShift-backslash'): K('capslock'),
#     },
#     "CapsLock <-> Backslash")

define_keymap(
    not re.compile(r'nvim|qutebrowser'),
    {
        K("C-m"): K("enter"),
        K("C-j"): K("enter"),

        # Backspace
        K("C-h"): K("backspace"),
        K("C-w"): [K("C-Shift-left"), K("backspace")],
        K("C-u"): [K("Shift-home"), K("backspace")],

        # Delete
        K("C-d"): K("delete"),
        K("C-w"): [K("C-Shift-right"), K("delete")],
        K("C-u"): [K("Shift-end"), K("delete")],
    },
    "Equivalent keys (Overwritten on Fcitx)")

# define_keymap(
#     None,
#     {
#         K("Backspace"): K("Backslash"),
#         K("Delete"): K("Backslash"),
#         # "|" as Shift-Backslash
#         K("Shift-Backspace"): K("Shift-Backslash"),
#         K("Shift-Delete"): K("Shift-Backslash"),
#     },
#     "BS/Del to Backslash/Bar on default HHKB")
# define_keymap(
#     None, {
#         K("Esc"): K("Grave"),
#         K("Shift-Esc"): K("Shift-Grave"),
#         K("C-Left_Brace"): K("Esc"),
#     }, "Esc to Grave/Tilde for default HHKB")

# # RK61 {{{1
# define_modmap({
#     Key.DOWN: Key.RIGHT_ALT,
#     Key.LEFT: Key.RIGHT_ALT,
#     Key.RIGHT: Key.RIGHT_CTRL,
# })
#
# define_keymap(None, {
#     K('Up'): K('Slash'),
#     K('Shift-Up'): K('Shift-Slash'),
# }, "Slash<->Up for RK61")
