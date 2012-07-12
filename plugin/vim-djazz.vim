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
" Version:    0.1

function DjangoTemplateTag()
    " Ask for name and create proper django template tag
    let name = input("Tagname: ")
    return "{% " . l:name . " %}"
endfunction

function DjangoTemplateVar()
    " Ask for name and create proper django template variable (tag)
    let name = input("Varname: ")
    return "{{ " . l:name . " }}"
endfunction

function DjangoTemplateForLoop()
    let name = input("Varname: ")
    "let i = input("Iterator [default = i]: ")
    let i = 'i'
    return "{% for " . l:i . " in " . l:name . " %}\<CR>"
        \ . "{% endfor %}\<Esc>"
endfunction

function DjangoTemplateBlock()
    let name = input("Blockname: ")
    return "{% block " . l:name . " %}\<CR>"
        \ . "{% endblock %}\<Esc>"
endfunction

imap <silent> {% <C-R>=DjangoTemplateTag()<CR>
imap <silent> {{ <C-R>=DjangoTemplateVar()<CR>
imap <silent> {for <C-R>=DjangoTemplateForLoop()<CR>
imap <silent> {block <C-R>=DjangoTemplateBlock()<CR>
