require "yaml"

def load_library(filepath)
    file = YAML.load_file(filepath)

    count = 0
    hash1 = {}
    while count < file.keys.length do
        hash1[file[file.keys[count]][1]] = file.keys[count]
        count += 1
    end

    count = 0
    hash2 = {}
    while count < file.keys.length do
        hash2[file[file.keys[count]][0]] = file[file.keys[count]][1]
        count += 1
    end

    hash = {
      'get_meaning' => (hash1),
      'get_emoticon' => (hash2)
    }
    return hash
  end
  


def get_japanese_emoticon(filepath, emot)
    lib = load_library(filepath)
    
    if lib["get_emoticon"][emot]
      return lib["get_emoticon"][emot]
    else
      return "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(filepath, emot)
    lib = load_library(filepath)
      if lib["get_meaning"][emot]
        return lib["get_meaning"][emot]
      else
        return "Sorry, that emoticon was not found"
      end
end