require 'pry'
require "yaml"

def load_library(file_path)
  library = YAML.load_file(file_path)
  hash = {"get_meaning" => {},
          "get_emoticon" => {}
         }
  library.each do |meaning, description|
    english = description[0]
    japanese = description[1]
    hash["get_meaning"][japanese] = meaning
    hash["get_emoticon"][english] = japanese
  end
  return hash
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  smiley = library["get_emoticon"][emoticon]
  if smiley
    smiley
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  smiley = library["get_meaning"][emoticon]
  if smiley
    smiley
  else
    return "Sorry, that emoticon was not found"
  end
end

