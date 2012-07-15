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


## Getting help while editing

If you use pathogen.vim make sure to run `:Helptags` at least once after
installing to make sure the help file can be found.

Get help in Vim by running `:help djazz.txt`


## Creating plain old (x)HTML

### Single HTML tags

Create html tag from current line.

    <name>

* normal mode keybindig: `;hh`
* normal mode command: `:HtmlTag`


### HTML containers without arguments

Create html tag from current line and add end tag on next line.

    <name>
    </name>

* normal mode keybindig: `;hn`
* normal mode command: `:HtmlContainer`


### Single HTML tags with attributes

Create html tag from current line and ask for values of id, class and name
attributes.

    <name [id="asked"] [class="asked"] [name="asked"][ /]>

* normal mode keybindig: `;hj`
* normal mode command: `:HtmlAttTag`


### HTML containers with arguments

Create html tag from current line and ask for values of id, class and name
attributes. Add end tag on next line.

    <name [id="asked"] [class="asked"] [name="asked"]>
    </name>

* normal mode keybindig: `;hy`
* normal mode command: `:HtmlAttContainer`


## Creating Django specific template entities

### Django 'variable' tag

Create Django {{ tag }} from current line. Whitespace around tag can be
optionally removed by executing ':call DjazzSetTagWhitespace(0)'

    {{ name }}

* normal mode keybindig: `;dd`
* normal mode command: `:DjangoVar`
* insert mode keysequence: `{{`


### Django block

Create block tag from current line and add endblock tag on next line.

    {% block name %}
    {% endblock %}

* normal mode keybindig: `;dc`
* normal mode command: `:DjangoBlock`
* insert mode keysequence: `{block`


### Django tag

Create django {% tag %} from current line.

    {% name %}

* normal mode keybindig: `;de`
* normal mode command: `:DjangoTag`
* insert mode keysequence: `{%`


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
