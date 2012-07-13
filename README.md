# vim-djazz

A plugin that helps you write (x)HTML and Django templates faster.
Also, my first attempt at writing a Vimscript.


## Installing

Installing is really simple if you use pathogen.vim

    $ cd ~/.vim/bundle
    $ git clone git://github.com/babab/vim-djazz.git

If you don't (want to) use pathogen.vim or similar plugins you can source
the vim-djazz.vim file in your `.vimrc` after downloading it.

    source /path/to/vim-djazz/plugin/vim-djazz.vim


## Getting help

If you use pathogen.vim make sure to run `:Helptags` at least once after
installing to make the help command available.

Get help in Vim by running `:help djazz.txt`


## Creating (x)HTML in normal mode

### ;hh

Create html tag from current line.

### ;hn

 Create html tag from current line and add end tag on next line.

### ;hj

Create html tag from current line and ask for values of id, class and name
attributes

### ;hy

Create html tag from current line and ask for values of id, class and name
attributes. Add end tag on next line.


## Creating Django specific template entities in normal mode

### ;dd

Create django {{ tag }} from current line. Whitespace around tag can be
optionally removed by executing ':call DjazzSetTagWhitespace(0)'

### ;dc

Create block tag from current line and add endblock tag on next line.

### ;de

Create django {% tag %} from current line.


## Creating Django specific template entities in insert mode

The following keysequences will trigger functions to help you write faster.

### {%

Ask for name and create {% name %} tag.

### {{

Ask for name and create {{ name }} tag.  Whitespace around tag can be
optionally removed by executing ':call DjazzSetTagWhitespace(0)'

### {block

Ask for name and create {% block name %} {% endblock %} section.

### {for

Ask for name and create {% for i in name %} {% endfor %} section.


## License

Copyright (c) 2012 Benjamin Althues <benjamin@babab.nl>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
