" vim-djazz.vim - Speed up your Django writing
"
" Copyright (c) 2012 Benjamin Althues <benjamin@babab.nl>
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
"
" Maintainer: Benjamin Althues <http://babab.nl/>
" Version:    0.1-dev


"---- Settings and setters ---------------------------------------------------

let b:whitespace = 1
let b:xhtml = 0

function DjazzSetTagWhitespace(bool)
    let b:whitespace = a:bool != 0 ? 1 : 0
endfunction

function DjazzSetXhtml(bool)
    let b:xhtml = a:bool != 0 ? 1 : 0
endfunction


"---- HTML editing functions -------------------------------------------------

function DjazzHtmlTag(...)
    if a:0
        call setline('.', substitute(a:1, "[a-z].*", "<\\0>", ""))
    else
        call setline('.', substitute(getline('.'), "[a-z].*", "<\\0>", ""))
    endif
endfunction

function DjazzHtmlTagWithEnding()
    let l:name = getline('.')
    call DjazzHtmlTag(l:name)
    call append('.', substitute(l:name, "[a-z].*", "</\\0>", ""))
endfunction


"---- Django specific editing functions --------------------------------------

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
    let wsp = b:whitespace == 1 ? ' ' : ''

    if l:inp == '__input'
        let name = input("Varname: ")
        return "{{" . l:wsp . l:name . l:wsp . "}}\<Esc>"
    elseif l:inp == '0'
        let l:name = getline('.')
        if b:whitespace
            call setline('.', substitute(l:name, "[a-z].*", "{{ \\0 }}", ""))
        else
            call setline('.', substitute(l:name, "[a-z].*", "{{\\0}}", ""))
        endif
        return
    endif

    call setline('.', "{{" . l:wsp . l:inp . l:wsp . "}}")
endfunction

function DjazzForLoop()
    let name = input("Varname: ")
    let i = 'i'
    return "{% for " . l:i . " in " . l:name . " %}\<CR>"
        \ . "{% endfor %}\<Esc>"
endfunction

function DjazzBlock()
    let name = input("Blockname: ")
    return "{% block " . l:name . " %}\<CR>"
        \ . "{% endblock %}\<Esc>"
endfunction


"---- Keybindings ------------------------------------------------------------

" HTML editing keybindings (normal mode)
nnoremap <silent> ;hh :call DjazzHtmlTag()<CR>
nnoremap <silent> ;hn :call DjazzHtmlTagWithEnding()<CR>

" Django specific editing keybindings (normal mode)
nnoremap <silent> ;de :call DjazzTag()<CR>
nnoremap <silent> ;dd :call DjazzVar()<CR>

" Django specific editing keybindings (input mode)
imap <silent> {% <C-R>=DjazzTag('__input')<CR>
imap <silent> {{ <C-R>=DjazzVar('__input')<CR>
imap <silent> {for <C-R>=DjazzForLoop()<CR>
imap <silent> {block <C-R>=DjazzBlock()<CR>
