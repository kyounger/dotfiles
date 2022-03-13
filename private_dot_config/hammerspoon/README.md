git clone https://github.com/kyounger/anycomplete


``` sh
ffmpeg -f avfoundation -i "5:" -filter:v "crop=w:h:x:y" out.gif 2>&1
```

``` lua
local cmd="ffmpeg -f avfoundation -i '5:' -filter:v 'crop=w:h:x:y' out.gif 2>&1"
```


