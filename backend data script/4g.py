import json
with open("sample.json") as outfile1:
    file_data = json.load(outfile1)

#
for i in list(file_data.keys()):
    if "." in str(i):
        print(i)
#
# with open("sample.json", 'w') as file:
#     json.dump(file_data, file, indent=4)
