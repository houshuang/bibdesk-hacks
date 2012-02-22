# various utility functions

# writes text to clipboard, using a pipe to avoid shell mangling
def pbcopy(text)
  IO.popen("pbcopy","w+") {|pipe| pipe << text}
end

# retrieves text from clipboard
def pbpaste
  IO.popen('pbpaste', 'r+').read
end

# shows notification on screen. one or two arguments, if one, just shows a message, if two, the first is the title
# notice the path to growl (growlnotify has to be installed -- http://growl.info/)
def growl(title,text='')
  if text == ''
    text = title
    title = ''
  end
  `/usr/local/bin/growlnotify -t "#{title}" -m "#{text}"` if File.exists?("/usr/local/bin/growlnotify")
end

# turns a string into UTF8, looses all non-ASCII I think. Ruby 1.9 complains a lot about strings from clipboard etc
def utf8safe(text)
  require 'iconv'
  ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
  return ic.iconv(text + ' ')[0..-2]
end
