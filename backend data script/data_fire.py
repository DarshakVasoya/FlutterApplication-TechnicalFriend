#it is for mobiles
from  firebase import firebase
import json

firebase = firebase.FirebaseApplication('https://technical-friend-5a7b7.firebaseio.com', None)
with open('sample.json') as data:
    data0=json.load(data)
a=list(data0.keys())
j=0
# print(a)
# index = a.index('Zopo Color M5')
p=957
while p!= len(a):
    try:
        result = firebase.put('/Compare/Mobiles/', a[p], data0[a[p]])
    except:
        print(a[p])
    p=p+1

# #
# # for i in a:
# #     try:
# #         result = firebase.put('/Compare/Mobiles/', i, data0[i])
# #     except:
# #         print(i)
#
# print(index)
# #simple.json to firbase
# # //key ma / na hovo joiae


# it is for mobile
# from  firebase import firebase
# import json
#
# firebase = firebase.FirebaseApplication('https://technical-friend-5a7b7.firebaseio.com', None)
# with open('sample.json') as data:
#     data0=json.load(data)
# a=list(data0.keys())
# j=0;
# # print(a)
# # index = a.index('Zopo Color M5')
# p=0
# while p!= len(a):
#     try:
#         result = firebase.put('/Compare/Mobile/', a[p], data0[a[p]]['price'])
#     except:
#         print(a[p])
#     p=p+1

# aani uper nu mobiles nu 6
