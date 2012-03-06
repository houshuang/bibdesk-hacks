This is just a collection of small Ruby hacks for BibDesk. Most are taken from my integrated research workflow
[researchr](http://github.com/houshuang/folders2web) ([screencast](http://reganmian.net/wiki/researchr:start)).

The first script is anystyle-import.rb, which takes copied text and looks up DOIs using a web service (dx.doi.org using content negotiation), or using the anystyle parser, which tries to understand pure text.

Usage: It reads from clipboard, and if successful writes BibTeX to clipboard (this can easily be changed). In its current incarnation, it can for example be used by Keyboard Maestro to first select some text, hit a keyboard shortcut, run it through this script, and then paste the result into for example BibDesk.

See the keyboard_maestro_screenshot.png for an example of how to configure Keyboard Maestro.

To use this script you need the following gems: (use gem install GEM, or sudo gem install GEM)
- anystyle-parser
- xml-simple

Everything is licensed under the public domain.
shaklev@gmail.com 2012