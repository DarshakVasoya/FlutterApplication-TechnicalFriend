import bs4
import json
import requests
import html5lib

mainLink="https://gadgets.ndtv.com/sitemap-mobiles-products.xml"
r_main = requests.get(mainLink)
code_main = r_main.content

soup_main = bs4.BeautifulSoup(code_main, 'html.parser')

soup_main=soup_main.find('url')
a=""
a=soup_main.find('loc').string +a
a=a.replace("https://gadgets.ndtv.com/","")
a=a.replace("-price-in-india","")
check=int(input('Enter last number'))
check_move=0
while check_move < check :
    soup_main = soup_main.find_next_sibling().find_next_sibling().find_next_sibling().find_next_sibling()
    check_move=check_move+1

cond=check+1000

while 1:
    if check==cond:
        break
    print(check)

    a01 = soup_main.find('loc').string
    a = a01.replace("https://gadgets.ndtv.com/", "")
    a = a.replace("-price-in-india", "")
    soup_main = soup_main.find_next_sibling()
    b01 = soup_main.find('loc').string
    b = b01.replace("https://gadgets.ndtv.com/", "")
    b = b.replace("-price-in-india", "")
    soup_main = soup_main.find_next_sibling()
    c01 = soup_main.find('loc').string
    c = c01.replace("https://gadgets.ndtv.com/", "")
    c = c.replace("-price-in-india", "")
    soup_main = soup_main.find_next_sibling()
    d01 = soup_main.find('loc').string
    d = d01.replace("https://gadgets.ndtv.com/", "")
    d = d.replace("-price-in-india", "")
    soup_main = soup_main.find_next_sibling()

    link="https://gadgets.ndtv.com/compare-"+a+"-vs-"+b+"-vs-"+c+"-vs-"+d
    mainLink01 = a01
    mainLink02 = b01
    mainLink03 = c01
    mainLink04 = d01

    r_main01 = requests.get(mainLink01)
    r_main02 = requests.get(mainLink02)
    r_main03 = requests.get(mainLink03)
    r_main04 = requests.get(mainLink04)

    code_main01 = r_main01.content
    code_main02 = r_main02.content
    code_main03 = r_main03.content
    code_main04 = r_main04.content
    soup_main01 = bs4.BeautifulSoup(code_main01, 'html.parser')
    soup_main02 = bs4.BeautifulSoup(code_main02, 'html.parser')
    soup_main03 = bs4.BeautifulSoup(code_main03, 'html.parser')
    soup_main04 = bs4.BeautifulSoup(code_main04, 'html.parser')

    print(link)
    r = requests.get(link)
    code = r.content

    soup = bs4.BeautifulSoup(code, 'html.parser')
    soup1 = bs4.BeautifulSoup(code, 'html.parser')

    soup = (soup.find('tbody', attrs={'class': 'scrollContent'}))
    soup1 = soup
    # soup=soup1.find('tr',attrs={'class':'data_row ratings'}).next.next.next.next.get('class')
    soup = soup1.find('tr', attrs={'class': 'data_row ratings'})
    soup2 = soup
    count = 0

    rating = list()
    keyspecs = list()
    general = list()
    display = list()
    hardware = list()

    camera = list()
    software = list()
    connectivity = list()
    sim1 = list()
    sim2 = list()

    sensors = list()

    rating1 = [
        'Overall NDTV Rating',
        'Design Rating',
        'Display Rating',
        'Software Rating',
        'Performance Rating',
        'Battery Life Rating',
        'Camera Rating',
        'Value for Money Rating'
    ]
    keyspecs1 = ['Display',
                 'Processor',
                 'Front Camera',
                 'Rear Camera',
                 'RAM',
                 'Storage',
                 'Battery Capacity',
                 'OS',
                 'Resolution'
                 ]
    general1 = [
        'Brand',
        'Model',
        'Dimensions (mm)',
        'Weight (g)',
        'Battery capacity (mAh)',

        'Fast charging',
        'Colours',
        'Wireless charging',
        'Body type',

    ]
    display1 = [
        'Screen size (inches)',
        'Touchscreen',
        'Resolution',
        'Aspect ratio',
    ]
    hardware1 = [
        'Processor',
        'Processor make',
        'RAM',
        'Internal storage',
        'Expandable storage',

    ]

    camera1 = [
        'Rear camera',
        'Rear autofocus',
        'Front camera'
    ]
    software1 = [
        'Operating system'
    ]
    connectivity1 = [
        'Wi-Fi',
        'GPS',
        'Bluetooth',
        'USB Type-C',
        'Number of SIMs'
    ]
    sim11 = [
        'SIM Type',

        '3G',
        '4G-LTE'

    ]

    sensors1 = ['Face unlock',
                'Fingerprint sensor',
                'Compass-Magnetometer',
                'Proximity sensor',
                'Accelerometer'
                ]

    while count < len(soup1.find_all('tr', attrs={'class': 'data_row ratings'})):
        count = count + 1
        count1 = 1
        soup_e = soup2
        soup_o = soup_e.find('td')
        while count1 < len(soup_e.find_all('td')):
            try:
                rating.append(soup_o.find_next_sibling().find('i').get('class')[2])
            except:
                rating.append("-")
            soup_o = soup_o.find_next_sibling()
            count1 = count1 + 1
        soup2 = soup2.find_next_sibling()

    soup = soup1.find('tr', attrs={'class': 'data_row key_specs'})
    soup2 = soup
    count = 0
    while count < len(soup1.find_all('tr', attrs={'class': 'data_row key_specs'})):

        count = count + 1
        count1 = 1
        soup_e = soup2
        soup_o = soup_e.find('td')
        if soup_o.string in keyspecs1:
            while count1 < len(soup_e.find_all('td')):
                keyspecs.append(soup_o.find_next_sibling().get_text())
                soup_o = soup_o.find_next_sibling()
                count1 = count1 + 1
        soup2 = soup2.find_next_sibling()
    soup = soup1.find('tr', attrs={'class': 'data_row general'})
    soup2 = soup
    count = 0
    while count < len(soup1.find_all('tr', attrs={'class': 'data_row general'})):
        count = count + 1
        count1 = 1
        soup_e = soup2
        soup_o = soup_e.find('td')
        if soup_o.string in general1:
            while count1 < len(soup_e.find_all('td')):
                general.append(soup_o.find_next_sibling().get_text())
                soup_o = soup_o.find_next_sibling()
                count1 = count1 + 1
        soup2 = soup2.find_next_sibling()
    soup = soup1.find('tr', attrs={'class': 'data_row display'})
    soup2 = soup
    count = 0
    while count < len(soup1.find_all('tr', attrs={'class': 'data_row display'})):
        count = count + 1
        count1 = 1
        soup_e = soup2
        soup_o = soup_e.find('td')
        if soup_o.string in display1:
            while count1 < len(soup_e.find_all('td')):
                display.append(soup_o.find_next_sibling().get_text())
                soup_o = soup_o.find_next_sibling()
                count1 = count1 + 1
        soup2 = soup2.find_next_sibling()

    soup = soup1.find('tr', attrs={'class': 'data_row hardware'})
    soup2 = soup
    count = 0
    while count < len(soup1.find_all('tr', attrs={'class': 'data_row hardware'})):
        count = count + 1
        count1 = 1
        soup_e = soup2
        soup_o = soup_e.find('td')
        if soup_o.string in hardware1:
            while count1 < len(soup_e.find_all('td')):
                hardware.append(soup_o.find_next_sibling().get_text())
                soup_o = soup_o.find_next_sibling()
                count1 = count1 + 1
        soup2 = soup2.find_next_sibling()

    soup = soup1.find('tr', attrs={'class': 'data_row camera'})
    soup2 = soup
    count = 0
    while count < len(soup1.find_all('tr', attrs={'class': 'data_row camera'})):
        count = count + 1
        count1 = 1
        soup_e = soup2
        soup_o = soup_e.find('td')
        if soup_o.string in camera1:
            while count1 < len(soup_e.find_all('td')):
                camera.append(soup_o.find_next_sibling().get_text())
                soup_o = soup_o.find_next_sibling()
                count1 = count1 + 1
        soup2 = soup2.find_next_sibling()

    soup = soup1.find('tr', attrs={'class': 'data_row software'})
    soup2 = soup
    count = 0
    while count < len(soup1.find_all('tr', attrs={'class': 'data_row software'})):
        count = count + 1
        count1 = 1
        soup_e = soup2
        soup_o = soup_e.find('td')
        if soup_o.string in software1:
            while count1 < len(soup_e.find_all('td')):
                software.append(soup_o.find_next_sibling().get_text())
                soup_o = soup_o.find_next_sibling()
                count1 = count1 + 1
        soup2 = soup2.find_next_sibling()
    soup = soup1.find('tr', attrs={'class': 'data_row connectivity'})
    soup2 = soup
    count = 0
    while count < len(soup1.find_all('tr', attrs={'class': 'data_row connectivity'})):
        count = count + 1
        count1 = 1
        soup_e = soup2
        soup_o = soup_e.find('td')
        if soup_o.string in connectivity1:
            while count1 < len(soup_e.find_all('td')):
                connectivity.append(soup_o.find_next_sibling().get_text())
                soup_o = soup_o.find_next_sibling()
                count1 = count1 + 1
        soup2 = soup2.find_next_sibling()

    soup = soup1.find('tr', attrs={'class': 'data_row sim_1'})
    soup2 = soup
    count = 0
    while count < len(soup1.find_all('tr', attrs={'class': 'data_row sim_1'})):
        count = count + 1
        count1 = 1
        soup_e = soup2
        soup_o = soup_e.find('td')
        if soup_o.string in sim11:
            while count1 < len(soup_e.find_all('td')):
                sim1.append(soup_o.find_next_sibling().get_text())
                soup_o = soup_o.find_next_sibling()
                count1 = count1 + 1
        soup2 = soup2.find_next_sibling()

    soup = soup1.find('tr', attrs={'class': 'data_row sim_2'})
    soup2 = soup
    count = 0
    while count < len(soup1.find_all('tr', attrs={'class': 'data_row sim_2'})):
        count = count + 1
        count1 = 1
        soup_e = soup2
        soup_o = soup_e.find('td')
        if soup_o.string in sim11:
            while count1 < len(soup_e.find_all('td')):
                sim2.append(soup_o.find_next_sibling().get_text())
                soup_o = soup_o.find_next_sibling()
                count1 = count1 + 1
        soup2 = soup2.find_next_sibling()

    soup = soup1.find('tr', attrs={'class': 'data_row sensors'})
    soup2 = soup
    count = 0
    while count < len(soup1.find_all('tr', attrs={'class': 'data_row sensors'})):
        count = count + 1
        count1 = 1
        soup_e = soup2
        soup_o = soup_e.find('td')
        if soup_o.string in sensors1:
            while count1 < len(soup_e.find_all('td')):
                sensors.append(soup_o.find_next_sibling().get_text())
                soup_o = soup_o.find_next_sibling()
                count1 = count1 + 1
        soup2 = soup2.find_next_sibling()

    soup = bs4.BeautifulSoup(code, 'html.parser')
    a = soup.find('li', attrs={'id': 5}).find('span').getText()

    title = a.split(" vs ")
    print(title)

    # print(a)
    #  name1=a.split("vs")
    #  print(a.split("vs"))
    # print(name)
    #
    # dictionary = {
    #     "name": "sathiyajith",
    #     "rollno": 56,
    #     "cgpa": 8.6,
    #     "phonenumber": "9976770500"
    # }
    #
    # # Serializing json
    # json_object = json.dumps(dictionary, indent=4)
    #
    # # Writing to sample.json
    # with open("sample.json", "w") as outfile:
    #     outfile.write(json_object)
    #
    rat1 = {}
    rat2 = {}
    rat3 = {}
    rat4 = {}

    i = 0
    while len(rating) / 4 > i:
        rat1[rating1[i]] = rating[i * 4]
        rat2[rating1[i]] = rating[(i * 4) + 1]
        rat3[rating1[i]] = rating[i * 4 + 2]
        rat4[rating1[i]] = rating[(i * 4) + 3]
        i = i + 1

    kes1 = {}
    kes2 = {}
    kes3 = {}
    kes4 = {}

    i = 0
    while len(keyspecs) / 4 > i:
        kes1[keyspecs1[i]] = keyspecs[i * 4]
        kes2[keyspecs1[i]] = keyspecs[(i * 4) + 1]
        kes3[keyspecs1[i]] = keyspecs[i * 4 + 2]
        kes4[keyspecs1[i]] = keyspecs[i * 4 + 3]
        i = i + 1

    gen1 = {}
    gen2 = {}
    gen3 = {}
    gen4 = {}

    i = 0
    while len(general) / 4 > i:
        gen1[general1[i]] = general[i * 4]
        gen2[general1[i]] = general[(i * 4) + 1]
        gen3[general1[i]] = general[i * 4 + 2]
        gen4[general1[i]] = general[(i * 4) + 3]
        i = i + 1

    dis1 = {}
    dis2 = {}
    dis3 = {}
    dis4 = {}

    i = 0
    while len(display) / 4 > i:
        dis1[display1[i]] = display[i * 4]
        dis2[display1[i]] = display[(i * 4) + 1]
        dis3[display1[i]] = display[i * 4 + 2]
        dis4[display1[i]] = display[(i * 4) + 3]
        i = i + 1

    hard1 = {}
    hard2 = {}
    hard3 = {}
    hard4 = {}

    i = 0
    while len(hardware) / 4 > i:
        hard1[hardware1[i]] = hardware[i * 4]
        hard2[hardware1[i]] = hardware[(i * 4) + 1]
        hard3[hardware1[i]] = hardware[i * 4 + 2]
        hard4[hardware1[i]] = hardware[(i * 4) + 3]
        i = i + 1

    cam1 = {}
    cam2 = {}
    cam3 = {}
    cam4 = {}

    i = 0
    while len(camera) / 4 > i:
        cam1[camera1[i]] = camera[i * 4]
        cam2[camera1[i]] = camera[(i * 4) + 1]
        cam3[camera1[i]] = camera[i * 4 + 2]
        cam4[camera1[i]] = camera[(i * 4) + 3]
        i = i + 1

    soft1 = {}
    soft2 = {}
    soft3 = {}
    soft4 = {}

    i = 0
    while len(software) / 4 > i:
        soft1[software1[i]] = software[i * 4]
        soft2[software1[i]] = software[(i * 4) + 1]
        soft3[software1[i]] = software[i * 4 + 2]
        soft4[software1[i]] = software[(i * 4) + 3]
        i = i + 1

    connect1 = {}
    connect2 = {}
    connect3 = {}
    connect4 = {}

    i = 0
    while len(connectivity) / 4 > i:
        connect1[connectivity1[i]] = connectivity[i * 4]
        connect2[connectivity1[i]] = connectivity[(i * 4) + 1]
        connect3[connectivity1[i]] = connectivity[i * 4 + 2]
        connect4[connectivity1[i]] = connectivity[(i * 4) + 3]
        i = i + 1

    si1 = {}
    si2 = {}
    si3 = {}
    si4 = {}

    si01 = {}
    si02 = {}
    si03 = {}
    si04 = {}

    i = 0
    while len(sim1) / 4 > i:
        si1[sim11[i]] = sim1[i * 4]
        try:
            si01[sim11[i]] = sim2[i * 4]
        except:
            si01[sim11[i]] = "-"
        try:
            si02[sim11[i]] = sim2[(i * 4) + 1]
        except:
            si02[sim11[i]] = "-"

        try:
            si03[sim11[i]] = sim2[i * 4 + 2]
        except:
            si03[sim11[i]] = "-"
        try:
            si04[sim11[i]] = sim2[(i * 4) + 3]
        except:
            si04[sim11[i]] = "-"

        si2[sim11[i]] = sim1[(i * 4) + 1]
        si3[sim11[i]] = sim1[i * 4 + 2]
        si4[sim11[i]] = sim1[(i * 4) + 3]
        i = i + 1

    sens1 = {}
    sens2 = {}
    sens3 = {}
    sens4 = {}

    i = 0
    while len(sensors) / 4 > i:
        sens1[sensors1[i]] = sensors[i * 4]
        sens2[sensors1[i]] = sensors[(i * 4) + 1]
        sens3[sensors1[i]] = sensors[i * 4 + 2]
        sens4[sensors1[i]] = sensors[(i * 4) + 3]
        i = i + 1
    all = ['ratings', 'key specs', 'general', 'display', 'hardware', 'camera', 'software', 'connectivity', 'sim 1',
           'sim 2', 'sensors']
    point1 = {}
    point2 = {}
    point3 = {}
    point4 = {}
    mob1 = {}

    mob1[all[0]] = rat1
    mob1[all[1]] = kes1
    mob1[all[2]] = gen1
    mob1[all[3]] = dis1
    mob1[all[4]] = hard1
    mob1[all[5]] = cam1
    mob1[all[6]] = soft1
    mob1[all[7]] = connect1
    mob1[all[8]] = si1
    mob1[all[9]] = si01
    mob1[all[10]] = sens1
    try:
        mob1['image']=soup_main01.find('img',attrs={'alt':title[0]}).get('src')
    except:
        mob1['image']="No"
    try:
        mob1['price']=soup_main01.find('a',attrs={'class':'_trtprc'}).string
    except:
        mob1['price']="-"

    try:
        good = []
        bad = []
        just1 = soup_main01.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find('li').find_next_sibling()
        i = 1
        while len(soup_main01.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find_all('li')) > i:
            i = i + 1
            good.append(just1.string)
            just1 = just1.find_next_sibling()

        just1 = soup_main01.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find_next_sibling().find(
            'li').find_next_sibling()
        i = 1
        while len(soup_main01.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find_next_sibling().find_all(
                'li')) > i:
            i = i + 1
            bad.append(just1.string)
            just1 = just1.find_next_sibling()
        point1["good"] = good
        point1["bad"] = bad

        mob1["point"] = point1
    except:
        mob1["point"]="No"
    mob2 = {}
    mob2[all[0]] = rat2
    mob2[all[1]] = kes2
    mob2[all[2]] = gen2
    mob2[all[3]] = dis2
    mob2[all[4]] = hard2
    mob2[all[5]] = cam2
    mob2[all[6]] = soft2
    mob2[all[7]] = connect2
    mob2[all[8]] = si2
    mob2[all[9]] = si02
    mob2[all[10]] = sens2
    try:
        mob2['price'] = soup_main02.find('a', attrs={'class': '_trtprc'}).string
    except:
        mob2['price']="-"
    try:
        mob2['image']=soup_main02.find('img',attrs={'alt':title[1]}).get('src')
    except:
        mob2['image']="No"
    try:
        good = []
        bad = []
        just1 = soup_main02.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find('li').find_next_sibling()
        i = 1
        while len(soup_main02.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find_all('li')) > i:
            i = i + 1
            good.append(just1.string)
            just1 = just1.find_next_sibling()

        just1 = soup_main02.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find_next_sibling().find('li').find_next_sibling()
        i = 1
        while len(soup_main02.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find_next_sibling().find_all('li')) > i:
            i = i + 1
            bad.append(just1.string)
            just1 = just1.find_next_sibling()
        point2["good"] = good
        point2["bad"] = bad

        mob2["point"] = point3
    except:
        mob2["point"] = "No"

    mob3 = {}
    mob3[all[0]] = rat3
    mob3[all[1]] = kes3
    mob3[all[2]] = gen3
    mob3[all[3]] = dis3
    mob3[all[4]] = hard3
    mob3[all[5]] = cam3
    mob3[all[6]] = soft3
    mob3[all[7]] = connect3
    mob3[all[8]] = si3
    mob3[all[9]] = si03
    mob3[all[10]] = sens3
    try:
        mob3['image']=soup_main03.find('img',attrs={'alt':title[2]}).get('src')
    except:
        mob3['image']="No"
    try:
        mob3['price'] = soup_main03.find('a', attrs={'class': '_trtprc'}).string
    except:
        mob3['price']="-"
    try:
        good = []
        bad = []
        just1 = soup_main03.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find('li').find_next_sibling()
        i = 1
        while len(soup_main03.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find_all('li')) > i:
            i = i + 1
            good.append(just1.string)
            just1 = just1.find_next_sibling()

        just1 = soup_main03.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find_next_sibling().find('li').find_next_sibling()
        i = 1
        while len(soup_main03.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find_next_sibling().find_all('li')) > i:
            i = i + 1
            bad.append(just1.string)
            just1 = just1.find_next_sibling()
        point3["good"] = good
        point3["bad"] = bad

        mob3["point"] = point3
    except:
        mob3["point"] = "No"


    mob4 = {}
    mob4[all[0]] = rat4
    mob4[all[1]] = kes4
    mob4[all[2]] = gen4
    mob4[all[3]] = dis4
    mob4[all[4]] = hard4
    mob4[all[5]] = cam4
    mob4[all[6]] = soft4
    mob4[all[7]] = connect4
    mob4[all[8]] = si4
    mob4[all[9]] = si04
    mob4[all[10]] = sens4
    try:
        mob4['image']=soup_main04.find('img',attrs={'alt':title[3]}).get('src')
    except:
        mob4['image']="No"
    try:
        mob4['price'] = soup_main04.find('a',attrs={'class':'_trtprc'}).string
    except:
        mob4['price']="-"
    try:
        good = []
        bad = []
        just1 = soup_main04.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find('li').find_next_sibling()
        i = 1
        while len(soup_main04.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find_all('li')) > i:
            i = i + 1
            good.append(just1.string)
            just1 = just1.find_next_sibling()

        just1 = soup_main04.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find_next_sibling().find('li').find_next_sibling()
        i = 1
        while len(soup_main04.find('div', attrs={'class': '_flx _pdqty'}).find('ul').find_next_sibling().find_all('li')) > i:
            i = i + 1
            bad.append(just1.string)
            just1 = just1.find_next_sibling()
        point4["good"] = good
        point4["bad"] = bad

        mob4["point"] = point4
    except:
        mob4["point"] = "No"

    # Writing to sample.json
    with open("sample.json") as outfile1:
        file_data = json.load(outfile1)

    if mob1['price'] != "-":
        file_data[title[0]] = mob1
    if mob2['price'] != "-":
        file_data[title[1]] = mob2

    if mob3['price'] != "-":
        file_data[title[2]] = mob3
    if mob4['price'] != "-":
        file_data[title[3]] = mob4

    with open("sample.json", 'w') as file:
        json.dump(file_data, file, indent=4)
    check = check + 1


