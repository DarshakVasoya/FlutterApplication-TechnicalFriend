import bs4
import json
import requests
# import html5lib
from  firebase import firebase


data = dict()
main_d=dict()
count=0
main_da=dict()

firebase = firebase.FirebaseApplication('https://technical-friend-5a7b7.firebaseio.com', None)

mainLink="https://gadgets.ndtv.com/sitemapnews.xml"
r_main = requests.get(mainLink)
code_main = r_main.content
soup_main = bs4.BeautifulSoup(code_main, 'html.parser')
soup_main = soup_main.find("url")
da=input("Enter date:2020-09-30")
while 1:
    if soup_main.find("news:publication_date").string.split("T")[0]==da:
        break;
    soup_main=soup_main.find_next_sibling()


while 1:

    try:
        link = soup_main.find("loc").string
        date = soup_main.find("news:publication_date").string.split("T")
        a = date[0]
        if a != da:
            da=a
            data[a]=main_da
            break

        title = soup_main.find("news:title").string
        title = soup_main.find("news:title").string
        second_link = requests.get(link).content
        soup_main2 = bs4.BeautifulSoup(second_link, 'html.parser')
        # print(link+"\n")
        try:
            subheading = soup_main2.find('h2', attrs={'class': 'sdesc'}).string
        except:
            subheading = soup_main2.find('div', attrs={'class': 'sdesc'}).string

        image = str(soup_main2.find('picture').find('source').get('srcset')).split('?')
        content = soup_main2.find('div', attrs={'class': 'content_text row description'})
        content = content.find('p')
        str1 = ""
        str2 = "abx"
        while 1:
            str2 = content.string
            don = content.find('style')
            # print(don)
            if (str2 != None):
                if don == None:
                    str1 = str1 + "\n \n" + str(str2)
            content = content.find_next_sibling()
            if content == None:
                break
        print(title)
        main_d["image"] = image[0]
        main_d["content"] = str1
        main_d["heading"] = title
        main_d["subnews"] = subheading
        main_da[str(count)+"a"]=main_d
        print(main_d)
        result = firebase.put('/News1/Do You Know/2024-01-302023-12-28/', str(count)+"a", main_d)
     
        soup_main = soup_main.find_next_sibling()
        count=count+1
    except:
        soup_main = soup_main.find_next_sibling()
        count = count + 1
#change the date