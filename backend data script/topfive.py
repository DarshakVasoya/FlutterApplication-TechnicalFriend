# import bs4
# import json
# import requests
# import html5lib
from  firebase import firebase
#
firebase = firebase.FirebaseApplication('https://technical-friend-5a7b7.firebaseio.com', None)
x=[5000,10000,12000,15000,20000,25000,30000,40000,50000,60000,70000,80000,90000,100000]

#
# i=0
#
# all = {}
# while len(x)>i:
#     all_mobile = []
#
#     mainlink="https://www.91mobiles.com/top-10-mobiles-below-"+str(x[i])+"-in-india"
#     main=requests.get(mainlink)
#     code_main = main.content
#     soup_main = bs4.BeautifulSoup(code_main, 'html.parser')
#     soup_main = soup_main.find('table', attrs={'class': 'table'})
#     name=soup_main.find('tbody').find('tr')
#     j=0;
#     index={}
#     while j<5:
#         last = {}
#         name2=name.find('td').string
#         price=name.find('td').find_next_sibling('td').string
#         j=j+1
#         name=name.find_next_sibling()
#         all_mobile.append(name2)
#         last["price"]=price
#         last["name"]=name2
#         print("\""+name2+"\":\""+price+"\"");
#         index[str(j)]=last
#         # print(str(j+1)+". "+price + "" + name2)
#     # print(last)
#     # print(last)
#     # result = firebase.put('/topfive/',x[i],last)
#     all[str(x[i])]=index
#     print("--------------")
#     result = firebase.put('/topfive/', x[i], index)
#     # print("-----------")
#     i=i+1
#
# #
#aa code ruuning j 6

# # a5={ 1:{'name':'Panasonic Eluga Ray 810','price':'Rs. 7499'},2: {'name': 'Lava Z53', 'price': 'Rs. 5,499'},3: {'name': 'Tecno Spark Go 2020', 'price': 'Rs. 6,799'},4:{'name': 'Redmi 8A', 'price': 'Rs. 6,999'},5:{'name': 'Lava Z41', 'price': 'Rs. 4,199'}}
# a5={
#
#     1: {'name': 'Panasonic Eluga Ray 810', 'price': 'Rs. 7499'},
#     2:{'name': 'Lava Z53', 'price': 'Rs. 5,499'},
#     3: {'name': 'Tecno Spark Go 2020', 'price': 'Rs. 6,799'},
# 4:{'name': 'Redmi 8A', 'price': 'Rs. 6,999'},
#     5: {'name': 'Panasonic Eluga Ray 810', 'price': 'Rs. 7499'}
# # ,5:{'name': 'Samsung Galaxy M30', 'price': 'Rs. 10,399'}
# }
# result = firebase.put('/topfive/Android/', x[0], a5)
#
#
a10={1:{'name': 'Xiaomi Redmi 9 Prime', 'price': 'Rs. 9,999'},
2:{'name': 'Realme Narzo 20A', 'price': 'Rs. 8,499'},
3:{'name': 'Realme C3', 'price': 'Rs. 8,649'},
4:{'name': 'Realme C15', 'price': 'Rs. 9,399'},
5:{'name': 'Realme C12', 'price': 'Rs. 8,999'}
}
result = firebase.put('/topfive/Android/', x[1], a10)

a12={

1:{'name': 'Realme 7i', 'price': 'Rs. 13,164'}
,2:{'name': 'Redmi Note 9', 'price': 'Rs. 11,999'}
,3:{'name': 'Redmi Note 7S', 'price': 'Rs. 9,868'}
,4:{'name': 'Xiaomi Redmi 9 Prime', 'price': 'Rs. 10,999'}
,5:{'name': 'Samsung Galaxy M30', 'price': 'Rs. 10,399'}
}
result = firebase.put('/topfive/Android/', x[2], a12)

a15={1:{'name': 'Redmi Note 9 Pro', 'price': 'Rs. 14,499'},
2:{'name': 'Realme Narzo 20', 'price': 'Rs. 10,499'},
3:{'name': 'Realme 6', 'price': 'Rs. 13,968'},
4:{'name': 'Samsung Galaxy M30s', 'price': 'Rs. 15,500'},
5:{'name': 'Realme 6i', 'price': 'Rs. 13,490'}}
result = firebase.put('/topfive/Android/', x[3], a15)

a25={1:{'name': 'Samsung Galaxy M51', 'price': 'Rs. 22,999'},
2:{'name': 'Motorola Moto G 5G', 'price': 'Rs. 20,999'},
3:{'name': 'Vivo V20', 'price': 'Rs. 24,990'},
4:{'name': 'OnePlus Nord', 'price': 'Rs. 24,999'}
,5:{'name': 'OnePlus Nord', 'price': 'Rs. 24,999'}}

result = firebase.put('/topfive/Android/', x[5], a25)

a30={

1:{'name': 'Realme X3 SuperZoom', 'price': 'Rs. 26,990'},
2:{'name': 'OnePlus Nord', 'price': 'Rs. 27,999'},
3:{'name': 'Realme X3', 'price': 'Rs. 24,499'},
4:{'name': 'Realme X2 Pro', 'price': 'Rs. 28,987'}
,5:{'name': 'OnePlus Nord', 'price': 'Rs. 24,999'}}


result = firebase.put('/topfive/Android/', x[6], a30)

a20={

1:{'name': 'Poco X3', 'price': 'Rs. 15,999'}
,2:{'name': 'Samsung Galaxy M31s', 'price': 'Rs. 19,499'}
,3:{'name': 'Poco X2', 'price': 'Rs. 14,999'}
,4:{'name': 'Samsung Galaxy M31 Prime', 'price': 'Rs. 16,499'}
,5:{'name': 'Realme Narzo 20 Pro', 'price': 'Rs. 14,999'}

}
result = firebase.put('/topfive/Android/', x[4], a20)


a40={

1:{'name': 'Oppo Reno 5 Pro 5G', 'price': 'Rs. 35,990'},
2:{'name': 'Samsung Galaxy S20 FE', 'price': 'Rs. 40,999'},
3:{'name': 'Samsung Galaxy S10', 'price': 'Rs. 39,999'},
4:{'name': 'OnePlus 8', 'price': 'Rs. 39,999'}
,5:{'name': 'OnePlus Nord', 'price': 'Rs. 24,999'}}


result = firebase.put('/topfive/Android/', x[7], a40)

a50={

1:{'name': 'OnePlus 7T Pro', 'price': 'Rs. 43,999'},
2:{'name': 'Samsung Galaxy S10e', 'price': 'Rs. 47,650'},
3:{'name': 'Realme X50 Pro 5G', 'price': 'Rs. 47,999'},
4:{'name': 'Asus ROG Phone 3', 'price': 'Rs. 46,999'}
,5:{'name': 'OnePlus Nord', 'price': 'Rs. 24,999'}}


result = firebase.put('/topfive/Android/', x[8], a50)

a60={

1:{'name': 'OnePlus 7T Pro McLaren Edition', 'price': 'Rs. 58,999'},
2:{'name': 'Samsung Galaxy Note 10+', 'price': 'Rs. 59,999'},
3:{'name': 'Samsung Galaxy S20', 'price': 'Rs. 58,999'},
4:{'name': 'Huawei P30 Pro', 'price': 'Rs. 56,490'}
,5:{'name': 'OnePlus Nord', 'price': 'Rs. 24,999'}}


result = firebase.put('/topfive/Android/', x[9], a60)


a70={

1:{'name': 'Samsung Galaxy S21', 'price': 'Rs. 69,999'},
2:{'name': 'Oppo Find X2', 'price': 'Rs. 57,990'},
3:{'name': 'OnePlus 8 Pro', 'price': 'Rs. 54,999'},
4:{'name': 'Google Pixel 4', 'price': 'Rs. 72,800'}
,5:{'name': 'OnePlus Nord', 'price': 'Rs. 24,999'}}



result = firebase.put('/topfive/Android/', x[10], a70)


a80={

3:{'name': 'Samsung Galaxy Note 20', 'price': 'Rs. 77,999'},
2:{'name': 'Samsung Galaxy Z Flip', 'price': 'Rs. 78,980'},
1:{'name': 'Samsung Galaxy S21+', 'price': 'Rs. 81,999'},
4:{'name': 'Samsung Galaxy S10+', 'price': 'Rs. 76,500'}
,5:{'name': 'OnePlus Nord', 'price': 'Rs. 24,999'}}


result = firebase.put('/topfive/Android/', x[11], a80)


a90={

1:{'name': 'Samsung Galaxy S21+', 'price': 'Rs. 81,999'},
2:{'name': 'Samsung Galaxy Note 9', 'price': 'Rs. 84,900'},
3:{'name': 'Samsung Galaxy S20 Ultra', 'price': 'Rs. 86,999'},
4:{'name': 'Samsung Galaxy Z Flip', 'price': 'Rs. 78,980'}
,5:{'name': 'OnePlus Nord', 'price': 'Rs. 24,999'}}


result = firebase.put('/topfive/Android/', x[12], a90)
a100={

3:{'name': 'Samsung Galaxy S20 Ultra', 'price': 'Rs. 86,999'},
2:{'name': 'Samsung Galaxy Fold', 'price': 'Rs. 178,000'},
1:{'name': 'Samsung Galaxy Note 20 Ultra 5G', 'price': 'Rs. 104,499'},
4:{'name': 'Samsung Galaxy S21+', 'price': 'Rs. 81,999'}
,5:{'name': 'OnePlus Nord', 'price': 'Rs. 24,999'}}


result = firebase.put('/topfive/Android/', x[13], a100)


a10={1:{'name': 'Apple iPhone SE', 'price': 'Rs. 9,999'},
2:{'name': 'Apple iPhone 6', 'price': 'Rs. 9,999'},
3:{'name': 'Apple iPhone 5c', 'price': 'Rs. 8,499'},
4:{'name': 'Apple iPhone 5', 'price': 'Rs. 8,499'},
5:{'name': 'Apple iPhone 5s', 'price': 'Rs. 4,799'}
}
result = firebase.put('/topfive/iOS/', x[0], a10)
result = firebase.put('/topfive/iOS/', x[1], a10)

a20={1:{'name': 'Apple iPhone SE (128GB)', 'price': 'Rs. 19,999'},
2:{'name': 'Apple iPhone 6 Plus', 'price': 'Rs. 15,999'},
3:{'name': 'Apple iPhone 7', 'price': 'Rs. 15,785'},
4:{'name': 'Apple iPhone 6 (128GB)', 'price': 'Rs. 22,999'},
5:{'name': 'Apple iPhone 5s', 'price': 'Rs. 4,799'}
}
result = firebase.put('/topfive/iOS/', x[2], a20)

result = firebase.put('/topfive/iOS/', x[3], a20)

result = firebase.put('/topfive/iOS/', x[4], a20)

a30={1:{'name': 'Apple iPhone 7 Plus', 'price': 'Rs. 26,299'},
2:{'name': 'Apple iPhone 6s (32GB)', 'price': 'Rs. 26,499'},
4:{'name': 'Apple iPhone 6 (128GB)', 'price': 'Rs. 22,999'},
3:{'name': 'Apple iPhone 7 (128GB)', 'price': 'Rs. 21,999'},
5:{'name': 'Apple iPhone 5s', 'price': 'Rs. 4,799'}
}
result = firebase.put('/topfive/iOS/', x[5], a30)

result = firebase.put('/topfive/iOS/', x[6], a30)

a40={1:{'name': 'Apple iPhone XR (128GB)', 'price': 'Rs. 49,999'},
2:{'name': 'Apple iPhone 8', 'price': 'Rs. 49,990'},
3:{'name': 'Apple iPhone 7 Plus', 'price': 'Rs. 26,299'},
4:{'name': 'Apple iPhone 7 (128GB)', 'price': 'Rs. 21,999'},
5:{'name': 'Apple iPhone 5s', 'price': 'Rs. 4,799'}
}
result = firebase.put('/topfive/iOS/', x[7], a40)

a50={3:{'name': 'Apple iPhone XR (128GB)', 'price': 'Rs. 49,999'},
2:{'name': 'Apple iPhone 8', 'price': 'Rs. 49,990'},
1:{'name': 'iPhone 11', 'price': 'Rs. 51,999'},
4:{'name': 'Apple iPhone 7 (128GB)', 'price': 'Rs. 21,999'},
5:{'name': 'Apple iPhone 5s', 'price': 'Rs. 4,799'}
}



result = firebase.put('/topfive/iOS/', x[8], a50)

result = firebase.put('/topfive/iOS/', x[9], a50)



# a60={1:{'name': 'iPhone 11 ', 'price': 'Rs. 19,999'},
# 2:{'name': 'Apple iPhone 6 Plus', 'price': 'Rs. 15,999'},
# 3:{'name': 'Apple iPhone 7', 'price': 'Rs. 15,785'},
# 4:{'name': 'Apple iPhone 6 (128GB)', 'price': 'Rs. 22,999'},
# 5:{'name': 'Apple iPhone 5s', 'price': 'Rs. 4,799'}
# }
# result = firebase.put('/topfive/', x[1], a20)


# a70={1:{'name': 'Apple iPhone SE (128GB)', 'price': 'Rs. 19,999'},
# 2:{'name': 'Apple iPhone 6 Plus', 'price': 'Rs. 15,999'},
# 3:{'name': 'Apple iPhone 7', 'price': 'Rs. 15,785'},
# 4:{'name': 'Apple iPhone 6 (128GB)', 'price': 'Rs. 22,999'},
# 5:{'name': 'Apple iPhone 5s', 'price': 'Rs. 4,799'}
# }
# result = firebase.put('/topfive/', x[1], a20)
#

a80={3:{'name': 'iPhone 12 mini', 'price': 'Rs. 64,490'},
1:{'name': 'iPhone 12', 'price': 'Rs. 76,900'},
2:{'name': 'iPhone 11 Pro (256GB)', 'price': 'Rs. 84,900'},
4:{'name': 'iPhone 11 Pro', 'price': 'Rs. 79,999'},
5:{'name': 'Apple iPhone 5s', 'price': 'Rs. 4,799'}
}
result = firebase.put('/topfive/iOS/', x[10], a80)

result = firebase.put('/topfive/iOS/', x[11], a80)



a100={1:{'name': 'iPhone 12 Pro Max', 'price': 'Rs. 127,900'},
2:{'name': 'iPhone 12 Pro', 'price': 'Rs. 117,990'},
3:{'name': 'iPhone 11 Pro Max', 'price': 'Rs. 92,900'},
4:{'name': 'iPhone 11 Pro Max (256GB)', 'price': 'Rs. 131,899'},
5:{'name': 'Apple iPhone 5s', 'price': 'Rs. 4,799'}
}
result = firebase.put('/topfive/iOS/', x[12], a100)

result = firebase.put('/topfive/iOS/', x[13], a100)

