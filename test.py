import re 
file_path = input("path to file: ")
with open(file_path, "r") as file:
    html = file.read()
    tags = re.findall(r"\s*<(\w+)[^>]*>", html)
    print(tags)
print(len(tags))