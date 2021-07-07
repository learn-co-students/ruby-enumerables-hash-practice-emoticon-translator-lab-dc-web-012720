# require modules here

require "yaml"

def load_library(file_path)
  # code goes here
  library = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
 result
end

def get_japanese_emoticon(file_path, eng_emoticon)
  # code goes here
   library = load_library(file_path)
   
  if library["get_emoticon"].include?(eng_emoticon)
    library["get_emoticon"][eng_emoticon]
    
  else
    p "Sorry, that emoticon was not found"
  end 
end 



def get_english_meaning(file_path, jap_emoticon)
  # code goes here
  library = load_library(file_path)
  if library["get_meaning"].include?(jap_emoticon)
    library["get_meaning"][jap_emoticon]
  else
    p "Sorry, that emoticon was not found"
  end 
end
