# require modules here
require "yaml"
def load_library(file_path)
  collection = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  collection.each do |means, emoticons|
    result["get_meaning"][emoticons[1]] = means
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  result
end

def get_japanese_emoticon(file_path , western_emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].include?(western_emoticon) 
    library["get_emoticon"][western_emoticon]
  elsif !library["get_emoticon"].include?(western_emoticon)
     "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  if library["get_meaning"].include?(emoticon)
    library["get_meaning"][emoticon]
  else 
    "Sorry, that emoticon was not found"
  end
end