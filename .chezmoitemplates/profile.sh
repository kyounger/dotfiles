umask 077

{{ if eq .os "darwin" -}}

{{ else if eq .os "linux" -}}

alias vcgencmd='/opt/vc/bin/vcgencmd'

{{ end -}}
