# Lasagna's wasted time and effort
You, a normal person:
"Nooooo you can't spend all your free time on ricing every pointless thing on your laptop!"

Me, enlightened by the Way Of The Vim, Master of the Tile and Hater of the Rodent:
"AHAHAHAHA COLORFUL LINUX GO BRRRRR"

## Dependencies

    +Awesome, git version possibly
    +picom
    +feh
    +rofi
    +kitty
    +interception-tools
    +interception-dual-function-keys
    +firefox
    +neovim (<=0.7)
    +ranger
    +tmux (?)
    +fira code font (or another monospace font)
    +adobe-source-han-sans-otc-fonts
    +symbol-only nerd fonts (or equivalent) 
    +xbacklight or equivalent
    +pipewire, with compatibility packages for alsa, jack and pulseaudio (important)

There will be others, the list is incomplete, deal with it for the time being. If you get an error... Well, that's what you get in early access.
    
<!-- ## Interception and Dual Function Keys
Configure /etc/interception/dual-function-keys/modifiers.yaml as:

    TIMING:
      TAP_MILLISEC: 200
      DOUBLE_TAP_MILLISEC: 150
      SYNTHETIC_KEYS_PAUSE_MILLISEC: 10

    MAPPINGS:
      - KEY: KEY_TAB
        TAP: KEY_TAB
        HOLD: KEY_LEFTMETA
        HOLD_START: BEFORE_CONSUME_OR_RELEASE
      - KEY: KEY_CAPSLOCK
        TAP: KEY_CAPSLOCK
        HOLD: KEY_LEFTCTRL
        HOLD_START: BEFORE_CONSUME_OR_RELEASE
      - KEY: KEY_LEFTALT
        TAP: KEY_ESC
        HOLD: KEY_LEFTALT
        HOLD_START: BEFORE_CONSUME_OR_RELEASE
      - KEY: KEY_LEFTSHIFT
        TAP: [KEY_LEFTSHIFT, KEY_9]
        HOLD: KEY_LEFTSHIFT
        HOLD_START: BEFORE_CONSUME_OR_RELEASE
      - KEY: KEY_RIGHTSHIFT
        TAP: [KEY_RIGHTSHIFT, KEY_0]
        HOLD: KEY_RIGHTSHIFT
        HOLD_START: BEFORE_CONSUME_OR_RELEASE
      - KEY: KEY_BACKSLASH
        TAP: KEY_BACKSLASH
        HOLD: KEY_LEFTMETA
        HOLD_START: BEFORE_CONSUME_OR_RELEASE


and /etc/interception/udevmon.d/keyboard.yaml as:

    - JOB: "intercept -g $DEVNODE | dual-function-keys -c /etc/interception/dual-function-keys/modifiers.yaml | uinput -d $DEVNODE"
      DEVICE:
        EVENTS:
          EV_KEY: [KEY_CAPSLOCK, KEY_TAB, KEY_LEFTALT, KEY_LEFTSHIFT, KEY_RIGHTSHIFT, KEY_BACKSLASH, KEY_SPACE]

in case of doubt, consult the gitlab page of interception. -->
