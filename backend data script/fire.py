from  firebase import firebase
import json
firebase = firebase.FirebaseApplication('https://technical-friend-5a7b7.firebaseio.com', None)
with open('price.json') as data:
    data0=json.load(data)
a=list(data0.keys())


result = firebase.put('/Compare',"Mobile", "ab.c")