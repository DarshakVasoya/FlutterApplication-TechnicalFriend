import bs4
import json
import requests
import html5lib

mainLink="https://www.91mobiles.com/top-10-mobiles-below-20000-in-india"
r_main = requests.get(mainLink)
code_main = r_main.content

soup_main = bs4.BeautifulSoup(code_main, 'html.parser')
b=soup_main
a=soup_main.find("tbody").find('tr')

data=[]

for i in range(0,10):
    try:
        # data[i]=a.find('td').getText
        data.append(a.find('td').string)
        a=a.find_next_sibling()
    except:
        print(i)
print(data)