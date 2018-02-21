export CLICOLOR=1

alias macmounter-tail-logs='tail -f ~/Library/Application\ Support/macmounter/macmounter.log'
alias macmounter-vim-logs='vim ~/Library/Application\ Support/macmounter/macmounter.log'
alias macmounter-reload='macmounter.py --reload'

alias vi='vim'
alias vp='vim pom.xml'

alias hp='head -20 pom.xml'

#clear ~/temp dir and cd to it
alias temp='rm -rf ~/temp; mkdir ~/temp; cd ~/temp'

# never can remember if it's hf or hl, so use both
alias hf='sudo vim /etc/hosts'
alias hl='sudo vim /etc/hosts'

alias git-grep-all='git branch -a | grep -v "remotes/origin/HEAD" | tr -d \* | xargs git grep'

alias glg='git log --graph --abbrev-commit --decorate --format=format:"%C(green)%h%C(reset) - %C(blue)(%ar)%C(reset) %C(white)%s%C(reset) %C(red)%d%C(reset)" --all'
alias glb='git log --graph --abbrev-commit --decorate --format=format:"%C(green)%h%C(reset) - %C(white)%s%C(reset) %C(reset)%C(red)%d%C(reset)" --all'
alias glbo='git log --graph --abbrev-commit --decorate --format=format:"%C(green)%h%C(reset) - %C(white)%s%C(reset) %C(reset)%C(red)%d%C(reset)" --branches=\*'
alias glgu='git log --graph --abbrev-commit --decorate --format=format:"%C(green)%h%C(reset) - %C(blue)(%ar)%C(reset) %C(white)%s%C(reset) %C(reset)%C(red)%d%C(reset) %C(reset)%C(yellow)<%an>" --all'
alias glbu='git log --graph --abbrev-commit --decorate --format=format:"%C(green)%h%C(reset) - %C(white)%s%C(reset) %C(reset)%C(red)%d%C(reset) %C(reset)%C(yellow)<%an>" --all'
alias glh='git log --abbrev-commit --decorate --format=format:"%C(green)%h%C(reset) - %C(white)%s%C(reset) %C(reset)%C(red)%d %C(reset)%C(magenta)(%cr) %C(reset)%C(yellow)<%an>"'

alias gd='git diff --word-diff-color --word-diff-regex="[^[:space:],]+|[,]+"'
alias gdw='git diff --ignore-all-space --word-diff=color --word-diff-regex="[^[:space:],=]+|[,=]+"'
alias gdws='git diff --ignore-all-space --staged --word-diff=color --word-diff-regex="[^[:space:],=]+|[,=]+"'

alias gcane='git add *; git commit --amend --no-edit'
alias gaa='git add *'
alias gcm='git commit --message'
alias gcam='git commit --all --message'
alias gco='git checkout'
alias gcam='git commit -am'

alias grho='read -q "REPLY?Are you sure you want to hard reset to the origin? "; if [ "y" = "$REPLY" ]; then echo; git reset --hard `git for-each-ref --format="%(upstream:short)" $(git symbolic-ref -q HEAD)`; fi'
alias grmh='git reset --mixed HEAD\^'

alias gbuu='git branch --unset-upstream'
alias gbv='git branch -vv'
alias gbm='git branch --move'
alias gbx='git branch --delete'
alias gbX='git branch --delete --force'
alias grv='git remote -v'

alias gpa='git pull --all'
alias gp='git push'
alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias gpf='echo force push should be typed out fully :\)'

alias gmmx='git merge $1 -Xignore-all-space'

alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias gri5='git rebase -i HEAD~5'
alias gri8='git rebase -i HEAD~8'
alias grim='git rebase -i master'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gC='git clean -dfx -e .idea/ -e *.iml'

alias gsh='git show --word-diff=color --word-diff-regex="[^[:space:],]+|[,]+"'
alias gshns='git show --name-status'

alias gs='git stash'
alias gsp='git stash pop'
alias gsl='git stash list'

alias gst='git status'
alias grep='grep --color=auto'

alias redis-start='redis-server /usr/local/etc/redis.conf'

function clonefhlb() { 
    git clone "https://git.fhlbdm.com/$1/$2.git"
    cd $2
}

function jhome () {
  export JAVA_HOME=`/usr/libexec/java_home -v $@`
  echo "JAVA_HOME:" $JAVA_HOME
  echo "java -version:"
  java -version
}

alias tidal-client='~/Applications/TES\ Java\ Client/tesclient.sh &'


alias mci='mvn clean install'

#function gri() { git rebase -i HEAD\~$1 }

# list files
# alias l='ls -al'
alias l='/usr/local/bin/gls -al --group-directories-first --color=always'
alias lh='ls -ald .*'
alias lsd3='du -sk * | sort -nr | head -3'


# Define ls colors
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LSCOLORS='DxfxcxdxbxGxDxabagacad'
# Define ls colors for the completion system
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
export LS_COLORS='di=93:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# change dir (or make and change)
alias u='cd ..'
alias uu='cd ..; cd ..'
alias uuu='cd ..; cd ..; cd ..'
function mkcd () { mkdir -p "$@" && cd "$@"; }

function d64() { echo $1 | base64 -D }

# other misc
alias ttop='top -U $USER'
alias cwd="pwd | tr -d '\n' | pbcopy"
alias wgetssl='wget --no-check-certificate'
alias secureemptytrash='srm -rs /Users/kenny/.Trash/*'
alias rmdotsvn='find . -name ".svn" -type d -exec rm -rf {} \;'
alias linecount="sed '/^\s*$/d' | wc -l"

alias rsync-tiny-to-manhattan='rsync -a --delete-after --info=progress2 /Volumes/TINY/LR_TINY_IMPORT/ /Volumes/manhattan/LR_TINY_BACKUP'
alias rsync-lrimport-to-manhattan='rsync -a --delete-after --info=progress2 /Users/kenny/Pictures/LR_IMPORT/ /Volumes/manhattan/LR_IMPORT_BACKUP'
alias rsync-manhattan-to-boon='rsync -a --delete-after --info=progress2 /Volumes/manhattan/ boon::boon-manhattan'

# diff two directories
# diff <(cd dir1 && find . | sort) <(cd dir2 && find . | sort)

# where does a 301 point to
function expandurl() { wget -q -U Mozilla/5 -O/dev/null -S $@ 2>&1 | awk '{ if($1~/^Location:/) { print $2 } }'; }

# this is how I start and reattach tmux
function ta() {
    # use this to find out what to set TMPDIR to if ta() wasn't used:
    # `echo /var/folders/**/*/-Tmp-(U/)`
    # then attache with `TMPDIR=$$ tmux attach`

    # unset TMPDIR
    if [[ `tmux list-sessions 2>&1 | grep "^no server running on" -c` -eq 0 ]];
    then
        tmux attach -d
    else
        tmux new-session
    fi
}

# flush osx dns (including dnsmasq)
function flushdns() {
    dscacheutil -flushcache
    sudo kill -HUP `cat /opt/local/var/run/dnsmasq/dnsmasq.pid`
    # sudo port unload dnsmasq
    # sudo port load dnsmasq
}

# get image height/width and copy to clipboard
function gih () { identify -format "%h" "$@" | tr -d '\n' | pbcopy; }
function giw () { identify -format "%w" "$@" | tr -d '\n' | pbcopy; }

# try to extract any archive
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function mkv2mp4() { ffmpeg -i $1 -vcodec copy -acodec copy -absf aac_adtstoasc $1.mp4 }


# nginx
alias nginx_start='sudo nginx'
alias nginx_stop='sudo kill `cat /opt/local/var/run/nginx/nginx.pid`'
alias nginx_test_config='sudo nginx -t'
alias nginx_reload='sudo nginx -s reload'

# php-fpm53
alias fpm53_stop='sudo kill `cat /opt/local/var/run/php53/php-fpm.pid`'
alias fpm53_start='sudo php-fpm53'
alias fpm53_restart='fpm53_stop; fpm53_start'

# php-fpm54
alias fpm54_stop='sudo kill `cat /opt/local/var/run/php54/php-fpm.pid`'
alias fpm54_start='sudo php-fpm54'
alias fpm54_restart='fpm54_stop; fpm54_start'

# mysql
alias mysql_start='sudo /opt/local/share/mysql5/mysql/mysql.server start'
alias mysql_stop='sudo /opt/local/share/mysql5/mysql/mysql.server stop'
alias mysql_restart='mysql_stop; mysql_start'

# apache
alias restart_apache='sudo /opt/local/apache2/bin/apachectl restart'


# remove duplicates from Finder's 'Open With...' context menu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# # wget mirrors a page for local archiving
# function mirror_page() { 
#     wget --adjust-extension --page-requisites --span-hosts --backup-converted --ignore-length --convert-links --no-verbose --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:6.0) Gecko/20100101 Firefox/6.0" --directory-prefix=./ $1 
# }
 
# show my grants in mysql
function mygrants() {
  mysql -B -N $@ -e "SELECT DISTINCT CONCAT('SHOW GRANTS FOR ''', user, '''@''', host, ''';') AS query FROM mysql.user" | mysql $@ | sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/## \1 ##/;/##/{x;p;x;}'
}

# snag an mp3 from youtube and title it properly
function ytmp3() {
    youtube-dl --keep-video --output '%(title)s.%(ext)s' --verbose --format bestaudio --extract-audio --audio-quality 160K --audio-format mp3 --metadata-from-title "%(artist)s - %(title)s" $1
}
function ytmp3-old() {
    youtube-dl -kvt --extract-audio --audio-quality 160k --audio-format mp3 $1
}
function webm-to-mp3() {
    ffmpeg -i "$1" -vn -ab 160k -ar 44100 -y "$1.mp3"
}


# Remove the hosts that I don't want to keep around - in this case, only keep the first host.
alias hosts="head -2 ~/.ssh/known_hosts | tail -1 > ~/.ssh/known_hosts"

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# helper function to build multiline regex with '+' line continuation character (as/400 CL)
function mlregex() {
    if [[ "$#" != "1" ]]; then
        return
    fi

    x="$1"
    len=${#x}
    final=''
    # joiner='\\\\+\\\\s*\\\\n?^\\\\s*'
    joiner='\\+\\s*\\n?^\\s*'

    for ((i = 1; i < $len; i++));
    do
        if [[ $i -ne 1 ]]; then
            final="$final|"
        fi
        final="${final}${x:0:$i}${joiner}${x:$i:$len}"
    done

    echo -n "$final|$x"

    # return $final
}

# change directory to whatever the most recently focused finder window is
function cdf () {
  CURRFOLDERPATH=$( /usr/bin/osascript <<"    EOT"
    tell application "Finder"
      try
          set currFolder to (folder of the front window as alias)
      on error
          set currFolder to (path to desktop folder as alias)
      end try
      POSIX path of currFolder
    end tell
    EOT
  )
  echo "cd to \"$CURRFOLDERPATH\""
  cd "$CURRFOLDERPATH"
}
