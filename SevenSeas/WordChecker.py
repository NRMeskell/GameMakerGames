import os
import re
import enchant

def check_file(root, file):
    if ("Save" in file) or ("Load" in file):
        return False
    if ("scripts" in root) and (("Shader" in file) or ("Sampler" in file) or ("Draw" in file)):
        return False
    if ("_" in root):
        return False
    if "Destroy" in file:
        return False
    return True


def check_line(line):
    if "==" in line or "!=" in line:
        return False
    if line.strip()[0:2] == "if":
        return False
    return True

def get_words(line):
    line = line.lower().replace("-"," ").replace("#"," ").replace("(","").replace(")","")
            
    strings = dict()
    while ("\"" in line):
        line = line[line.find("\"")+1:]
        if line.find("\"") != -1:
            addStrings = line[:line.find("\"")].split(" ")
            for word in addStrings:
                word = word.strip("*.,!?:;'[]{}()%-/#")
                if (len(word) > 0) and (not word.isdigit()):
                    if word not in strings.keys():
                        strings[word] = 1
                    else:
                        strings[word] = strings[word]+1
                        
        line = line[line.find("\"")+1:]
    return strings

def add_dicts(dict1, dict2):
    for key in dict2.keys():
        if key in dict1.keys():
            dict1[key] += dict2[key]
        else:
            dict1[key] = dict2[key]

def search_strings(dirc):
    words = dict()
                            
    # find updefined strings
    for root, dirs, files in os.walk(os.getcwd() + dirc):        
        for file in files:
            if (file[-3:] == "gml") and check_file(root, file):
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as file:
                    for line in file:
                        if check_line(line):
                            add_dicts(words, get_words(line))
    return words

  
def spell_check(dirc):
    d = enchant.Dict("en_US")
    
    for key in search_strings(dirc):
        if not d.check(key.upper()):
            print(key, d.suggest(key)[:3])

def frequency_check(dirs):
    words = dict()
    for dirc in dirs:
        add_dicts(words, search_strings(dirc))
        
    sorted_words = dict(sorted(words.items(), key=lambda item: item[1], reverse=True))
    i=0
    for key, value in sorted_words.items():
        if i>=100:
            print(key + ": ", value)
        i+=1
        if i>=200:
            return

def main():
    dirs = ["/objects","/scripts"]
    
    choice = input("(1) Run Spell Checker \n(2) Get Word Count\n")
    if choice == "1":
        for dirc in dirs:
            spell_check(dirc)
    elif choice == "2":
        frequency_check(dirs)
    else:
        print("Invalid choice! Ending Program" )


main()
