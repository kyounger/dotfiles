# Beep on error in line editor.
setopt BEEP

# Use human-friendly identifiers.
zmodload zsh/terminfo
typeset -gA key_info
key_info=(
  'Control'         '\C-'
  'ControlLeft'     '\e[1;5D \e[5D \e\e[D \eOd'
  'ControlRight'    '\e[1;5C \e[5C \e\e[C \eOc'
  'ControlPageUp'   '\e[5;5~'
  'ControlPageDown' '\e[6;5~'
  'Escape'       '\e'
  'Meta'         '\M-'
  'Backspace'    "^?"
  'Delete'       "^[[3~"
  'F1'           "$terminfo[kf1]"
  'F2'           "$terminfo[kf2]"
  'F3'           "$terminfo[kf3]"
  'F4'           "$terminfo[kf4]"
  'F5'           "$terminfo[kf5]"
  'F6'           "$terminfo[kf6]"
  'F7'           "$terminfo[kf7]"
  'F8'           "$terminfo[kf8]"
  'F9'           "$terminfo[kf9]"
  'F10'          "$terminfo[kf10]"
  'F11'          "$terminfo[kf11]"
  'F12'          "$terminfo[kf12]"
  'Insert'       "$terminfo[kich1]"
  'Home'         "$terminfo[khome]"
  'PageUp'       "$terminfo[kpp]"
  'End'          "$terminfo[kend]"
  'PageDown'     "$terminfo[knp]"
  'Up'           "$terminfo[kcuu1]"
  'Left'         "$terminfo[kcub1]"
  'Down'         "$terminfo[kcud1]"
  'Right'        "$terminfo[kcuf1]"
  'BackTab'      "$terminfo[kcbt]"
)

# Set empty $key_info values to an invalid UTF-8 sequence to induce silent bindkey failure.
for key in "${(k)key_info[@]}"; do
  if [[ -z "$key_info[$key]" ]]; then
    key_info[$key]='�'
  fi
done

#
# Allow command line editing in an external editor.
#
autoload -Uz edit-command-line
zle -N edit-command-line

#
# Functions
#

# Enables terminal application mode and updates editor information.
function zle-line-init {
  # The terminal must be in application mode when ZLE is active for $terminfo
  # values to be valid.
  if (( $+terminfo[smkx] )); then
    # Enable terminal application mode.
    echoti smkx
  fi
}
zle -N zle-line-init

# Displays an indicator when completing.
function expand-or-complete-with-indicator {
  local indicator

  # This is included to work around a bug in zsh which shows up when interacting
  # with multi-line prompts.
  if [[ -z "$indicator" ]]; then
    zle expand-or-complete
    return
  fi

  print -Pn "$indicator"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-indicator

# Inserts 'sudo ' at the beginning of the line.
function prepend-sudo {
  if [[ "$BUFFER" != su(do|)\ * ]]; then
    BUFFER="sudo $BUFFER"
    (( CURSOR += 5 ))
  fi
}
zle -N prepend-sudo

# Expand aliases
function glob-alias {
  zle _expand_alias
  zle expand-word
  zle magic-space
}
zle -N glob-alias


#
# This next section seems to be what works to enable proper cursors for viins and vicmd
#
export KEYTIMEOUT=1

function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select

# Use beam shape cursor for each new prompt.
_fix_cursor() {
   echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)



#
# Vim Key Bindings
#

# First, reset to default key bindings.
bindkey -d

# Unbound keys in vicmd and viins mode will cause really odd things to happen
# such as the casing of all the characters you have typed changing or other
# undefined things. In emacs mode they just insert a tilde, but bind these keys
# in the main keymap to a noop op so if there is no keybind in the users mode
# it will fall back and do nothing.
function _prezto-zle-noop {  ; }
zle -N _prezto-zle-noop
local -a unbound_keys
unbound_keys=(
  "${key_info[F1]}"
  "${key_info[F2]}"
  "${key_info[F3]}"
  "${key_info[F4]}"
  "${key_info[F5]}"
  "${key_info[F6]}"
  "${key_info[F7]}"
  "${key_info[F8]}"
  "${key_info[F9]}"
  "${key_info[F10]}"
  "${key_info[F11]}"
  "${key_info[F12]}"
  "${key_info[PageUp]}"
  "${key_info[PageDown]}"
  "${key_info[ControlPageUp]}"
  "${key_info[ControlPageDown]}"
)
for unbound_key in $unbound_keys; do
  bindkey -M viins "${unbound_key}" _prezto-zle-noop
  bindkey -M vicmd "${unbound_key}" _prezto-zle-noop
done

#also noop delete key in vicmd
bindkey -M vicmd "${key_info[Delete]}" _prezto-zle-noop


#
# The meat of it.
#
bindkey -M vicmd "?" history-incremental-pattern-search-backward
bindkey -M vicmd "/" history-incremental-pattern-search-forward
bindkey -M vicmd "u" undo
bindkey -M vicmd "$key_info[Control]R" redo
bindkey -M vicmd "$key_info[Control]V" edit-command-line

bindkey -M viins "$key_info[Home]" beginning-of-line
bindkey -M viins "$key_info[End]" end-of-line
bindkey -M viins "$key_info[ControlRight]" vi-forward-word
bindkey -M viins "$key_info[ControlLeft]" vi-backward-word
bindkey -M viins "$key_info[Delete]" delete-char
bindkey -M viins "$key_info[Backspace]" backward-delete-char
bindkey -M viins "$key_info[Left]" backward-char
bindkey -M viins "$key_info[Right]" forward-char
bindkey -M viins ' ' magic-space # Expand history on space.
bindkey -M viins "$key_info[BackTab]" reverse-menu-complete # Bind Shift + Tab to go to the previous menu item.
bindkey -M viins "$key_info[Control]L" clear-screen # Clear screen.
bindkey -M viins "$key_info[Control] " glob-alias # control-space expands all aliases, including global
bindkey -M viins "$key_info[Control]I" expand-or-complete-with-indicator # Display an indicator when completing.

# use Ctrl+n to save me some keystrokes for typing this monstrosity. Hacky, but hey it works.
function add-kubectl-all-namespaces-but-kube-system() {
    BUFFER+="--all-namespaces --field-selector=metadata.namespace!=kube-system"
}
zle -N add-kubectl-all-namespaces-but-kube-system
bindkey -M viins "$key_info[Control]N" add-kubectl-all-namespaces-but-kube-system

#
# As you wish.
#
bindkey -v

