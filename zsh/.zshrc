# zmodload zsh/zprof

# TODO: add a global update function: https://github.com/jedahan/dotfiles/blob/master/.zshrc

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
  $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
  ${KREW_ROOT:-$HOME/.krew}/bin
  ~/.fastlane/bin
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
# zplugin
#####################################################################

source ~/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

GEOMETRY_PROMPT=(geometry_echo geometry_status geometry_jobs geometry_path)
GEOMETRY_RPROMPT=(geometry_git geometry_exec_time geometry_kube)
GEOMETRY_EXEC_TIME_PATIENCE=3
zplugin ice lucid #atload"geometry::prompt"
zplugin load geometry-zsh/geometry

# try adding this eventually:
# https://github.com/unixorn/git-extra-commands

# completion stuff
zplugin ice lucid blockf
zplugin load zsh-users/zsh-completions

# zplugin ice as"completion"
# zplugin snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# zplugin ice as"completion"
# zplugin snippet https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose

# zplugin ice wait"0b" lucid as"command" from"gh-r"
# zplugin load junegunn/fzf-bin

# zplugin ice wait"0b" lucid as"command" pick"bin/fzf-tmux"
# zplugin load junegunn/fzf

# # Create and bind multiple widgets using fzf
# zplugin ice lucid multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
# zplugin load junegunn/fzf

# # autojump command
# zplugin ice lucid atclone"touch '${HOME}/.z'"
# zplugin load rupa/z

# # Pick from most frecent folders with `Ctrl+g`
# zplugin ice lucid
# zplugin load andrewferrier/fzf-z

# # lets z+[Tab] and zz+[Tab]
# zplugin ice lucid
# zplugin load changyuheng/fz

# # nvm
# export NVM_LAZY_LOAD=true
# zplugin ice lucid
# zplugin load "lukechilds/zsh-nvm"

source "${HOME}/.dotfiles/zsh/completion-zstyles.zsh"

# if [[ "$(uname)" == "Darwin" ]]; then
#     source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
# fi

zplugin ice lucid atload"_zsh_autosuggest_start" wrap-track"_zsh_autosuggest_start"
zplugin load zsh-users/zsh-autosuggestions

zplugin ice lucid #atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zplugin load zsh-users/zsh-syntax-highlighting

zplugin ice lucid #atload"history-substring-plugin-bindkey-callback"
zplugin load zsh-users/zsh-history-substring-search

zplugin ice lucid atinit"zpcompinit; zpcdreplay" atload"vim-mode-plugin-bindkey-callback"
zplugin load _local/zsh-vim-mode

zpcompinit
zpcdreplay

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
# my vim-mode
#####################################################################

