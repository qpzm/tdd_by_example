watch('(.*).rb') { | match_data |
  klass = match_data[1]
  if match_data[1].end_with? 'test'
    klass = match_data[1].delete_suffix '_test'
  end
  system("ruby #{klass}_test.rb")
}
