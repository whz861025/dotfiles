" You can edit this file by hand.
" The " character at the beginning of a line comments out the line.
" Blank lines are ignored.

" The Default color scheme is used for any directory that does not have
" a specified scheme and for parts of user interface like menus. A
" color scheme set for a base directory will also
" be used for the sub directories.

" The standard ncurses colors are:
" Default = -1 = None, can be used for transparency or default color
" Black = 0
" Red = 1
" Green = 2
" Yellow = 3
" Blue = 4
" Magenta = 5
" Cyan = 6
" White = 7

" Light versions of colors are also available (set bold attribute):
" LightBlack
" LightRed
" LightGreen
" LightYellow
" LightBlue
" LightMagenta
" LightCyan
" LightWhite

" Available attributes (some of them can be combined):
" bold
" underline
" reverse or inverse
" standout
" italic (on unsupported systems becomes reverse)
" none

" Vifm supports 256 colors you can use color numbers 0-255
" (requires properly set up terminal: set your TERM environment variable
" (directly or using resources) to some color terminal name (e.g.
" xterm-256color) from /usr/lib/terminfo/; you can check current number
" of colors in your terminal with tput colors command)

" highlight group cterm=attrs ctermfg=foreground_color ctermbg=background_color

highlight clear

highlight Win cterm=none ctermfg=white ctermbg=none
highlight Directory cterm=bold ctermfg=cyan ctermbg=default
highlight Link cterm=bold ctermfg=yellow ctermbg=default
highlight BrokenLink cterm=bold ctermfg=red ctermbg=default
highlight Socket cterm=bold ctermfg=magenta ctermbg=default
highlight Device cterm=bold ctermfg=red ctermbg=default
highlight Fifo cterm=bold ctermfg=cyan ctermbg=default
highlight Executable cterm=bold ctermfg=green ctermbg=default
highlight Selected cterm=bold ctermfg=magenta ctermbg=default
highlight CurrLine cterm=bold,reverse ctermfg=default ctermbg=default
highlight TopLine cterm=none ctermfg=black ctermbg=white
highlight TopLineSel cterm=bold ctermfg=black ctermbg=default
highlight StatusLine cterm=bold ctermfg=black ctermbg=white
highlight WildMenu cterm=underline,reverse ctermfg=white ctermbg=black
highlight CmdLine cterm=none ctermfg=white ctermbg=black
highlight ErrorMsg cterm=none ctermfg=red ctermbg=black
highlight Border cterm=none ctermfg=black ctermbg=white
highlight JobLine cterm=bold,reverse ctermfg=black ctermbg=white
highlight SuggestBox cterm=bold ctermfg=default ctermbg=default
highlight CmpMismatch cterm=bold ctermfg=white ctermbg=red
highlight AuxWin cterm=bold,underline,reverse,standout,italic ctermfg=default ctermbg=default
highlight TabLine cterm=none ctermfg=white ctermbg=black
highlight TabLineSel cterm=bold,reverse ctermfg=default ctermbg=default
highlight User1 cterm=bold,underline,reverse,standout,italic ctermfg=default ctermbg=default
highlight User2 cterm=bold,underline,reverse,standout,italic ctermfg=default ctermbg=default
highlight User3 cterm=bold,underline,reverse,standout,italic ctermfg=default ctermbg=default
highlight User4 cterm=bold,underline,reverse,standout,italic ctermfg=default ctermbg=default
highlight User5 cterm=bold,underline,reverse,standout,italic ctermfg=default ctermbg=default
highlight User6 cterm=bold,underline,reverse,standout,italic ctermfg=default ctermbg=default
highlight User7 cterm=bold,underline,reverse,standout,italic ctermfg=default ctermbg=default
highlight User8 cterm=bold,underline,reverse,standout,italic ctermfg=default ctermbg=default
highlight User9 cterm=bold,underline,reverse,standout,italic ctermfg=default ctermbg=default
highlight OtherWin cterm=bold,underline,reverse,standout,italic ctermfg=default ctermbg=default
