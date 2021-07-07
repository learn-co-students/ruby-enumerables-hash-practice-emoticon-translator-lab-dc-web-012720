require 'yaml'
require 'pp'
require 'pry'
# require modules here


def load_library(file_name)
  lib_hash = {:get_meaning => {}, :get_emoticon => {}}
  
  emotes = YAML.load_file(file_name)
  
  emotes.each_key do |key|
    lib_hash[:get_meaning][emotes[key][1]] = key
    lib_hash[:get_emoticon][emotes[key][0]] = emotes[key][1]
  end
  
  lib_hash
end

def get_japanese_emoticon(file_name, e_emoticon)
  hash = load_library(file_name)
  

  hash.each_key do |key|
    if key == :get_emoticon
      hash[key].each_key do |emote|
        if emote == e_emoticon
          return hash[key][emote]
        end
      end
    end
  end
  
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_name, j_emoticon)
  hash = load_library(file_name)
  
  hash.each_key do |key|
    if key == :get_meaning
      hash[key].each_key do |emote|
        if emote == j_emoticon
          return hash[key][emote]
        end
      end
    end
  end
  
  return "Sorry, that emoticon was not found"
end