# require modules here

require "yaml"

def load_library(emoticon_file)
  hash = {}
  hash[:get_meaning] = {}
  hash[:get_emoticon] = {}
  emoticons = YAML.load_file(emoticon_file)
  emoticons.each do |key_description, array_EN_to_JPN|

    array_EN_to_JPN.each_with_index do |emoticon, index|
      if index == 1
        hash[:get_meaning][emoticon] = nil
      elsif index == 0
        hash[:get_emoticon][emoticon] = nil
      else
      end
    end
  end

  get_meaning_emotion_keys = hash.keys
  japanese_keys = hash[:get_meaning].keys
  english_keys = hash[:get_emoticon].keys
  english_emoticon_to_a = hash[:get_emoticon].to_a
  japanese_emoticon_to_a = hash[:get_meaning].to_a
  original_input_keys = emoticons.keys

  english_emoticon_to_a.each_with_index do |key_to_value, index| #index 0-12?
    key_to_value.each_with_index do |emote, index_of_emote| #index 0-1?
      if index_of_emote == 0
        japanese_emoticon_to_a[index][1] = original_input_keys[index]
      else
        english_emoticon_to_a[index][1] = japanese_keys[index]
      end
    end
  end

  h1 = Hash[japanese_emoticon_to_a.map {|key, value| [key, value]}]
  h2 = Hash[english_emoticon_to_a.map {|key, value| [key, value]}]
  japanese_array_to_hash = h1
  english_array_to_hash = h2
  hash[:get_emoticon] = english_array_to_hash
  hash[:get_meaning] = japanese_array_to_hash
  return hash
end



def get_japanese_emoticon(file_path, emoticon)
  #returns japanese equivalent of whatever english emoticon you input
  x = load_library(file_path)
  
  array_keys = x.keys #=> [:get_meaning, :get_emoticon]
  value_found = false
  x[:get_emoticon].each do |key, value|
    if emoticon == key
      value_found = true
      return value
    end
  end
  
  if value_found == false
    return "Sorry, that emoticon was not found"
  end  

end

def get_english_meaning(file_path, emoticon)
  #returns english meaning of japanese emoticon
  x = load_library(file_path)
  
  array_keys = x.keys #=> [:get_meaning, :get_emoticon]
  value_found = false
  x[:get_meaning].each do |key, value|
    if emoticon == key
      value_found = true
      return value
    end
  end 
  
  if value_found == false
    return "Sorry, that emoticon was not found"
  end
end