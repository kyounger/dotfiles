# Common settings across different shells (bash/zsh)

if ! command -v nvim &> /dev/null; then
  export EDITOR=vim
else
  export EDITOR=nvim
fi
export VISUAL="$EDITOR"
alias vi=$EDITOR

{{ if eq .os "darwin" -}}
#default for x86_64 architectures on mac
export HOMEBREW_PREFIX="/usr/local";

#override with proper homebrew prefix for m1 macs
if [[ "$(uname -m)" == "arm64" ]]; then
export HOMEBREW_PREFIX="/opt/homebrew";
fi

export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar";
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew";

export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin${PATH+:$PATH}";
export PATH="${KREW_ROOT:-$HOME/.krew}/bin${PATH+:$PATH}";
export PATH="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin${PATH+:$PATH}";
export PATH="${HOME}/bin${PATH+:$PATH}";
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"

export MANPATH="${HOMEBREW_PREFIX}/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}";
export FPATH="${HOMEBREW_PREFIX}/share/zsh/site-functions:${FPATH}"

export AQUA_GLOBAL_CONFIG=${XDG_CONFIG_HOME:-$HOME/.config}/aquaproj-aqua/aqua.yaml

export HOMEBREW_BREWFILE_APPSTORE=0
{{ end -}}


export LANG=en_US.UTF-8

# Terminal color
export CLICOLOR=1
export COLORTERM=truecolor
export LSCOLORS=DxfxcxdxbxGxDxabagacad
export LS_COLORS='di=93:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
if [[ "$(uname)" == "Darwin" ]]; then
  # If using native BSD utils
  #alias ls='ls -G'
  # If installed "coreutils" with homebrew,
  # and added
  # export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  # to ~/.bashrc_local per advice after installation
  alias ls='ls --color'
elif [[ "$(uname)" == "Linux" ]]; then
  alias ls='ls --color'
fi

export PAGER="less -RF"
export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS'

# less color
export LESS_TERMCAP_mb=$'\E[01;31m'    # begin blink
export LESS_TERMCAP_md=$'\E[01;33m'    # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[01;04;32m' # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
# and so on

# man
export MANPAGER='less -s -M +Gg'

#ripgrep global config
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/.ripgreprc

#use newest approach for auth in kubectl for gke
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

#My aliases
{{ template "aliases.sh" }}

alias sudo='sudo '
alias cm="chezmoi"

