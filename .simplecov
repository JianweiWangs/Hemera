SimpleCov.start do
  add_group 'lib', 'hemera/source'
  add_filter '/template/'
  add_filter '/command/'
  add_filter '/spec/'
  add_filter '/tool/'
end