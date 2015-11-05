#!/bin/bash
# From http://blog.kovyrin.net/2006/05/30/nginx-php-fastcgi-howto/
# Modified per http://henrik.nyh.se/2008/02/php-in-nginx-on-os-x.
# Further modified by Stephen Tudor for private use.

## ABSOLUTE path to the PHP binary
PHPFCGI="/opt/local/bin/php-cgi" 

## tcp-port to bind on
FCGIPORT="9000" 

## IP to bind on
FCGIADDR="127.0.0.1" 

## number of PHP children to spawn
PHP_FCGI_CHILDREN=2

## number of request before php-process will be restarted
PHP_FCGI_MAX_REQUESTS=1000

# allowed environment variables sperated by spaces
ALLOWED_ENV="PATH USER" 

## if this script is run as root switch to the following user
USERID=nobody

################## no config below this line

ALLOWED_ENV="$ALLOWED_ENV PHP_FCGI_CHILDREN" 
ALLOWED_ENV="$ALLOWED_ENV PHP_FCGI_MAX_REQUESTS" 
ALLOWED_ENV="$ALLOWED_ENV FCGI_WEB_SERVER_ADDRS" 

if test x$UID = x0; then
  EX="/usr/bin/sudo -u $USERID $PHPFCGI -q -b \\"$FCGIADDR:$FCGIPORT\\"" 
else
  EX="$PHPFCGI -b $FCGIADDR:$FCGIPORT" 
fi

echo $EX

# copy the allowed environment variables
E=

for i in $ALLOWED_ENV; do
  E="$E $i=${!i}" 
done

# clean environment and set up a new one
nohup env - $E sh -c "$EX" &> /dev/null &
