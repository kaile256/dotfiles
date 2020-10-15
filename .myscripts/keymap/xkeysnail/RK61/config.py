#!/usr/bin/env xkeysnail

# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import (
    # define_timeout,  # timeout for multipurpose (seconds=1)
    Key,  # for modmaps
    define_modmap,
    # define_multipurpose_modmap,
    # define_conditional_modmap,
    # define_conditional_multipurpose_modmap,
    K,  # for ordinary keymaps
    define_keymap,
)

define_modmap({
    Key.DOWN: Key.RIGHT_ALT,
    Key.LEFT: Key.RIGHT_ALT,
    Key.RIGHT: Key.RIGHT_CTRL,
})

define_keymap(None, {
    K('up'): K('slash'),
    K('Shift-up'): K('question'),
}, "Slash<->Up for RK61")
