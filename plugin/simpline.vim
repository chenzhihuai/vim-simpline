set laststatus=2
set fillchars+=stl:─,stlnc:─,fold:\ ,vert:│
hi StatusLine cterm=none ctermbg=none ctermfg=187
hi StatusLineNC cterm=none ctermbg=none ctermfg=137
"filename
hi default link User1 SignColumn
" flags
hi default link User2 Statement
" errors
hi default link User3 Error
" fugitive
hi default link User4 Special

set statusline=%2.n\ 
set statusline+=%t\ 
"set statusline+=%1*%t%*\ 
set statusline+=%2*%h%w%m%r%*\ 
set statusline+=%<%=
set statusline+=

set statusline+=\ %{&ff}%{strlen(&fenc)?':'.&fenc:''}
set statusline+=\ (%l,%c)\ [#%{winnr()}]\ 
