#it's happening
alias vim=nvim
alias vi=nvim

alias cat=bat

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
alias gh-create-public-repo='gh repo create kyounger/$(basename $(pwd)) --public'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

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

alias vp='vim pom.xml'
alias hp='head -20 pom.xml'
alias cc='cd ~/code'

#clear ~/temp dir and cd to it
alias temp='rm -rf ~/temp; mkdir ~/temp; cd ~/temp'

alias kc='kubectl'
alias kcg='kubectl get'
alias kcd='kubectl describe'
alias kcl='kubectl logs'
alias kce='kubectl get events -A --sort-by="{.lastTimestamp}"'
alias kx='kubectx'
alias kn='kubens'
function kcga() {
  local current_namespace=$(kubectl config view --minify --output "jsonpath={..namespace}" 2> /dev/null)
  local namespace=${1:-$current_namespace}
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events" | sort | uniq); do
    local content=$(kubectl -n ${namespace} get --ignore-not-found ${i})
    if [[ -n "$content" ]]; then
        echo "\nResource:" $i
        echo $content
    fi
  done
}
function kube-pv-inspect() {
echo 'apiVersion: v1
kind: Pod
metadata:
  name: busybox
spec:
  containers:
  - image: busybox
    name: busybox
    args:
      - sleep
      - "1000000"
    volumeMounts:
    - mountPath: /pv
      name: pv
  volumes:
  - name: pv
    persistentVolumeClaim:
      claimName: XXXXX
  restartPolicy: Never' | sed "s/XXXXX/${1}/g" | kubectl apply -f -

kubectl wait --for=condition=Ready pod/busybox
kubectl exec -it busybox -- sh
}

function kube-busybox() {
echo 'apiVersion: v1
kind: Pod
metadata:
  name: busybox
spec:
  containers:
  - image: busybox
    name: busybox
    args:
      - sleep
      - "1000000"
  restartPolicy: Never' | kubectl apply -f -

kubectl wait --for=condition=Ready pod/busybox
kubectl exec -it busybox -- sh
}

alias helmfile='helmfile --helm-binary /usr/local/bin/helm'
alias hf='helmfile --helm-binary /usr/local/bin/helm'
alias helm2='/usr/local/opt/helm@2/bin/helm'

alias hy='bat -l yaml'
alias hys='bat --style="plain" -l yaml'
alias bs='bat --style="plain"'

alias ys='kapp tools inspect -f -'
alias tf='terraform'
#alias diff='diff -u'

alias gc='gcloud'
alias gccc='gcloud container clusters'

function jenkcli() {
    JENKINS=$1
    COMMAND=$2
    shift 2

    HOST=$(kubectl get ing $JENKINS --namespace cloudbees  -o jsonpath="{.spec.rules[?(@.http.paths[0].backend.service.name==\"$JENKINS\")].host}")
    ROUTE=$(kubectl get ing $JENKINS --namespace cloudbees -o jsonpath="{.spec.rules[?(@.http.paths[0].backend.service.name==\"$JENKINS\")].http.paths[0].path}")
    TOKEN=$(kubectl get secret cbcore-admin-token-secret --namespace cloudbees -o jsonpath="{.data.token}" | base64 --decode)

    java -jar ~/code/jenkins-cli/jenkins-cli.jar \
    -auth admin:$TOKEN \
    -s http://$HOST$ROUTE/ \
    $COMMAND $*
}

function jenkcli2() {
    JENKINS=$1
    COMMAND=$2
    shift 2

    HOST=$(kubectl get ing $JENKINS --namespace cloudbees  -o jsonpath="{.spec.rules[?(@.http.paths[0].backend.service.name==\"$JENKINS\")].host}")
    ROUTE=$(kubectl get ing $JENKINS --namespace cloudbees -o jsonpath="{.spec.rules[?(@.http.paths[0].backend.service.name==\"$JENKINS\")].http.paths[0].path}")
    TOKEN=$(kubectl get secret cbcore-admin-token-secret --namespace cloudbees -o jsonpath="{.data.token}" | base64 --decode)

    echo java -jar ~/code/jenkins-cli/jenkins-cli.jar \
    -auth admin:$TOKEN \
    -s http://$HOST$ROUTE/ \
    $COMMAND $*
}

function jenkgroov() {
    JENKINS=$1
    SCRIPT=$2
    shift 2
    
    HOST=$(kubectl get ing $JENKINS --namespace cloudbees  -o jsonpath="{.spec.rules[?(@.http.paths[0].backend.service.name==\"$JENKINS\")].host}")
    ROUTE=$(kubectl get ing $JENKINS --namespace cloudbees -o jsonpath="{.spec.rules[?(@.http.paths[0].backend.service.name==\"$JENKINS\")].http.paths[0].path}")
    TOKEN=$(kubectl get secret cbcore-admin-token-secret --namespace cloudbees -o jsonpath="{.data.token}" | base64 --decode)

    java -jar ~/code/jenkins-cli/jenkins-cli.jar \
    -auth admin:$TOKEN \
    -s http://$HOST$ROUTE/ \
    groovy = < $SCRIPT $* 
}

function jenk-install-plugin() {
    JENKINS=$1
    HPI=$2
    shift 2
    
    HOST=$(kubectl get ing $JENKINS --namespace cloudbees  -o jsonpath="{.spec.rules[?(@.http.paths[0].backend.service.name==\"$JENKINS\")].host}")
    ROUTE=$(kubectl get ing $JENKINS --namespace cloudbees -o jsonpath="{.spec.rules[?(@.http.paths[0].backend.service.name==\"$JENKINS\")].http.paths[0].path}")
    TOKEN=$(kubectl get secret cbcore-admin-token-secret --namespace cloudbees -o jsonpath="{.data.token}" | base64 --decode)

    java -jar ~/code/jenkins-cli/jenkins-cli.jar \
    -auth admin:$TOKEN \
    -s http://$HOST$ROUTE/ \
    install-plugin = < $HPI $* 
}

#curl --data-urlencode script@master-provisioner-shim.groovy -v --user admin:admin:$(kubectl get secret cbcore-admin-token-secret --namespace cloudbees -o jsonpath="{.data.token}" | base64 --decode) http://$(kubectl get ing cjoc --namespace cloudbees -o jsonpath="{.spec.rules[0].host}")/cjoc/scriptText

function jenkrest-get () {
    curl --user admin:$(kubectl get secret cbcore-admin-token-secret --namespace cloudbees -o jsonpath="{.data.token}" | base64 --decode) \
    -L -s -S http://$(kubectl get ing $1 --namespace cloudbees -o jsonpath="{.spec.rules[0].host}")/$1/$2
}

function jenkrest-post () {
    curl -vX POST --user admin:$(kubectl get secret cbcore-admin-token-secret --namespace cloudbees -o jsonpath="{.data.token}" | base64 --decode) \
    -s http://$(kubectl get ing $1 --namespace cloudbees -o jsonpath="{.spec.rules[0].host}")/$1/$2
}

function jenkbuild () {
    jenkrest-post $1 "job/$2/build"
}

alias git-grep-all='git branch -a | grep -v "remotes/origin/HEAD" | tr -d \* | xargs git grep'

alias glg='git log --graph --abbrev-commit --decorate --format=format:"%C(green)%h%C(reset) - %C(blue)(%ar)%C(reset) %C(white)%s%C(reset) %C(red)%d%C(reset)" --all'
alias glb='git log --graph --abbrev-commit --decorate --format=format:"%C(green)%h%C(reset) - %C(white)%s%C(reset) %C(reset)%C(red)%d%C(reset)" --all'
alias glbo='git log --graph --abbrev-commit --decorate --format=format:"%C(green)%h%C(reset) - %C(white)%s%C(reset) %C(reset)%C(red)%d%C(reset)" --branches=\*'
alias glgu='git log --graph --abbrev-commit --decorate --format=format:"%C(green)%h%C(reset) - %C(blue)(%ar)%C(reset) %C(white)%s%C(reset) %C(reset)%C(red)%d%C(reset) %C(reset)%C(yellow)<%an>" --all'
alias glbu='git log --graph --abbrev-commit --decorate --format=format:"%C(green)%h%C(reset) - %C(white)%s%C(reset) %C(reset)%C(red)%d%C(reset) %C(reset)%C(yellow)<%an>" --all'
alias glh='git log --abbrev-commit --decorate --format=format:"%C(green)%h%C(reset) - %C(white)%s%C(reset) %C(reset)%C(red)%d %C(reset)%C(magenta)(%cr) %C(reset)%C(yellow)<%an>"'

alias gd='git diff'
alias gds='git diff --staged'
# alias gdw='git diff --word-diff=color --word-diff-regex="[^[:space:],()=]+|[(),=]+"'
# alias gdwi='git diff --ignore-all-space --word-diff=color --word-diff-regex="[^[:space:],()=]+|[(),=]+"'
# alias gdws='git diff --ignore-all-space --staged --word-diff=color --word-diff-regex="[^[:space:],=]+|[,=]+"'

alias gcane='git add *; git commit --amend --no-edit'
alias gaa='git add *'
alias ga.='git add .'
alias gcm='git commit --message'
alias gcam='git commit --all --message'
alias gm='git commit --all --message "more"'
alias gco='git checkout'

function gccd() {
    BASE="$(basename "$1")"
    if [[ $BASE =~ ".git" ]]; then
        BASE="$(basename "$1" .git)"
    fi

    git clone "$1"
    # sleep 1
    cd $BASE
}

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

alias gsh='git show'
alias gshns='git show --name-status'

alias gst='git status'
alias grep='grep --color=auto --exclude-dir=".git"'

function jhome () {
  export JAVA_HOME=`/usr/libexec/java_home -v $@`
  echo "JAVA_HOME:" $JAVA_HOME
  echo "java -version:"
  java -version
}

alias kaniko-build-here='docker run -it -v $(pwd):/workspace gcr.io/kaniko-project/executor:latest --no-push --cleanup'
alias kaniko-build-here-gvisor='docker run --runtime=runsc -it -v $(pwd):/workspace gcr.io/kaniko-project/executor:latest --no-push --cleanup'

alias ekc='export KUBECONFIG=$(pwd)/$(ls *kubeconfig*.yaml)'
alias kapp-inspect-stdin='kapp tools inspect -f -'

alias mci='mvn clean install'
alias mcp='mvn clean package'

# list files
export EXA_COLORS="di=36"
alias ls=exa
alias l='exa --all --long'
alias lt='exa --all --long --sort=changed --reversed'
alias lta='exa --all --long --sort=changed'
alias lr='exa --all --long --tree'
alias lr2='exa --all --long --tree --level=2'
# alias lh='exa .* --long'

alias lh='CLICOLOR_FORCE=1 gls -ald .* --color=always'

alias lsd3='du -sk * | sort -nr | head -3'

# change dir (or make and change)
alias u='cd ..'
alias uu='cd ..; cd ..'
alias uuu='cd ..; cd ..; cd ..'
alias ul='cd ..; l'
function mkcd () { mkdir -p "$@" && cd "$@"; }

function d64() { echo $1 | base64 -D }

# other misc
alias ttop='top -U $USER'
alias cwd="pwd | tr -d '\n' | pbcopy"
alias wgetssl='wget --no-check-certificate'
alias linecount="sed '/^\s*$/d' | wc -l"

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
alias uncompress=extract

tenor-dl() {
    [[ -n "$1" ]] || return

    local UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36"
    #Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0
    local curl=$(curl -sA "$UA" "$1")
    local gif_link=$(echo $curl | pup 'html head link.dynamic[rel="image_src"] attr{href}')

    local filename=$(echo $curl | pup 'div.Copybox.share' | xmlstarlet unesc | sed -n 'H
    $ {g
       s/<\!--/²/g;s/-->/³/g
    :a
       s/²[^³]*³//g
       t a
       s/.//p
   }' | pup 'input attr{value}' | cut -d '/' -f5)

    # echo $UA
    # echo $gif_link
    # echo $filename

    curl -s "$gif_link" \
        -H "User-Agent: $UA" -H 'Accept: image/webp,*/*' -H 'Accept-Language: en-US,en;q=0.5' \
        --compressed -H 'Referer: https://tenor.com/' -H 'Connection: keep-alive' -H 'DNT: 1' -H 'TE: Trailers' > "${filename}.gif"
}

function mkv2mp4() { ffmpeg -i $1 -vcodec copy -acodec copy -absf aac_adtstoasc $1.mp4 }

# snag an mp3 from youtube and title it properly
function ytmp3() {
    youtube-dl --keep-video --output '%(title)s.%(ext)s' --verbose --format bestaudio --extract-audio --audio-quality 160K --audio-format mp3 --metadata-from-title "%(artist)s - %(title)s" $1
}
function webm-to-mp3() {
    ffmpeg -i "$1" -vn -ab 160k -ar 44100 -y "$1.mp3"
}

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

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
