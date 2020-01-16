require "yaml"
require 'pry'
# require modules here

def load_library(path)
 emoji = YAML.load_file(path)
  # code goes here
  new_hash = {'get_meaning' => {}, 'get_emoticon' => {}
} 
  emoji.each do |key, value|
    new_hash['get_meaning'][value[1]] =  key
    new_hash['get_emoticon'][value[0]] = value[1]
   
  end
  new_hash
 end 

def get_japanese_emoticon(path,emoji)
  load_library(path)
  # code goes here
   product = load_library(path)['get_emoticon'][emoji]
  product ? product : "Sorry, that emoticon was not found"
end

def get_english_meaning(path,emoji)
  # code goes here
   product = load_library(path)['get_meaning'][emoji]
  product ? product : "Sorry, that emoticon was not found"
end