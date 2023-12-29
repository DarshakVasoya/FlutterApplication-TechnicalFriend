import json

with open("sample.json") as outfile1:
    file_data = json.load(outfile1)
a=list(file_data.keys())
j=0
for i in a:
    if("Xiaomi Redmi Note 6 Pro (6GB RAM, 64GB)"==i):
        print(j)
    j=j+1
