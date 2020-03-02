set laststatus=2
set showtabline=2
" Statusline colors
hi Base guibg=None guifg=#212333
hi Git guibg=#292d3e guifg=#929dcb
hi Path guifg=#94b3a8 guibg=#242323 gui=bold
hi PathSep guifg=#242323
hi Filetype guibg=None guifg=#cccccc  gui=bold
hi TotalLine guibg=None guifg=#89a19d gui=bold
hi LineCol guibg=None guifg=#929dcb gui=bold
hi TabLineSelSep gui=bold guifg=#c678dd
hi TabLineSep guifg=#3e4452
" Get current mode
let g:currentmode={
      \'n' : 'Normal ',
      \'no' : 'N·Operator Pending ',
      \'v' : 'Visual ',
      \'V' : 'V·Line ',
      \'^V' : 'V·Block ',
      \'s' : 'Select ',
      \'S': 'S·Line ',
      \'^S' : 'S·Block ',
      \'i' : 'Insert ',
      \'R' : 'Replace ',
      \'Rv' : 'V·Replace ',
      \'c' : 'Command ',
      \'cv' : 'Vim Ex ',
      \'ce' : 'Ex ',
      \'r' : 'Prompt ',
      \'rm' : 'More ',
      \'r?' : 'Confirm ',
      \'!' : 'Shell ',
      \'t' : 'Terminal '
      \}

function! RedrawModeColors(mode)
  " Normal mode
  if a:mode == 'n'
    hi Mode guibg=#98c379 guifg=#282c34 gui=bold
    hi ModeSep guibg=None guifg=#98c379  gui=bold
  " Insert mode
  elseif a:mode == 'i'
    hi Mode guibg=#61afef guifg=#282c34 gui=bold
    hi ModeSep guibg=None guifg=#61afef   gui=bold
  " Replace mode
  elseif a:mode == 'R'
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
    hi Mode guibg=#c678dd guifg=#282c34 gui=bold
    hi ModeSep guibg=None guifg=#c678dd    gui=bold
  " Command mode
  elseif a:mode == 'c'
    hi Mode guibg=#d19a66 guifg=#282c34 gui=bold
    hi ModeSep guibg=None guifg=#d19a66    gui=bold
  " Terminal mode
  elseif a:mode == 't'
    hi Mode guibg=#e06c75 guifg=#283c34 gui=bold
    hi ModeSep guibg=None guifg=#e06c75    gui=bold
  endif
  " Return empty string so as not to display anything in the statusline
  return ''
endfunction

" Get current mode
function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Get current filetype
function! CheckFT(filetype)
  if a:filetype == ''
    return '-'
  else
    return tolower(a:filetype)
  endif
endfunction

" Check modified status
function! CheckMod(modi)
  if a:modi == 1
    hi Modi guifg=#d6d6d6  guibg=#424242
    hi ModiSep guifg=#424242
    hi Filename guifg=#8da189  guibg=#000000
    if expand('%:t') == ""
        return "No Name"
    endif
    return expand('%:t').'*'
  else
    hi Modi guifg=#d6d6d6 guibg=#424242
    hi ModiSep guifg=#424242
    hi Filename guifg=#8da189 guibg=#000000
    if expand('%:t') == ""
        return "No Name"
    endif
    return expand('%:t')
  endif
endfunction

function! WorkingDir()
    if fnamemodify(getcwd(), ":~:.") == ""
        return $HOME
    endif
    return fnamemodify(getcwd(), ":~:.")
endfunction

" Set active statusline
function! ActiveLine()
  " Set empty statusline and colors
  let statusline = ""
  let statusline .= "%{RedrawModeColors(mode())}"

  let statusline .= "%#Base#"

  " Current mode
  let statusline .= "%#ModeSep#"
  let statusline .= "%#Mode# %{ModeCurrent()}"
  let statusline .= "%#ModeSep#"

  " Current modified status and filename
  let statusline .= " "
  let statusline .= "%#ModiSep#"
  let statusline .= "%#Modi# %{CheckMod(&modified)}"
  let statusline .= "%#ModiSep#"

  let statusline .= " "
  let statusline .= "%#PathSep#"
  let statusline .= "%#Path# %{WorkingDir()} "
  let statusline .= "%#PathSep#"

  let statusline .= "%#Base#"

  " Align items to right
  let statusline .= "%="


  " Current filetype
  let statusline .= "%#Filetype# Filetype: %{CheckFT(&filetype)} "

  " Current line and column
  let statusline .= "%#LineCol# Ln %l, Col %c "

  return statusline
endfunction

function! InactiveLine()
  " Set empty statusline and colors
  let statusline = ""
  " Full path of the file
  let statusline .= "%#Filename# %F "

  return statusline
endfunction

" Change statusline automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END

function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    if fnamemodify(bufname(buflist[winnr - 1]), ":p:t") == ""
        return "No Name"
    endif
    return fnamemodify(bufname(buflist[winnr - 1]), ":p:t")
endfunction


function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
    " select the highlighting
        if i + 1 == tabpagenr()
            let s .= "%#TabLineSelSep#"
            let s .= '%#TabLineSel#'
        else
            let s .= "%#TabLineSep#"
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T '

        " the label is made by MyTabLabel()
        let s .= i+1 . '.%{MyTabLabel(' . (i + 1) . ')} '
        if i + 1 == tabpagenr()
            let s .= "%#TabLineSelSep# "
        else
            let s .= "%#TabLineSep# "
        endif
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= "%#TabLineFill#"
    return s
endfunction

set tabline=%!MyTabLine()
