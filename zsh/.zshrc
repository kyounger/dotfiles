# zmodload zsh/zprof


#####################################################################
# environment
#####################################################################

export EDITOR=vim
export LANG=en_US.UTF-8
export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS'
export KEYTIMEOUT=30

umask 022

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"       # The path to the history file.
HISTSIZE=290000                   # The maximum number of events to save in the internal history.
SAVEHIST=290000                   # The maximum number of events to save in the history file.

# Define ls colors
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LSCOLORS='DxfxcxdxbxGxDxabagacad'
# Define ls colors for the completion system
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
export LS_COLORS='di=93:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# Set the list of directories that Zsh searches for programs.
path=(
  ~/bin
  ~/.fastlane/bin
  /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
  $path
)

autoload -Uz bracketed-paste-url-magic && zle -N bracketed-paste bracketed-paste-url-magic

#####################################################################
# setopts
#####################################################################

setopt IGNORE_EOF
setopt CORRECT
setopt MULTIOS              # Write to multiple descriptors.

# history options
setopt bang_hist                 # Treat the '!' character specially during expansion.
setopt extended_history          # Write the history file in the ':start:elapsed;command' format.
setopt inc_append_history        # Write to the history file immediately, not when the shell exits.
setopt share_history             # Share history between all sessions.
setopt hist_expire_dups_first    # Expire a duplicate event first when trimming history.
setopt hist_ignore_dups          # Do not record an event that was just recorded again.
setopt hist_ignore_all_dups      # Delete an old recorded event if a new event is a duplicate.
setopt hist_find_no_dups         # Do not display a previously found event.
setopt hist_ignore_space         # Do not record an event starting with a space.
setopt hist_save_no_dups         # Do not write a duplicate event to the history file.
setopt hist_verify               # Do not execute immediately upon history expansion.
setopt hist_beep                 # Beep when accessing non-existent history.

# directory options
setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>.

#globbing and completion
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
setopt EXTENDED_GLOB       # Needed for file modification glob modifiers with compinit
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.
unsetopt CASE_GLOB


#####################################################################
# zplugin
#####################################################################

source ~/.zplugin/bin/zplugin.zsh

turbo0()   { zplugin ice wait"0a" lucid             "${@}"; }
turbo1()   { zplugin ice wait"0b" lucid             "${@}"; }
turbo2()   { zplugin ice wait"0c" lucid             "${@}"; }
zcommand() { zplugin ice wait"0b" lucid as"command" "${@}"; }
zload()    { zplugin load                           "${@}"; }
zsnippet() { zplugin snippet                        "${@}"; }


# show time after long commands
zplugin ice lucid
zload "popstas/zsh-command-time"

# my custom vim-mode
zplugin ice lucid
zsnippet "${HOME}/.dotfiles/zsh/zsh-vim-mode.zsh"

# history searching
zplugin ice lucid
zload "zsh-users/zsh-history-substring-search"

# autosuggest
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
zplugin ice lucid atload"_zsh_autosuggest_start"
zload zsh-users/zsh-autosuggestions

# completion stuff
zplugin ice lucid blockf
zload zsh-users/zsh-completions

zplugin ice lucid
zsnippet "${HOME}/.dotfiles/zsh/completion-zstyles.zsh"

zplugin ice as"completion"
zplugin snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zplugin ice as"completion"
zplugin snippet https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose

# if [[ "$(uname)" == "Darwin" ]]; then
#     source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
#     source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
# fi

# Syntax highlighting
# (compinit without `-i` spawns warning on `sudo -s`)
zplugin ice wait"0a" lucid atinit"ZPLGM[COMPINIT_OPTS]='-i' zpcompinit; zpcdreplay"
zload zdharma/fast-syntax-highlighting

# z and fzf
zcommand from"gh-r"
zload junegunn/fzf-bin

zcommand pick"bin/fzf-tmux"
zload junegunn/fzf

# Create and bind multiple widgets using fzf
zplugin ice lucid multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
zload junegunn/fzf

# autojump command
zplugin ice lucid atclone"touch '${HOME}/.z'"
zload rupa/z

# Pick from most frecent folders with `Ctrl+g`
zplugin ice lucid
zload andrewferrier/fzf-z

# lets z+[Tab] and zz+[Tab]
zplugin ice lucid
zload changyuheng/fz

# the theme I use
export GEOMETRY_PROMPT_PREFIX=
zplugin ice lucid
zload geometry-zsh/geometry

# nvm
export NVM_LAZY_LOAD=true
zplugin ice lucid
zload "lukechilds/zsh-nvm"

# my aliases
zplugin ice lucid
zsnippet "${HOME}/.dotfiles/zsh/aliases.zsh"


autoload -Uz compinit
compinit

zplugin cdreplay -q

#####################################################################
# misc
#####################################################################

# brew file options and wrapper sourcing
export HOMEBREW_BREWFILE_APPSTORE=0
export HOMEBREW_BREWFILE=~/.dotfiles/brewfile/Brewfile
if [[ "$(uname)" == "Darwin" ]]; then
    if [ -f $(brew --prefix)/etc/brew-wrap ]; then
        source $(brew --prefix)/etc/brew-wrap
    fi
fi

# jenv
if [[ "$(uname)" == "Darwin" ]]; then
    export JENV_ROOT=/usr/local/opt/jenv
    if which jenv > /dev/null; then eval "$(jenv init -)"; fi
fi

