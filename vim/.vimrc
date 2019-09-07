" .vimrc_
" Author: Kenny Younger <kyounger@gmail.com>
" Credits And Huge Props: Tim Pope, Steve Losh, Shougo Matsu, Junegunn Choi, Steve Morrow

let g:disable_all_plugins = 0

" NeoBundle --------------------------------------------------------------- {{{

    " Note: Skip initialization for vim-tiny or vim-small.
    if !1 | finish | endif

        if has('vim_starting')
            if &compatible
                set nocompatible
            endif
            set runtimepath+=~/.vim/neobundle/
        endif

        call neobundle#begin(expand('~/.vim/bundle'))

  " Bundle Definitions ------------------------------------------------ {{{

        NeoBundleFetch 'Shougo/neobundle.vim'

        if !g:disable_all_plugins
            "Core Plugins for my vim experience
                NeoBundle 'Shougo/unite.vim'
                NeoBundle 'Shougo/neomru.vim'
                NeoBundle 'Shougo/vimproc.vim', {
                \ 'build' : {
                \     'windows' : 'tools\\update-dll-mingw',
                \     'cygwin' : 'make -f make_cygwin.mak',
                \     'mac' : 'make -f make_mac.mak',
                \     'linux' : 'make',
                \     'unix' : 'gmake',
                \    },
                \ }
                " NeoBundle 'tpope/vim-surround', { 'directory': 'surround' }
                NeoBundle 'tpope/vim-commentary', { 'directory': 'commentary' }
                NeoBundle 'tpope/vim-repeat', { 'directory': 'repeat' }
                NeoBundle 'tpope/vim-unimpaired', { 'directory': 'unimpaired' } "Convenience mappings
                NeoBundle 'tpope/vim-fugitive', { 'directory': 'fugitive' }
                NeoBundle 'airblade/vim-gitgutter', {'directory': 'gitgutter'}
                NeoBundle 'terryma/vim-expand-region', { 'directory': 'expand-region' } "mapped to +
                NeoBundle 'junegunn/vim-pseudocl' "Replaces command-line, required by vim-oblique
                NeoBundle 'junegunn/vim-slash'
                NeoBundle 'junegunn/vim-peekaboo'
                NeoBundle 'Lokaltog/vim-powerline', { 'directory': 'vim-powerline' }
                NeoBundle 'maxbrunsfeld/vim-yankstack'
                NeoBundle 'tmux-plugins/vim-tmux-focus-events'

            "ColorSchemes
            NeoBundle 'sjl/badwolf', { 'directory': 'badwolf' }
            NeoBundle 'altercation/vim-colors-solarized', { 'directory': 'colors-solarized' }

            "Utilities
            NeoBundle 'sjl/AnsiEsc.vim', { 'directory': 'AnsiEsc.vim' } "esc sequences look pretty
            NeoBundle 'sjl/vitality.vim', { 'directory': 'vitality.vim' } "iterm2 and tmux helper

            NeoBundle 'mrk21/yaml-vim'


            "HTML, xml and other codegen
            " NeoBundle 'tristen/vim-sparkup', { 'directory': 'sparkup' }
            " NeoBundle 'mattn/emmet-vim', { 'directory': 'emmet-vim' }
            " NeoBundle 'othree/html5.vim', { 'directory': 'html5.vim' }
            " NeoBundle 'msanders/snipmate.vim', { 'directory': 'snipmate' }
            " NeoBundle 'sukima/xmledit', { 'directory': 'xmledit' }

            "Javascript stuff:
            NeoBundle 'maksimr/vim-jsbeautify'
            " NeoBundle 'beautify-web/js-beautify'
            " NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
            " NeoBundle 'pangloss/vim-javascript', { 'directory': 'javascript' }
            " NeoBundle 'elzr/vim-json', { 'directory': 'vim-json' }
            " NeoBundleLazy 'marijnh/tern_for_vim' " see more here: http://ternjs.net/doc/manual.html#configuration

            "Syntax hightlighting, folding, and checking
            " NeoBundle 'groenewege/vim-less', { 'directory': 'less' }
            " NeoBundle 'mustache/vim-mustache-handlebars'
            " NeoBundle 'digitaltoad/vim-jade' "node template engine
            " NeoBundle 'evanmiller/nginx-vim-syntax', { 'directory': 'nginx-vim-syntax' }
            " NeoBundle 'rodjek/vim-puppet', { 'directory': 'puppet' }
            " NeoBundle 'darfink/vim-plist'
            NeoBundle 'PProvost/vim-ps1'
            NeoBundle 'godlygeek/tabular'
            NeoBundle 'plasticboy/vim-markdown'
            NeoBundle 'martinda/Jenkinsfile-vim-syntax'

            " NeoBundle 'vim-scripts/phpfolding.vim', { 'directory': 'phpfolding.vim' }
            " NeoBundle 'scrooloose/syntastic', { 'directory': 'syntastic' }
            " NeoBundle 'vim-scripts/taglist.vim', { 'directory': 'taglist.vim' }
            " NeoBundle 'junegunn/rainbow_parentheses.vim', { 'directory': 'rainbow_parentheses.vim'}

            "Diffs and splits
            " NeoBundle 'AndrewRadev/linediff.vim', { 'directory': 'linediff.vim' }
            " NeoBundle 'wesQ3/vim-windowswap', { 'directory': 'windowswap' }

	    "Hex editing
	        NeoBundle 'fidian/hexmode'

            "Insert mode plugin. Helps with pairs of () [] {}
            " NeoBundle 'kana/vim-smartinput', { 'directory': 'smartinput' }

            "Autocompletion
            " NeoBundle 'davidhalter/jedi-vim' "python

            "Additional texobjs
            NeoBundle 'kana/vim-textobj-function', { 'directory': 'textobj-function' }
            NeoBundle 'kana/vim-textobj-indent', { 'directory': 'textobj-indent' }
            NeoBundle 'kana/vim-textobj-user', { 'directory': 'textobj-user' }


            " TODO: look into these
            " https://github.com/junegunn/vim-github-dashboard
            " https://github.com/mhinz/vim-signify
            " https://github.com/PeterRincker/vim-argumentative/
            " http://eclim.org/
            " https://github.com/bling/vim-airline
            " https://github.com/jamessan/vim-gnupg/
            "
            " maybe? https://github.com/int3/vim-extradite
            " maybe? https://github.com/paradigm/SkyBison
            " https://github.com/Shougo/neosnippet.vim
            " https://github.com/terryma/vim-multiple-cursors

        " }}}

    endif " end of if(disable_all_plugins)

    call neobundle#end()
    filetype plugin indent on
    NeoBundleCheck

" }}}
" Settings and Mappings --------------------------------------------------- {{{
" Sensible Defaults: {{{

    set encoding=utf-8
    set modelines=0 " Prevent arbitrary command execution vulnerability - http://www.securityfocus.com/bid/14374/references
    set autoindent
    set showmode
    set showcmd
    set hidden
    set visualbell
    set ttyfast
    set ruler
    set backspace=indent,eol,start
    set relativenumber
    set number
    set laststatus=2
    set history=1000
    set undofile
    set undoreload=10000
    set list
    set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
    set shell=/bin/zsh\ --login
    set lazyredraw
    set matchtime=5
    set showbreak=↪
    set splitbelow
    set splitright
    " set fillchars=diff:⣿,vert:│
    " set autowrite
    set autoread
    set shiftround
    set title
    set linebreak

    " Don't try to highlight lines longer than 300 characters.
    set synmaxcol=300

    " Time out on key codes but not mappings.
    " Basically this makes terminal Vim work sanely.
    set notimeout
    set ttimeout
    set ttimeoutlen=10

    " Better Completion
    set complete=.,w,b,u,t
    set completeopt=longest,menuone,preview

    set tildeop
    set shortmess=filtIoOA     " shorten messages
    set report=0               " tell us about changes
    set nostartofline          " don't jump to the start of line when scrolling
    set ffs=unix,dos,mac
    set autochdir

    set ignorecase
    set smartcase
    set incsearch
    set showmatch
    set hlsearch
    set gdefault

    set scrolloff=3
    set sidescroll=1
    set sidescrolloff=10

    set virtualedit+=block

" }}}
" Cursorline: {{{

    " Only show cursorline in the current window and in normal mode.
    augroup cline
        au!
        au WinLeave,InsertEnter * set nocursorline
        au WinEnter,InsertLeave * set cursorline
    augroup END

" }}}
" Trailing whitespace: {{{
    " Only shown when not in insert mode so I don't go insane.
    augroup trailing
        au!
        au InsertEnter * :set listchars-=trail:⌴
        au InsertLeave * :set listchars+=trail:⌴
    augroup END

    fun! TrimWhitespace()
	let l:save_cursor = getpos('.')
	%s/\s\+$//e
	call setpos('.', l:save_cursor)
    endfun

" }}}
" Wildmenu completion: {{{

    set wildmenu
    set wildmode=longest:list,full

    set wildignore+=.hg,.git,.svn                    " Version control
    set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
    set wildignore+=*.spl                            " compiled spelling word lists
    set wildignore+=*.sw?                            " Vim swap files
    set wildignore+=*.DS_Store                       " OSX bullshit

    set wildignore+=*.luac                           " Lua byte code

    set wildignore+=migrations                       " Django migrations
    set wildignore+=*.pyc                            " Python byte code

    set wildignore+=*.orig                           " Merge resolution files

    " Clojure/Leiningen
    set wildignore+=classes
    set wildignore+=lib

" }}}
" Line Return: {{{

    " Make sure Vim returns to the same line when you reopen a file.
    augroup line_return
        au!
        au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     execute 'normal! g`"zvzz' |
            \ endif
    augroup END

" }}}
" Backups: {{{

    set backup                        " enable backups
    set noswapfile                    " It's 2013, Vim.

    set undodir=~/.vim/tmp/undo//     " undo files
    set backupdir=~/.vim/tmp/backup// " backups
    set directory=~/.vim/tmp/swap//   " swap files

    " Make Vim able to edit crontab files again.
    set backupskip=/tmp/*,/private/tmp/*"

    " Make those directories automatically if they don't already exist.
    if !isdirectory(expand(&undodir))
        call mkdir(expand(&undodir), "p")
    endif
    if !isdirectory(expand(&backupdir))
        call mkdir(expand(&backupdir), "p")
    endif
    if !isdirectory(expand(&directory))
        call mkdir(expand(&directory), "p")
    endif

" }}}
" Leader: {{{

    let mapleader = ","
    let maplocalleader = "\\"

" }}}
" Tabs, Spaces, Wrapping: {{{

    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set nowrap
    " set textwidth=80
    set formatoptions=qrn1
    set colorcolumn=+1
    inoremap <S-Tab> <C-d>

    " Wrap toggling with <leader>w
    " command! -nargs=* Wrap set wrap linebreak nolist
    nnoremap <leader>w :set nowrap! nolinebreak! nolist<cr>

    """ Steve Losh turns these off, so I will try
    " set autoindent
    " set smartindent
    if v:version > 704 || v:version == 704 && has("patch338")
        set breakindent
    endif

" }}}
" Color scheme {{{

    syntax on
    set background=dark

    if neobundle#is_installed("badwolf")
        let g:badwolf_html_link_underline = 0
        colorscheme badwolf

        " Reload the colorscheme whenever we write the file.
        augroup color_badwolf_dev
            au!
            au BufWritePost badwolf.vim color badwolf
        augroup END
    end

    " Highlight VCS conflict markers
    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}
" NoOp: {{{

    noremap  <F1> <nop>
    inoremap <F1> <nop>
    nnoremap Q <nop>

" }}}
" Editing: {{{
    " Clean trailing whitespace
    nnoremap <leader><leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

    "Format whole document based on filetype
    nnoremap <leader>= mzggVG=`z

    " Keep the cursor in place while joining lines
    nnoremap J mzJ`z

    " Split line (sister to [J]oin lines)
    " The normal use of S is covered by cc, so don't worry about shadowing it.
    nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

    " Made D behave
    nnoremap D d$

    " toggle the character that shows the end-of-line
    nnoremap <leader>i :set list!<cr>

    " Drag Lines: broken for now if folding is enabled
    " Alt-j & Alt-k to drag lines in any mode
    noremap ˚ :m-2<CR>
    noremap ∆ :m+<CR>
    inoremap ∆ <Esc>:m+<CR>
    inoremap ˚ <Esc>:m-2<CR>
    vnoremap ∆ :m'>+<CR>gv
    vnoremap ˚ :m-2<CR>gv

    " Remaps control-backspace to delete entire word in insert mode
    inoremap <C-BS> <Esc>dbxa

    " Fast saving
    nnoremap <leader>s :w!<cr>

    "BEAST MODE. Allow . and @@ to execute once for each line of a visual selection
    vnoremap . :normal .<CR>
    vnoremap @@ :normal @@
" }}}
" Command Mode Mapping: {{{
    " Insert the directory of the current buffer in command line mode
    cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

    " Emacs bindings in command line mode
    cnoremap <c-a> <home>
    cnoremap <c-e> <end>

    " Sudo to write
    cnoremap w!! w !sudo tee % >/dev/null
" }}}
" Selection Mappings: {{{
    " Select entire buffer
    nnoremap vaa ggvGg_
    nnoremap Vaa ggVG

    " Select (charwise) the contents of the current line, excluding indentation.
    " Great for pasting Python lines into REPLs.
    nnoremap vv ^vg_

    " Fix linewise visual selection of various text objects
    nnoremap VV V

    " Visually select the text that was last edited/pasted
    noremap gV `[v`]

    " Reselect visual block after indent/outdent
    vnoremap < <gv
    vnoremap > >gv
" }}}
" Navigation: {{{
    " mash keys; exit insert fast.
    inoremap jj <ESC>
    inoremap kk <ESC>
    inoremap jk <ESC>
    inoremap kj <ESC>

    " It's 2014.
    noremap j gj
    noremap k gk
    noremap gj j
    noremap gk k

    " Easy split navigation
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l

    " left and right arrows navigate buffers
    nnoremap <right> :bn<cr>
    nnoremap <left> :bp<cr>

    " use ',,' to swap between two most recent buffers
    nnoremap <leader><leader><space> <c-^>

    " Same when jumping around
    nnoremap g; g;zz
    nnoremap g, g,zz
    nnoremap <c-o> <c-o>zz

    " Easier to type, and I never use the default behavior.
    noremap H ^
    noremap L $
    vnoremap L g_

    " Heresy
    inoremap <c-a> <esc>I
    inoremap <c-e> <esc>A

    " gi already moves to 'last place you exited insert mode', so we'll map gI to
    " something similar: move to last change
    nnoremap gI `.

    "Matching
    runtime macros/matchit.vim
" }}}
" Misc: {{{
    nnoremap <F3> :e $MYVIMRC<cr>

    " Toggle "keep current line in the center of the screen" mode
    nnoremap <leader><leader>c :let &scrolloff=999-&scrolloff<cr>

    " Ctrl-Space for completions. Heck Yeah!
    inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
                \ "\<lt>C-n>" :
                \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
                \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
                \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
    imap <C-@> <C-Space>

    " Insert Mode Completion
    inoremap <c-f> <c-x><c-f>
    inoremap <c-]> <c-x><c-]>

    " Toggle between rnu, nu, and no numbering
    if version >= 703
        function! ToggleLineNumbers()
                if (!&number && !&relativenumber)
                    set number
                    set relativenumber
                elseif &rnu
                    set norelativenumber
                    set nu
                elseif &nu
                    set nonumber
                    set norelativenumber
                endif
        :nnoremap <silent> <F2> :call ToggleLineNumbers()<cr>
        endfunction
    endif

    " Resize splits when the window is resized
    au VimResized * :wincmd =

    " clearly
    au InsertLeave * set nopaste

    "Copypasta
    if has("win64") || has("win32")
        set clipboard=unnamedplus
    elseif has("mac")
        set clipboard=unnamed
    endif

    " paste with most recent yank
    noremap <leader>p "0p
    noremap <leader>P "0P

    "I hate typing SNAPSHOT
    nnoremap ,,s i-SNAPSHOT<esc>


" }}}
" Folding: {{{
    set foldlevelstart=20

    " Space to toggle folds.
    nnoremap <Space> za
    vnoremap <Space> za

    " Make zO recursively open whatever top level fold we're in, no matter where the cursor happens to be.
    nnoremap zO zCzO

    " "Focus" the current line.  Basically:
    "
    " 1. Close all folds.
    " 2. Open just the folds containing the current line.
    " 3. Move the line to a little bit (15 lines) above the center of the screen.
    " 4. Pulse the cursor line.  My eyes are bad.
    "
    " This mapping wipes out the z mark, which I never use.
    "
    " I use :sus for the rare times I want to actually background Vim.
    nnoremap <c-z> mzzMzvzz10<c-e>`z:Pulse<cr>

    function! MyFoldText() " {{{
        let line = getline(v:foldstart)

        let nucolwidth = &fdc + &number * &numberwidth
        let windowwidth = winwidth(0) - nucolwidth - 3
        let foldedlinecount = v:foldend - v:foldstart

        " expand tabs into spaces
        let onetab = strpart('          ', 0, &tabstop)
        let line = substitute(line, '\t', onetab, 'g')

        let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
        return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
    endfunction " }}}
    set foldtext=MyFoldText()

    function! BetterIndentFolding()
        setlocal foldmethod=expr
        setlocal foldexpr=(getline(v:lnum)=~'^$')?-1:((indent(v:lnum)<indent(v:lnum+1))?('>'.indent(v:lnum+1)):indent(v:lnum))
        set foldtext=getline(v:foldstart)
        set fillchars=fold:\ "(there's a space after that \)
        highlight Folded ctermfg=DarkGreen ctermbg=Black
    endfunction

" }}}
" Searching {{{

    nnoremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

    if !neobundle#is_installed("vim-oblique")
        " Use sane regexes.
        nnoremap / /\v
        vnoremap / /\v

        " Don't move on *
        " nnoremap * *<c-o>
    nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

        " Use c-\ to do c-] but open it in a new split.
        " nnoremap <c-\> <c-w>v<c-]>zvzz

        " Keep search matches in the middle of the window.
        nnoremap n nzzzv
        nnoremap N Nzzzv
    end

    function! HiInterestingWord(n) " {{{
        " Save our location.
        normal! mz
        " Yank the current word into the z register.
        "normal! "zyiw

        " Patched to highlight visual selection, if copied to register "z
        :if @z == ""
            normal! "zyiW
        :endif

        " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
        let mid = 77750 + a:n
        " Clear existing matches, but don't worry if they don't exist.
        "silent! call matchdelete(mid)
        try
            call matchdelete(mid)
        catch 'E803'
            " Construct a literal pattern that has to match at boundaries.
            "let pat = '\V\<' . escape(@z, '\') . '\>'

            " Patched to match substrings
            let pat = escape(@z, '\')

            " Actually match the strings.
            call matchadd("InterestingWord" . a:n, pat, 1, mid)
        endtry
        " Move back to our original location.
        :let @z = ""
        normal! `z
    endfunction
    nnoremap <silent> • :call HiInterestingWord(1)<cr>

"}}}

" }}}
" }}}
" Filetype-specific ------------------------------------------------------- {{{

" C {{{

    augroup ft_c
        au!
        au FileType c setlocal foldmethod=marker foldmarker={,}
    augroup END

" }}}
" Clojure {{{

    " function! SlimvToggleRepl()
    "     if bufname('%') ==# 'SLIMV.REPL'
    "         let origin = b:pop_back_to
    "         q
    "         execute "" . origin . "wincmd w"
    "     else
    "         let origin = winnr()
    "         vertical botright split
    "         e SLIMV.REPL
    "         let b:pop_back_to = origin
    "     endif
    " endfunction

    let g:slimv_leader = '\'
    let g:slimv_keybindings = 2

    augroup ft_clojure
        au!

        au BufNewFile,BufRead riemann.config set filetype=clojure
        au FileType clojure silent! call TurnOnClojureFolding()
        au FileType clojure compiler clojure
        au FileType clojure setlocal report=100000

        au BufWinEnter            SLIMV.REPL setlocal nolist
        au BufNewFile,BufReadPost SLIMV.REPL setlocal nowrap foldlevel=99
        au BufNewFile,BufReadPost SLIMV.REPL nnoremap <buffer> A GA
        au BufNewFile,BufReadPost SLIMV.REPL nnoremap <buffer> <localleader>R :emenu REPL.<Tab>

        " Fix the eval mappings.
        au FileType clojure nnoremap <buffer> <localleader>ef :<c-u>call SlimvEvalExp()<cr>
        au FileType clojure nnoremap <buffer> <localleader>ee :<c-u>call SlimvEvalDefun()<cr>

        " And the inspect mapping.
        au FileType clojure nmap <buffer> \i \di

        " And REPL-toggling mapping.
        " au FileType clojure nnoremap <buffer> \rr :call SlimvToggleRepl()<cr>

        " Indent top-level form.
        au FileType clojure nmap <buffer> <localleader>= mz99[(v%='z
    augroup END

" }}}
" Clojurescript {{{

    augroup ft_clojurescript
        au!

        au BufNewFile,BufRead *.cljs set filetype=clojurescript
        au FileType clojurescript call TurnOnClojureFolding()

        " Indent top-level form.
        au FileType clojurescript nmap <buffer> <localleader>= v((((((((((((=%
    augroup END

" }}}
" Confluence {{{

    augroup ft_c
        au!

        au BufRead,BufNewFile *.confluencewiki setlocal filetype=confluencewiki

        " Wiki pages should be soft-wrapped.
        au FileType confluencewiki setlocal wrap linebreak nolist
    augroup END

" }}}
" Cram {{{

    let cram_fold=1

    augroup ft_cram
        au!

        au BufNewFile,BufRead *.t set filetype=cram
        au Syntax cram setlocal foldlevel=1
        au FileType cram nnoremap <buffer> <localleader>ee :e<cr>
    augroup END

" }}}
" CSS and LessCSS {{{

    augroup ft_css
        au!

        au BufNewFile,BufRead *.less setlocal filetype=less

        au Filetype less,css setlocal foldmethod=marker
        au Filetype less,css setlocal foldmarker={,}
        au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
        au Filetype less,css setlocal iskeyword+=-

        " Use <leader>S to sort properties.  Turns this:
        "
        "     p {
        "         width: 200px;
        "         height: 100px;
        "         background: red;
        "
        "         ...
        "     }
        "
        " into this:

        "     p {
        "         background: red;
        "         height: 100px;
        "         width: 200px;
        "
        "         ...
        "     }
        au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

        " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
        " positioned inside of them AND the following code doesn't get unfolded.
        au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
    augroup END

" }}}
" Django {{{

    augroup ft_django
        au!

        au BufNewFile,BufRead urls.py           setlocal nowrap
        au BufNewFile,BufRead urls.py           normal! zR
        au BufNewFile,BufRead dashboard.py      normal! zR
        au BufNewFile,BufRead local_settings.py normal! zR

        au BufNewFile,BufRead admin.py     setlocal filetype=python.django
        au BufNewFile,BufRead urls.py      setlocal filetype=python.django
        au BufNewFile,BufRead models.py    setlocal filetype=python.django
        au BufNewFile,BufRead views.py     setlocal filetype=python.django
        au BufNewFile,BufRead settings.py  setlocal filetype=python.django
        au BufNewFile,BufRead settings.py  setlocal foldmethod=marker
        au BufNewFile,BufRead forms.py     setlocal filetype=python.django
        au BufNewFile,BufRead common_settings.py  setlocal filetype=python.django
        au BufNewFile,BufRead common_settings.py  setlocal foldmethod=marker
    augroup END

" }}}
" Firefox {{{

    augroup ft_firefox
        au!
        au BufRead,BufNewFile ~/Library/Caches/*.html setlocal buftype=nofile
    augroup END

" }}}
" Fish {{{

    augroup ft_fish
        au!

        au BufNewFile,BufRead *.fish setlocal filetype=fish

        au FileType fish setlocal foldmethod=marker foldmarker={{{,}}}
    augroup END

" }}}
" Haskell {{{

    augroup ft_haskell
        au!
        au BufEnter *.hs compiler ghc
    augroup END

" }}}
" HTML and HTMLDjango {{{

    let g:html_indent_tags = ['p', 'li']

    augroup ft_html
        au!

        au BufNewFile,BufRead *.html setlocal filetype=htmldjango
        au FileType html,jinja,htmldjango setlocal foldmethod=manual

        " Use <localleader>f to fold the current tag.
        au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>f Vatzf

        " Use <localleader>t to fold the current templatetag.
        au FileType html,jinja,htmldjango noremap <buffer> <localleader>t viikojozf

        " Indent tag
        au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>= Vat=

        " Django tags
        au FileType jinja,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

        " Django variables
        au FileType jinja,htmldjango inoremap <buffer> <c-f> {{<space><space>}}<left><left><left>
    augroup END

" }}}
" Java {{{

    augroup ft_java
        au!

        au FileType java setlocal foldmethod=marker
        au FileType java setlocal foldmarker={,}
    augroup END

" }}}
" Javascript {{{

    augroup ft_javascript
        " au!

        " au FileType javascript call JavaScriptFold()
        " au FileType javascript setlocal foldmethod=marker
        " au FileType javascript setlocal foldmarker={,}

        " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
        " positioned inside of them AND the following code doesn't get unfolded.
        " au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
    augroup END

" }}}
" Lisp {{{

    augroup ft_lisp
        au!
        au FileType lisp call TurnOnLispFolding()
        " au FileType lisp nnoremap <buffer> <localleader>ee mz99[(va("ry:call Send_to_Tmux(@r)<cr>
        au FileType lisp nnoremap <buffer> <localleader>ee mz99[(:call SlimvEvalExp()<cr>`z

        au FileType lisp nnoremap <buffer> <localleader>tt mz99[(vab"ry:call Send_to_Tmux(@r)<cr>`z
        au FileType lisp nnoremap <buffer> <localleader>tb mzggVG"ry:call Send_to_Tmux(@r)<cr>`z
    augroup END

" }}}
" Mail {{{

    augroup ft_mail
        au!

        au Filetype mail setlocal spell
    augroup END

" }}}
" Mercurial {{{

    augroup ft_mercurial
        au!

        au BufNewFile,BufRead *hg-editor-*.txt setlocal filetype=hgcommit
    augroup END

" }}}
" Mutt {{{

    augroup ft_muttrc
        au!

        au BufRead,BufNewFile *.muttrc set ft=muttrc

        au FileType muttrc setlocal foldmethod=marker foldmarker={{{,}}}
    augroup END

" }}}
" Nginx {{{

    augroup ft_nginx
        au!

        au BufRead,BufNewFile /etc/nginx/conf/*                      set ft=nginx
        au BufRead,BufNewFile /etc/nginx/sites-available/*           set ft=nginx
        au BufRead,BufNewFile /usr/local/etc/nginx/sites-available/* set ft=nginx
        au BufRead,BufNewFile vhost.nginx                            set ft=nginx

        au FileType nginx setlocal foldmethod=marker foldmarker={,}
    augroup END

" }}}
" Pentadactyl {{{

    augroup ft_pentadactyl
        au!
        au BufNewFile,BufRead .pentadactylrc set filetype=pentadactyl
        au BufNewFile,BufRead ~/Library/Caches/TemporaryItems/pentadactyl-*.tmp set nolist wrap linebreak columns=100 colorcolumn=0
    augroup END

" }}}
" Puppet {{{

    augroup ft_puppet
        au!

        au Filetype puppet setlocal foldmethod=marker
        au Filetype puppet setlocal foldmarker={,}
    augroup END

" }}}
" Python {{{

    augroup ft_python
        au!

        au FileType python setlocal define=^\s*\\(def\\\\|class\\)
        au FileType man nnoremap <buffer> <cr> :q<cr>

        " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
        " override this in a normal way, could you?
        au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

        " Jesus, Python.  Five characters of punctuation for a damn string?
        au FileType python inoremap <buffer> <c-g> _(u'')<left><left>

        au FileType python inoremap <buffer> <c-b> """"""<left><left><left>
    augroup END

" }}}
" QuickFix {{{

    augroup ft_quickfix
        au!
        au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0
    augroup END

" }}}
" ReStructuredText {{{

    augroup ft_rest
        au!

        au Filetype rst nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
        au Filetype rst nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
        au Filetype rst nnoremap <buffer> <localleader>3 yypVr~:redraw<cr>
        au Filetype rst nnoremap <buffer> <localleader>4 yypVr`:redraw<cr>
    augroup END

" }}}
" Riemann Config Files {{{

    augroup ft_riemann
        au!

        au BufNewFile,BufRead riemann.config set filetype=clojure
        au BufNewFile,BufRead riemann.config nnoremap <buffer> <localleader>= mzgg=G`z
    augroup END

" }}}
" Ruby {{{

    augroup ft_ruby
        au!
        au Filetype ruby setlocal foldmethod=syntax
    augroup END

" }}}
" Vagrant {{{

    augroup ft_vagrant
        au!
        au BufRead,BufNewFile Vagrantfile set ft=ruby
    augroup END

" }}}
" Vim {{{

    augroup ft_vim
        au!

        au FileType vim setlocal foldmethod=marker
        au FileType help setlocal textwidth=78
        au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
    augroup END

" }}}

" }}}
" Plugin settings --------------------------------------------------------- {{{

" Commentary {{{
    if neobundle#is_installed("vim-commentary")
        augroup plugin_commentary
            au!
            au FileType htmldjango setlocal commentstring={#\ %s\ #}
            au FileType clojurescript setlocal commentstring=;\ %s
            au FileType puppet setlocal commentstring=#\ %s
            au FileType fish setlocal commentstring=#\ %s
        augroup END
    end

" }}}
" GitGutter {{{

    if neobundle#is_installed("vim-gitgutter")
        nnoremap <F2> :GitGutterToggle<cr>
		nmap <Leader>hn <Plug>GitGutterNextHunk
		nmap <Leader>hp <Plug>GitGutterPrevHunk
    end

" }}}
" Fugitive {{{

    if neobundle#is_installed("vim-fugitive")
        nnoremap <leader>gd :Gdiff<cr>
        nnoremap <leader>gs :Gstatus<cr>
        nnoremap <leader>gw :Gwrite<cr>
        nnoremap <leader>ga :Gadd<cr>
        nnoremap <leader>gb :Gblame<cr>
        nnoremap <leader>gco :Gcheckout<cr>
        nnoremap <leader>gci :Gcommit<cr>
        nnoremap <leader>gm :Gmove<cr>
        nnoremap <leader>gr :Gremove<cr>

        augroup ft_fugitive
            au!

            au BufNewFile,BufRead .git/index setlocal nolist
        augroup END

        " "Hub"
        nnoremap <leader>H :Gbrowse<cr>
        vnoremap <leader>H :Gbrowse<cr>
    end

" }}}
" Linediff {{{

    if neobundle#is_installed("linediff.vim")
        vnoremap <leader>l :Linediff<cr>
        nnoremap <leader>L :LinediffReset<cr>
    end

" }}}
" Markdown {{{

    if neobundle#is_installed("vim-markdown")
        let g:vim_markdown_emphasis_multiline = 0
        let g:vim_markdown_no_default_key_mappings = 1
        let g:vim_markdown_folding_style_pythonic = 1
    end

" }}}
" Powerline {{{

    if neobundle#is_installed("vim-powerline")
        " let g:Powerline_symbols = 'fancy'
        let g:Powerline_cache_enabled = 1
        " let g:Powerline_colorscheme = 'badwolf'
    end

" }}}
" Python-Mode {{{

    let g:pymode_doc = 1
    let g:pymode_doc_key = '<localleader>ds'
    let g:pydoc = 'pydoc'
    let g:pymode_syntax = 1
    let g:pymode_syntax_all = 0
    let g:pymode_syntax_builtin_objs = 1
    let g:pymode_syntax_print_as_function = 0
    let g:pymode_syntax_space_errors = 0
    let g:pymode_run = 0
    let g:pymode_lint = 0
    let g:pymode_breakpoint = 0
    let g:pymode_utils_whitespaces = 0
    let g:pymode_virtualenv = 0
    let g:pymode_folding = 0

    let g:pymode_options_indent = 0
    let g:pymode_options_fold = 0
    let g:pymode_options_other = 0

    let g:pymode_rope = 1
    let g:pymode_rope_global_prefix = "<localleader>R"
    let g:pymode_rope_local_prefix = "<localleader>r"
    let g:pymode_rope_auto_project = 1
    let g:pymode_rope_enable_autoimport = 0
    let g:pymode_rope_autoimport_generate = 1
    let g:pymode_rope_autoimport_underlineds = 0
    let g:pymode_rope_codeassist_maxfixes = 10
    let g:pymode_rope_sorted_completions = 1
    let g:pymode_rope_extended_complete = 1
    let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]
    let g:pymode_rope_confirm_saving = 1
    let g:pymode_rope_vim_completion = 1
    let g:pymode_rope_guess_project = 1
    let g:pymode_rope_goto_def_newwin = 0
    let g:pymode_rope_always_show_complete_menu = 0

" }}}
" Sparkup {{{

    if neobundle#is_installed("vim-sparkup")
        let g:sparkupNextMapping = '<c-s>'
    end

"}}}
" Syntastic {{{

    if neobundle#is_installed("syntastic")
        let g:syntastic_enable_signs = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_disabled_filetypes = ['html', 'rst']
        let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
        let g:syntastic_javascript_checkers=['jshint']
        "let g:syntastic_jsl_conf = '$HOME/.vim/jsl.conf'
    end

" }}}
" Splice {{{

    if neobundle#is_installed("splice.vim")
        " let g:splice_leader = "-"

        let g:splice_initial_mode = "grid"

        let g:splice_initial_layout_grid = 0
        let g:splice_initial_layout_loupe = 0
        let g:splice_initial_layout_compare = 0
        let g:splice_initial_layout_path = 0

        let g:splice_initial_diff_grid = 1
        let g:splice_initial_diff_loupe = 0
        let g:splice_initial_diff_compare = 1
        let g:splice_initial_diff_path = 0

        let g:splice_initial_scrollbind_grid = 0
        let g:splice_initial_scrollbind_loupe = 0
        let g:splice_initial_scrollbind_compare = 0
        let g:splice_initial_scrollbind_path = 0

        let g:splice_wrap = "nowrap"
    end

" }}}
" WindowSwap {{{

    if neobundle#is_installed("vim-windowswap")
        let g:windowswap_map_keys = 0 "prevent default bindings
        " nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
        " nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
        nnoremap <silent> <leader><leader>w :call WindowSwap#EasyWindowSwap()<CR>"
    end

"}}}
" RainbowParentheses {{{

    if neobundle#is_installed("rainbow_parentheses.vim")
        nnoremap <leader><leader>rp :RainbowParentheses!!<cr>
    end

" }}}
" Unite {{{

    if neobundle#is_installed("unite.vim")
        call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep', 'max_candidates', 20)
        call unite#filters#matcher_default#use(['matcher_fuzzy'])

        nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
        nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
        nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
        nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

        " For list of all mapping in the unite buffer:
        " https://github.com/Shougo/unite.vim/blob/master/doc/unite.txt#L1106
        " Custom mappings for the unite buffer
        autocmd FileType unite call s:unite_settings()
        function! s:unite_settings()
            " Enable navigation with control-j and control-k in insert mode
            imap <buffer> <C-j>     <Plug>(unite_select_next_line)
            imap <buffer> <C-k>     <Plug>(unite_select_previous_line)
            "imap <buffer> <C-q>     <Plug>(unite_exit)
        endfunction
    end

" }}}
" Jedi {{{

    if neobundle#is_installed("jedi-vim")
        let g:jedi#auto_initialization = 0
        let g:jedi#auto_vim_configuration = 0
        let g:jedi#goto_assignments_command = "<leader>g"
        let g:jedi#goto_definitions_command = "<leader>d"
        let g:jedi#documentation_command = "K"
        let g:jedi#usages_command = "<leader>n"
        let g:jedi#completions_command = "<C-Space>"
        let g:jedi#rename_command = "<leader>r"
        let g:jedi#show_call_signatures = "1"
    end

" }}}
" Oblique {{{

    if neobundle#is_installed("vim-oblique")
        let g:oblique#clear_highlight=0
        let g:oblique#incsearch_highlight_all=1
    end

" }}}
" Yankstack {{{
    nmap π <Plug>yankstack_substitute_older_paste
    nmap ∏ <Plug>yankstack_substitute_newer_paste
" }}}

" }}}
" Environments (GUI/Console) ---------------------------------------------- {{{
"
    if has('gui_running')
        " GUI Vim

        " TODO: setup patched font
        " set guifont=Menlo\ Regular\ for\ Powerline:h12

        " Remove all the UI cruft
        set go-=T
        set go-=l
        set go-=L
        set go-=r
        set go-=R

        " TODO: get spellcheck working
        " highlight SpellBad term=underline gui=undercurl guisp=Orange
        "

        " Different cursors for different modes.
        set guicursor=n-c:block-Cursor-blinkon0
        set guicursor+=v:block-vCursor-blinkon0
        set guicursor+=i-ci:ver20-iCursor

        if has("gui_macvim")
            " Full screen means FULL screen
            set fuoptions=maxvert,maxhorz

            " Use the normal HIG movements, except for M-Up/Down
            let macvim_skip_cmd_opt_movement = 1
            no   <D-Left>       <Home>
            no!  <D-Left>       <Home>
            no   <M-Left>       <C-Left>
            no!  <M-Left>       <C-Left>

            no   <D-Right>      <End>
            no!  <D-Right>      <End>
            no   <M-Right>      <C-Right>
            no!  <M-Right>      <C-Right>

            no   <D-Up>         <C-Home>
            ino  <D-Up>         <C-Home>
            imap <M-Up>         <C-o>{

            no   <D-Down>       <C-End>
            ino  <D-Down>       <C-End>
            imap <M-Down>       <C-o>}

            imap <M-BS>         <C-w>
            inoremap <D-BS>     <esc>my0c`y
        else
            " Non-MacVim GUI, like Gvim
        end
    else
        " Console Vim
        " For me, this means iTerm2, possibly through tmux

        " Mouse support
        set mouse=a

        "deal with oddities with tmux cursor
        function! HandleCursor()
            if mode() == 'i'
                silent exec "! echo -ne '\e[5 q'"
            else
                silent exec "! echo -ne '\e[2 q'"
            endif
        endfunction

        autocmd  FocusGained  * silent! call HandleCursor()

    endif


    " Win32 GVim
    if has("gui_running") && (has("win32") || has("win64"))
        if exists("g:confirm_quit") || &cp
            finish
        endif
        let g:confirm_quit = 1

        "Windows Font
        if has("win32") || has("win64")
            set gfn=Consolas:h11:cDEFAULT
        endif


        function! ConfirmQuit(writeFile)
            if (a:writeFile)
                if (expand("#")=="")
                    echo "Can't save a file with no name."
                    return
                endif
                write
            endif

            let l:confirmed = confirm("Do you really want to quit?", "&Yes\n&No", 2)
            if l:confirmed == 1
                quit
            endif
        endfu

        cnoremap <silent> q<cr>  call ConfirmQuit(0)<cr>
        cnoremap <silent> wq<cr> call ConfirmQuit(1)<cr>
        cnoremap <silent> x<cr> call ConfirmQuit(1)<cr>
    endif

" }}}
