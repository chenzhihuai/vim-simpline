set laststatus=2
"set fillchars+=stl:─,stlnc:─,fold:\ ,vert:│
"hi StatusLine cterm=none ctermbg=none ctermfg=187
"hi StatusLineNC cterm=none ctermbg=none ctermfg=137
"hi StatusLine cterm=none ctermbg=none ctermfg=137
"hi StatusLineNC cterm=none ctermbg=none ctermfg=187 ctermfg=102  guifg=#928374
"filename
hi default link User1 CursorLineNr
"hi User1 term=standout ctermbg=237 guibg=#3c3836
" flags
hi default link User2 Statement
" errors
hi default link User3 Error
" fugitive
hi default link User4 Special


"set statusline=%2.n:%<<\ %t%2*%(\ %H%W%M%R%)%*\ >
" 2. filename.txt [+,RO] -----------
set statusline=%2.n:%<%1*\ %f\ %*%(%2*[%H%W%M%R]%*\ %)
set statusline+=%=

set statusline+=\ %{&ff}%{strlen(&fenc)?':'.&fenc:''}
set statusline+=\ (%2l,%2c)\ [#%{winnr()}]\ 

"set statusline+=\ %{&paste?'[paste]':''}
function! Stl_P()
    let above = line('w0') - 1
    let below = line('$') - line('w$')
    if below <= 0
        return above ? 'Bot' : 'All'
    elseif above <= 0
        return 'Top'
    else
        let perc=above > 1000000 ?
            \ above / ((above + below) / 100) :
            \ above * 100 / (above + below)
        return perc <10 ? perc . '%' : perc . '%'
    endif
endfunction


funct! Exec(command)
    redir =>output
    silent exec a:command
    redir END
    let @o = output
    execute "put o"
    return ''
endfunct!
command! -nargs=+ Execput call Exec(<args>)
