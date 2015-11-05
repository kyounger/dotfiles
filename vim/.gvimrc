" Turn off a particular shortcut key in MacVim
if has("gui_macvim")
    try
        macmenu &File.New\ Tab key=<nop>
        macmenu &Edit.Find.Use\ Selection\ for\ Find key=<nop>
        macmenu &File.New\ Tab\ (Default\ Profile) key=<nop>

        " map <D-t> :CommandT<CR>
    catch
    endtry
endif
