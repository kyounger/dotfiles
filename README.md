This is how I manage my machine setup. All the convention you see here is [chezmoi](https://chezmoi.io).

Sometimes with Hammerspoon, penlight gets out of sync: For easy reference: 

To fix penlight install for luarocks for lua 5.3:
`luarocks --lua-dir=$(brew --prefix)/opt/lua@5.3 install penlight`

To fix penlight install for luarocks for latest lua:
`luarocks --lua-dir=$(brew --prefix)/opt/lua install penlight`


ZSH startup reference:
```
+----------------+-----------+-----------+------+
|                |Interactive|Interactive|Script|
|                |login      |non-login  |      |
+----------------+-----------+-----------+------+
|/etc/zshenv     |    A      |    A      |  A   |
+----------------+-----------+-----------+------+
|~/.zshenv       |    B      |    B      |  B   |
+----------------+-----------+-----------+------+
|/etc/zprofile   |    C      |           |      |
+----------------+-----------+-----------+------+
|~/.zprofile     |    D      |           |      |
+----------------+-----------+-----------+------+
|/etc/zshrc      |    E      |    C      |      |
+----------------+-----------+-----------+------+
|~/.zshrc        |    F      |    D      |      |
+----------------+-----------+-----------+------+
|/etc/zlogin     |    G      |           |      |
+----------------+-----------+-----------+------+
|~/.zlogin       |    H      |           |      |
+----------------+-----------+-----------+------+
|                |           |           |      |
+----------------+-----------+-----------+------+
|                |           |           |      |
+----------------+-----------+-----------+------+
|~/.zlogout      |    I      |           |      |
+----------------+-----------+-----------+------+
|/etc/zlogout    |    J      |           |      |
+----------------+-----------+-----------+------+
```

=== Making changes in iTerm2 profile ===
Update the profile manually in iterm2, then export *ALL* profiles as json. The directory should default to the proper chezmoi repo. Replace existing. Deploy with `cm apply`, etc. Update to target file [takes place immediately](https://iterm2.com/documentation-dynamic-profiles.html).

