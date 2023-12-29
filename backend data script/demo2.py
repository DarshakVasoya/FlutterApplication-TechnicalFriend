import bs4
import json
import requests
import html5lib
from  firebase import firebase

firebase = firebase.FirebaseApplication('https://technical-friend-5a7b7.firebaseio.com', None)

result = firebase.put('', 'News', 'a')