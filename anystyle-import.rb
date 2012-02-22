# encoding: UTF-8
# this was written by Stian Haklev (shaklev@gmail.com), licensed as do what you want with it

# typically called through a keyboard shortcut, this script takes the text from the clipboard. 
# if the text contains a DOI, it uses crossref to lookup the DOI (note that crossref requires an API)
# if not, it uses the anystyle-parser library to try to parse the text citation
# the output is a bibtex citation which can be imported into for example BibDesk

# for free-text lookup, anystyle-parser is required (https://github.com/inukshuk/anystyle-parser) 
# gem install anystyle-parser

# to use the crossref API, you need to request an API key here: http://www.crossref.org/requestaccount/

Crossref_API = "YOUR_API_KEY"

$:.push(File.dirname($0))
require 'utility-functions'

# get text from clipboard
search = utf8safe(pbpaste)

# if doi
if search.index("doi:")
  require 'doi-bibtex'
  bibtex = lookup_doi(search, Crossref_API)
  growl "Failure", "DOI lookup not successful" unless bibtex

# else parse freetext
else
  require 'anystyle/parser'   
  bibtex = Anystyle.parse(search, :bibtex).to_s
end

# put resulting bibtex on clipboard
pbcopy (bibtex)