" lsp
nnoremap <silent> gc <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gc <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
inoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> pd    <cmd>lua vim.lsp.buf.peek_definition()<CR>
nnoremap <silent> ]d :NextDiagnostic<CR>
nnoremap <silent> [d :PrevDiagnostic<CR>
nnoremap <silent> <leader>do :OpenDiagnostic<CR>
nnoremap <leader>dl <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
" nmap <silent> ]d <Plug>(ale_previous_wrap)
" nmap <silent> ]d <Plug>(ale_next_wrap)

" fzf
nmap <leader>ff :Files<CR>
nmap <leader>fg :GFiles<CR>
nmap <leader>fm :History<CR>
nmap <leader>fb :Buffer<CR>
nmap <leader>sn :Snippets<CR>
nmap <leader>ch :Chistory<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nmap <leader>ss :Rg<CR>
nmap <leader>sc :Rg <c-r>=expand("<cword>")<CR><CR>


" git
nmap <Leader>bt :BlamerToggle<CR>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <leader>ghp <Plug>(GitGutterPreviewHunk)
nmap <leader>ghu <Plug>(GitGutterUndoHunk)
nmap <leader>ghs <Plug>(GitGutterStageHunk)

" tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a<bar> :Tabularize /<bar><CR>
vmap <Leader>a<bar> :Tabularize /<bar><CR>


" vista
nmap <silent> <leader>v :Vista!!<CR>
nmap <leader>sf :Vista finder<CR>

nmap <leader>es :UltiSnipsEdit<CR>

" Dispatch
" pandoc
autocmd Filetype markdown nnoremap  <leader>pdf :Dispatch pandoc -s -o %<.pdf % --pdf-engine=xelatex
            \ --template eisvogel --listings --toc --number-sections<CR>
autocmd Filetype markdown nnoremap  <leader>bmr :Dispatch pandoc -t beamer --pdf-engine=xelatex -o %<.pdf % <CR>

" c, cpp
autocmd Filetype cpp nnoremap <leader>mk :Dispatch make<CR>
autocmd Filetype c nnoremap <leader>mk :Dispatch make<CR>
autocmd Filetype rust nnoremap <leader>rc :Dispatch cargo check<CR>

" tmux like terminal
tnoremap <c-a><CR> <C-\><C-n>

nmap <c-n> :tabnew term://zsh<CR>
" tmap <c-n> <c-a><CR>:tabnew term://zsh<CR>i
tmap <c-a>v <c-a><CR>:vsplit term://zsh<CR>i
tmap <c-a>x <c-a><CR>:split term://zsh<CR>i
nmap <c-a>] :+tabmove<cr>
nmap <c-a>[ :-tabmove<cr>
tmap <c-a>] <c-a>:+tabmove<cr>
tmap <c-a>[ <c-a>:-tabmove<cr>
tmap <c-a>j <c-a><CR><c-w>j
tmap <c-a>k <c-a><CR><c-w>k
tmap <c-a>h <c-a><CR><c-w>h
tmap <c-a>l <c-a><CR><c-w>l
tmap <c-a>J <c-a><CR><c-w>J
tmap <c-a>K <c-a><CR><c-w>K
tmap <c-a>H <c-a><CR><c-w>H
tmap <c-a>L <c-a><CR><c-w>L

nmap <c-a>L :+tabmove<cr>
nmap <c-a>H :-tabmove<cr>

function! ClosingTerminal()
    let answer = confirm('closing this terminal?', "&Yes\n&No", 1)
    if answer == 1
        bwipeout!
    endif
endfunction
nmap <c-q> :call ClosingTerminal()<CR>
tmap <c-q> <c-a><CR>:call ClosingTerminal()<CR>

function! ClosingTab()
    let answer = confirm('closing this tab?', "&Yes\n&No", 1)
    if answer == 1
        tabc
    endif
endfunction
nmap <c-a>x :call ClosingTab()<CR>
tmap <c-a>x <c-a><CR>:call ClosingTab()<CR>

nmap } gt
nmap { gT
tmap } <c-a><CR>gt
tmap { <c-a><CR>gT
nmap <c-a>1 1gt
tmap <c-a>1 <c-a><CR>1gt
nmap <c-a>2 2gt
tmap <c-a>2 <c-a><CR>2gt
nmap <c-a>3 3gt
tmap <c-a>3 <c-a><CR>3gt
nmap <c-a>4 4gt
tmap <c-a>4 <c-a><CR>4gt
nmap <c-a>5 5gt
tmap <c-a>5 <c-a><CR>5gt

" term-nvim
nmap tt :TermToggle<CR>
nmap t<CR> :TermSend<Space>
nmap tl :TermSend !!<CR>
nmap tk :TermKill<CR>
nmap tc :TermSend clear<CR>
autocmd FileType python nmap <buffer> <leader>tr :TermSend python %<CR>
autocmd FileType sh nmap <buffer> <leader>tr:TermSend bash %<CR>
autocmd FileType rust nmap <buffer> <leader>tr:TermSend cargo run<CR>
autocmd FileType lua nmap <buffer> <leader>tr:TermSend lua %<CR>
" REPL support nmap <leader>rl :TREPLSendLine<CR>
" vmap <leader>rs :TREPLSendSelection<CR>
" nmap <leader>rq :T exit()<CR>

" floatLf
nmap \ :LfToggle<CR>
nmap <leader>\ :LfToggleCurrentBuf<CR>
let g:floatLf_lf_close = '\'


" leetcode cli
nmap <localleader>lt :T leetcode test %<CR>
nmap <localleader>ls :T leetcode submit %<CR>

nmap <leader>cd :cd %:p:h<CR>
nmap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nmap ]e  :<c-u>execute 'move +'. v:count1<cr>
nmap + <C-w>+
nmap - <C-w>-
nmap S :%s//g<left><left>
nmap <Leader>+ 20+ 
nmap <Leader>- 20- 
nmap <left> <C-w>>
nmap <right> <C-w><
nmap <silent><Leader>h <C-w>h
nmap <silent><Leader>j <C-w>j
nmap <silent><Leader>k <C-w>k
nmap <silent><Leader>l <C-w>l
nmap <Leader>y "+yy
vmap <Leader>y "+y
nmap <leader>qj <C-w>j:q<CR>
nmap <leader>qh <C-w>h:q<CR>
nmap <leader>qk <C-w>k:q<CR>
nmap <leader>ql <C-w>l:q<CR>
nmap <leader>= <c-w>=
noremap ' ;
noremap ; :


nmap ]b :bnext<CR>
nmap [b :bprevious<CR>
nmap ]q :cnext<CR>
nmap [q :cprevious<CR>


inoremap jk <Esc>`^
inoremap JK <Esc>`^
nmap <leader>n :noh<CR><Esc>
nmap x "_dl
nmap <leader>so :source ~/.config/nvim/init.vim<CR>
nmap <leader>cof :e ~/.config/nvim/init.vim<CR>
nmap <leader>et :e ~/org/todo.org<CR>
nmap <leader>wo <C-w>o
nmap <leader>bc :bd<CR>
nmap <leader>w :w<CR>
nmap :: :<c-f>
nmap Y y$
