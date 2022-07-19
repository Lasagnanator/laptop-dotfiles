# Laptop's .dotfiles
Dotfiles from my Linux installations

# Dependencies

    +bspwm
    +sxhkd
    +polybar
    +picom
    +feh
    +rofi
    +kitty
    +firefox
    +vim/neovim
    +ranger
    +tmux (?)
    +noto fonts
    +zsh (?)
    
# Interception and Dual Function Keys
Install interception-tools and interception-dual-function-keys (pacman), then configure /etc/interception/dual-function-keys/modifiers.yaml with this code:

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
      - KEY: KEY_LEFTCTRL
        TAP: KEY_ESC
        HOLD: KEY_LEFTCTRL
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

and configure /etc/interception/udevmon.d/keyboard.yaml with this:

    -JOB: "intercept -g $DEVNODE | dual-function-keys -c /etc/interception/dual-function-keys/modifiers.yaml | uinput -d $DEVNODE"
      DEVICE:
        NAME: "NAMEOFDEVICE"
        EVENTS:
          EV_KEY: [KEY_CAPSLOCK, KEY_TAB, KEY_LEFTCTRL, KEY_LEFTSHIFT, KEY_RIGHTSHIFT, KEY_BACKSLASH]

where NAMEOFDEVICE can be obtained with
    
    sudo uinput -p -d /dev/input/by-id/NAMEOFDEVICE

in case of doubt, consult the gitlab page of interception.
