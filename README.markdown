# tomdoc.vim

![A tomdoc.vim
preview.](http://cl.ly/0m3L021g1u0Z3e2V3M25/Screen%20Shot%202012-03-01%20at%2011.59.48%20PM.png)

## Purpose

Tomdoc.vim is a syntax add-on for vim designed to parse [TomDoc][tomdoc] comments.
Since TomDoc is designed to be read in the code, it makes sense that we
would want these comments to be as enjoyable to read from the editor as
possible. The only thing this project will ever do is try to make your
TomDocs pretty, so that you get more enjoyment out of using them.

## Get it

You can either just throw after/syntax/ruby.vim into your ~/.vim folder, or you
could use something better like Vundle (highly recommended) or Pathogen
(somewhat less highly recommended) to manage this package for you. It
should be compatible with both.

## Known issues

The filters aren't as selective as I would like. I'm not sure how best to
address some of them, and it may just be that the syntax highlighting is
forever buggy because comments are the realm of plain English... and we all know
how much that sucks.

## Contributions

If tomdoc.vim interests you and you think you might want to contribute, hit me up
over Github. You can also just fork it and make some changes, but there's a
better chance that your work won't be duplicated or rendered obsolete if you
check in on the current development status first.

## Development Notes

I normally try to TDD, but I'm not sure how to write tests for a vim syntax
file. So note that there's a test.rb file available in this repository - it has
some TomDoc-style comments in it and is very valuable for a quick check to make
sure the syntax highlighting is working the way you want it to when you make
changes.

## License
Copyright (C) 2012 by Tommy Morgan

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

[tomdoc]: http://tomdoc.org/
