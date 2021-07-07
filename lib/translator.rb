require 'yaml'

def load_library(file_path)
  file = YAML.load_file(file_path)
  # p file
  hash = {
    :get_meaning => {},
    :get_emoticon => {}
  }
  file.each { |key, value|
    hash[:get_meaning][value[1]] = key
    hash[:get_emoticon][value[0]] = value[1]
  }
  hash
end


def get_japanese_emoticon(file_path, emoticon)
  file = load_library(file_path)
  if file[:get_emoticon][emoticon]
    return file[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  file = load_library(file_path)
  if file[:get_meaning][emoticon]
    return file[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)")