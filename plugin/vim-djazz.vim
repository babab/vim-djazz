" vim-djazz.vim - Write Django templates faster

"++ License

" Copyright (c) 2012-2013  Benjamin Althues <benjamin@babab.nl>
"
" Permission to use, copy, modify, and distribute this software for any
" purpose with or without fee is hereby granted, provided that the above
" copyright notice and this permission notice appear in all copies.
"
" THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
" WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
" MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
" ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
" WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
" ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
" OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

" Maintainer: Benjamin Althues <http://babab.nl/>
" Version:    0.1

"+----------------------------------------------------------------------------
"++ Django specific editing functions ----------------------------------------

function DjazzTag(...)
    let inp = a:0 == 1 ? a:1 : '0'

    if l:inp == '__input'
        let name = input("Tagname: ")
        return "{% " . l:name . " %}\<Esc>"
    elseif l:inp == '0'
        call setline('.', substitute(getline('.'), "[a-z].*", "{% \\0 %}", ""))
        return
    endif

    call setline('.', "{% " . l:inp . " %}")
endfunction

function DjazzVar(...)
    let inp = a:0 == 1 ? a:1 : '0'

    if l:inp == '__input'
        let name = input("Varname: ")
        return "{{ " . l:name . " }}\<Esc>"
    elseif l:inp == '0'
        let l:name = getline('.')
        call setline('.', substitute(l:name, "[a-z].*", "{{ \\0 }}", ""))
        return
    endif

    call setline('.', "{{ " . l:inp . " }}")
endfunction

function DjazzForLoop()
    let name = input("Varname: ")
    let iterator = input("Iterator name [default = i]: ")
    let i = empty(l:iterator) ? 'i' : l:iterator
    return "{% for " . l:i . " in " . l:name . " %}\<CR>"
        \ . "{% endfor %}\<Esc>"
endfunction

function DjazzBlock(...)
    let inp = a:0 == 1 ? a:1 : '0'

    if l:inp == '__input'
        let name = input("Blockname: ")
        return "{% block " . l:name . " %}\<CR>"
            \ . "{% endblock %}\<Esc>"
    elseif l:inp == '0'
        let l:inp = substitute(getline('.'), "[a-z].*", "{% block \\0 %}", "")
    endif

    call setline('.', l:inp) | call append('.', "{% endblock %}")
endfunction


"+----------------------------------------------------------------------------
"++ Keybindings --------------------------------------------------------------

" Django specific editing keybindings (normal mode)
nnoremap <silent> ;dd :call DjazzVar()<CR>
nnoremap <silent> ;dc :call DjazzBlock()<CR>
nnoremap <silent> ;de :call DjazzTag()<CR>

" Django specific editing keybindings (input mode)
imap <silent> {{T <C-R>=DjazzTag('__input')<CR>
imap <silent> {{V <C-R>=DjazzVar('__input')<CR>
imap <silent> {{F <C-R>=DjazzForLoop()<CR>
imap <silent> {{B <C-R>=DjazzBlock('__input')<CR>

"+----------------------------------------------------------------------------
"++ Commands -----------------------------------------------------------------

command DjangoTag               call DjazzTag()
command DjangoVar               call DjazzVar()
command DjangoBlock             call DjazzBlock()

"+- vim: fdm=marker fmr="++,"+-:
