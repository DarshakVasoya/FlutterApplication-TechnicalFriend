import json

with open("price.json") as outfile1:
    file_data = json.load(outfile1)
a=list(file_data.keys())

# don={}
#
# for i in a:
#     o=file_data[i]
#     don[i]=o['price']
# with open("price.json", 'w') as file:
#     json.dump(don, file, indent=4)
#price

p25 = [
    'Realme X3',
    'OnePlus Nord',
    'Samsung Galaxy M51',
    'Xiaomi Redmi K20 Pro',
    'Xiaomi Poco X2 256GB',
    'Samsung Galaxy A70s',
    'Realme X2 8GB RAM',
    'OPPO Reno 2F',
    'Honor 20',
    'Xiaomi Redmi K20'
]
p5 = [
    'Xiaomi Redmi Go',
    'Asus Zenfone Lite L1 ',
    'Meizu C9',
    'Yu Ace',
    'Infinix Smart 2',
    'XOLO Era 4X',
    'Intex Aqua Selfie',
    'Intex Aqua S3',
    'Nokia 1',
    'Micromax Bharat Go'
]
p10 = [
    'Xiaomi Redmi 9 Prime',
    'Realme C12',
    'Xiaomi Redmi 9',
    'Infinix Smart 4 Plus',
    'Xiaomi Redmi 9A',
    'Tecno Spark Power 2',
    'Xiaomi Redmi 8',
    'Tecno Spark 6 Air',
    'Samsung Galaxy M10s',
    'Asus Zenfone Max Pro M2'
]
p15 = [
    'Realme 7',
    'Xiaomi Redmi Note 9 Pro',
    'Xiaomi Poco M2 Pro',
    'Realme 6',
    'Samsung Galaxy M30s',
    'OPPO A53 2020',
    'Realme 6i',
    'Xiaomi Redmi Note 9',
    'Realme Narzo 10',
    'Vivo Z1 Pro'
]
p20 = [
    'Xiaomi Poco X2',
    'Realme X2',
    'Samsung Galaxy M31s',
    'Realme 6 Pro',
    'Xiaomi Redmi Note 9 Pro Max',
    'Asus Zenfone 5Z',
    'Realme XT',
    'Samsung Galaxy M31'
]
for i in p10:
    if (i in a):
        print("ok")
    else:
        print(i)

