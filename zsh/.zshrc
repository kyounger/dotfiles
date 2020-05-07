# zmodload zsh/zprof

# TODO: add a global update function: https://github.com/jedahan/dotfiles/blob/master/.zshrc

#####################################################################
# environment
#####################################################################

export EDITOR=vim
export LANG=en_US.UTF-8
export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS'
export KEYTIMEOUT=10
export GOPATH="${HOME}/go"
export GOROOT="${HOME}/.go"
export TMUX_PLUGIN_MANAGER_PATH="${HOME}/.tmux/plugins"

MY_BREW_PREFIX=/usr/local

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
  $GOPATH/bin
  $MY_BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
  ${KREW_ROOT:-$HOME/.krew}/bin
  /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
  $path
)

autoload -Uz bracketed-paste-url-magic && zle -N bracketed-paste bracketed-paste-url-magic

PS1="READY > "

vim-mode-plugin-bindkey-callback() {
    vim-mode-bindkey viins       -- beginning-of-line                  Home
    vim-mode-bindkey viins       -- end-of-line                        End
    vim-mode-bindkey viins       -- backward-word                      Ctrl-Left
    vim-mode-bindkey viins       -- backward-word                      Alt-Left
    vim-mode-bindkey viins       -- forward-word                       Ctrl-Right
    vim-mode-bindkey viins       -- forward-word                       Alt-Right
    vim-mode-bindkey viins       -- delete-char                        Delete
    vim-mode-bindkey viins       -- reverse-menu-complete              Shift-Tab
    vim-mode-bindkey       vicmd -- redo                               '^R'
    vim-mode-bindkey       vicmd -- edit-command-line                  '^V'
    vim-mode-bindkey viins vicmd -- history-beginning-search-backward   Up
    vim-mode-bindkey viins vicmd -- history-beginning-search-forward    Down

    if [[ -n $HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND ]]; then
        vim-mode-bindkey viins vicmd -- history-substring-search-up         Up
        vim-mode-bindkey viins vicmd -- history-substring-search-down       Down
    else
        vim-mode-bindkey viins vicmd -- history-beginning-search-backward   Up
        vim-mode-bindkey viins vicmd -- history-beginning-search-forward    Down
    fi
}
#####################################################################
# zinit sourcing
#####################################################################

# to debug zinit:
# typeset -g ZPLG_MOD_DEBUG=1

source ~/.zinit/bin/zinit.zsh

# zsh theme config
function bar() { echo -n "|" }
function rparen() { echo -n ")" }
function lparen() { echo -n "(" }

GEOMETRY_INFO=""
GEOMETRY_PROMPT=(geometry_echo geometry_status geometry_jobs geometry_path)
GEOMETRY_RPROMPT=(geometry_exec_time geometry_git geometry_kube_symbol geometry_kube_context geometry_kube_namespace)
GEOMETRY_EXEC_TIME_PATIENCE=3
GEOMETRY_KUBE_VERSION_COLOR=red
GEOMETRY_KUBE_NAMESPACE_COLOR=green
GEOMETRY_KUBE_CONTEXT_COLOR=cyan

zinit ice lucid ver"main"
zinit load /Users/kyounger/code/geometry

zinit ice lucid
zinit load kyounger/git-extra-commands

zinit ice lucid blockf
zinit load zsh-users/zsh-completions

zinit ice as"completion"
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zinit ice as"completion"
zinit snippet https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose

zinit ice blockf if'[[ "$OSTYPE" = *darwin* ]]'
zinit snippet $MY_BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

zinit ice lucid as"command" from"gh-r"
zinit load junegunn/fzf-bin

zinit ice lucid from"gh-r" as"program" bpick"kind-darwin-amd64" mv"kind-darwin-amd64 -> kind"
zinit load kubernetes-sigs/kind

zinit ice lucid from"gh-r" as"program" bpick"kapp-darwin-amd64" mv"kapp-darwin-amd64 -> kapp"
zinit load k14s/kapp

zinit ice lucid from"gh-r" as"program" bpick"k3sup-darwin" mv"k3sup-darwin -> k3sup"
zinit load alexellis/k3sup

zinit ice lucid from"gh-r" as"program" bpick"*darwin*" mv"*-darwin-amd64 -> yamldiff"
zinit load sahilm/yamldiff

zinit ice lucid from"gh-r" as"program" bpick"*darwin*" ver"v2.0.881"
zinit load jenkins-x/jx

zinit ice as"program" cp"bin/g -> bin/gvm" pick"bin/gvm"
zinit load stefanmaric/g

zinit ice lucid #atload"_zsh_autosuggest_start" wrap-track"_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions

zinit ice lucid #atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit load zsh-users/zsh-syntax-highlighting

zinit ice lucid #atload"history-substring-plugin-bindkey-callback"
zinit load zsh-users/zsh-history-substring-search

MODE_CURSOR_VICMD="green block"
MODE_CURSOR_VIINS="#20d08a blinking bar"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
zinit ice lucid atload"vim-mode-plugin-bindkey-callback"
zinit load kyounger/zsh-vim-mode

autoload -Uz compinit
compinit
zinit cdreplay -q

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
setopt hist_find_no_dups         # Do not display a previously found event.

setopt hist_ignore_space         # Do not record an event starting with a space.
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
# unsetopt CLOBBER            # Do not overwrite existing files with > and >>.

#globbing and completion
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
setopt EXTENDED_GLOB       # Needed for file modification glob modifiers with compinit
setopt GLOBDOTS            # I like to see my dots
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.
unsetopt CASE_GLOB

#####################################################################
# misc
#####################################################################

# brew file options and wrapper sourcing
export HOMEBREW_BREWFILE_APPSTORE=0
export HOMEBREW_BREWFILE=~/.dotfiles/brewfile/Brewfile
if [[ "$OSTYPE" = *darwin* ]]; then
    if [ -f $MY_BREW_PREFIX/etc/brew-wrap ]; then
        source $MY_BREW_PREFIX/etc/brew-wrap
    fi
fi

# jenv
if [[ "$OSTYPE" = *Darwin* ]]; then
    export JENV_ROOT=$MY_BREW_PREFIX/opt/jenv
    if which jenv > /dev/null; then eval "$(jenv init -)"; fi
fi

VIMPLUG=~/.local/share/nvim/site/autoload/plug.vim
if ! [[ -a $VIMPLUG ]]; then
    echo "vim-plug not installed for neovim; downloading..."
    curl -sfLo $VIMPLUG --create-dirs https://raw.githubusercontent.com/kyounger/vim-plug/master/plug.vim
fi


#####################################################################
# aliases
#####################################################################

source "${HOME}/.dotfiles/zsh/aliases.zsh"

#####################################################################
# My completion styles
#####################################################################

source "${HOME}/.dotfiles/zsh/completion-zstyles.zsh"

#####################################################################
# local env vars
#####################################################################
source "${HOME}/.local/.localrc"


