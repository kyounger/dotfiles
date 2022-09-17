This is how I manage my machine setup. All the convention you see here is [chezmoi](https://chezmoi.io).

Sometimes with Hammerspoon, penlight gets out of sync: For easy reference: 

To fix penlight install for luarocks for lua 5.3:
`luarocks --lua-dir=$(brew --prefix)/opt/lua@5.3 install penlight`

To fix penlight install for luarocks for latest lua:
`luarocks --lua-dir=$(brew --prefix)/opt/lua install penlight`
