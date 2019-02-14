# zmodload zsh/zprof



#####################################################################
# zplug
#####################################################################

# because homebrew
    export ZPLUG_HOME=/usr/local/opt/zplug
    source $ZPLUG_HOME/init.zsh
    zstyle ':completion:*' cache-path ~/$XDG_CACHE_HOME

# just plain useful and not very intrusive
    zplug "popstas/zsh-command-time"

# some basics
    zplug "sorin-ionescu/prezto", use:"modules/helper/init.zsh"
    zplug "sorin-ionescu/prezto", use:"modules/editor/init.zsh"
    zplug "sorin-ionescu/prezto", use:"modules/history/init.zsh"
    zplug "zsh-users/zsh-history-substring-search", defer:3

# completion and highlighting stuff
    zplug "kyounger/prezto", use:"modules/completion/init.zsh"
    zplug "docker/cli", use:contrib/completion/zsh
    zplug "docker/compose", use:contrib/completion/zsh
    zplug "zsh-users/zsh-syntax-highlighting", defer:2

# z and fzf
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, use:"*${(L)$(uname -s)}*amd64*"
    zplug "junegunn/fzf", use:"shell/*.zsh", as:plugin

    export _Z_CMD=j
    export _Z_DATA=$XDG_CACHE_HOME/.z
    zplug "rupa/z", use:z.sh
    #maybe switch to this one day: https://github.com/knu/z
    zplug "andrewferrier/fzf-z"

# the theme I use
    export GEOMETRY_PROMPT_PREFIX=
    zplug "geometry-zsh/geometry"

# nvm
    export NVM_LAZY_LOAD=true
    zplug "lukechilds/zsh-nvm"

# my aliases
    zplug "~/.dotfiles/zsh/", from:local, use:"aliases.zsh", defer:1

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

setopt IGNORE_EOF
setopt CORRECT

# Disable correction.
alias ack='nocorrect ack'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias ebuild='nocorrect ebuild'
alias gcc='nocorrect gcc'
alias gist='nocorrect gist'
alias grep='nocorrect grep'
alias heroku='nocorrect heroku'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias rm='nocorrect rm'

# Disable globbing.
alias bower='noglob bower'
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'
alias history='noglob history'
alias locate='noglob locate'
alias rake='noglob rake'
alias rsync='noglob rsync'
alias scp='noglob scp'
alias sftp='noglob sftp'

autoload -Uz bracketed-paste-url-magic && zle -N bracketed-paste bracketed-paste-url-magic

# improved less option
export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS'


#####################################################################
# vim-mode stuff
#####################################################################
bindkey -v #duh
bindkey -M vicmd "^v" edit-command-line
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
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

# use Ctrl+n to save me some keystrokes for typing this monstrosity
add-kubectl-all-namespaces-but-kube-system() {
    BUFFER+="--all-namespaces --field-selector=metadata.namespace!=kube-system"
}
zle -N add-kubectl-all-namespaces-but-kube-system
bindkey -M viins "^n" add-kubectl-all-namespaces-but-kube-system


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
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down
autoload edit-command-line; zle -N edit-command-line

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

#override prezto completion module on this setting
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack
zstyle ':completion:*:*:git:*' user-commands checkoutpullrequest:'checkout a github pull request by its ID'
zstyle ':completion:*:*:git:*' user-commands ${${(M)${(k)commands}:#git-*}/git-/}

#####################################################################
# brew file wrapper
#####################################################################

export HOMEBREW_BREWFILE_APPSTORE=0

if [[ "$(uname)" == "Darwin" ]]; then
    if [ -f $(brew --prefix)/etc/brew-wrap ]; then
        source $(brew --prefix)/etc/brew-wrap
    fi

    export JENV_ROOT=/usr/local/opt/jenv
    if which jenv > /dev/null; then eval "$(jenv init -)"; fi

    source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
    source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

fi

#####################################################################
# nvm auto version
#####################################################################

# place this after nvm initialization!
 # autoload -U add-zsh-hook
# load-nvmrc() {
#   if [[ -f .nvmrc && -r .nvmrc ]]; then
#     nvm use
#   elif [[ $(nvm version) != $(nvm version default)  ]]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

#####################################################################
# TODO:
#####################################################################
#
# Look into: https://github.com/bhilburn/powerlevel9k
#
