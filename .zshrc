#####################################################################
# init
#####################################################################

# zmodload zsh/zprof

if [ ! -f ~/.zshrc.zwc -o ~/.zshrc -nt ~/.zshrc.zwc ]; then
    zcompile ~/.zshrc
fi


#####################################################################
# zplug
#####################################################################

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "kyounger/prezto", use:"modules/editor/init.zsh"
zplug "kyounger/prezto", use:"modules/history/init.zsh"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "rimraf/k"
zplug "lukechilds/zsh-nvm"

# zplug "zsh-users/zsh-completions"
zplug "kyounger/prezto", use:"modules/completion/init.zsh"

zplug "modules/helper", from:prezto
zplug "modules/prompt", from:prezto
zstyle ':prezto:module:prompt' theme 'sorin'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load


#####################################################################
# environment
#####################################################################

export EDITOR=vim
export LANG=en_US.UTF-8

# Better umask
umask 022

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Set the list of directories that Zsh searches for programs.
path=(
  ~/bin
  $path
)

if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi

source ~/.dotfiles/system/aliases.zsh

setopt IGNORE_EOF


#####################################################################
# history options
#####################################################################

HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"       # The path to the history file.
HISTSIZE=10000                   # The maximum number of events to save in the internal history.
SAVEHIST=50000                   # The maximum number of events to save in the history file.

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.

#####################################################################
# directory options
#####################################################################

setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>.

#####################################################################
# brew file wrapper
#####################################################################

if [[ "$(uname)" == "Darwin" ]]; then
    if [ -f $(brew --prefix)/etc/brew-wrap ]; then
        source $(brew --prefix)/etc/brew-wrap
    fi
fi

