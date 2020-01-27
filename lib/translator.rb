require 'pry'
require "yaml"

def load_library(file_path)
  library = YAML.load_file(file_path)  
  result = {}
  result[:get_meaning] = {}
  result[:get_emoticon] = {}
  library.each { |key, value| result[:get_meaning][value[1]] = key }
  library.each { |key, value| result[:get_emoticon][value[0]] = value[1] }
  result
end

def get_japanese_emoticon(file_path, emoticon)
  new_library = load_library(file_path)
  a = new_library[:get_emoticon][emoticon]
  if !a 
    a = "Sorry, that emoticon was not found"
  end
  a
end

def get_english_meaning(file_path, emoticon)
  new_library = load_library(file_path)
  b = new_library[:get_meaning][emoticon]
  if !b 
    b = "Sorry, that emoticon was not found"
  end
  b
end
