from bs4 import BeautifulSoup
from urllib.request import urlopen

#list imdb movies
movies = ['http://www.imdb.com/title/tt0371746/fullcredits', #iron man
          'http://www.imdb.com/title/tt0800080/fullcredits', #hulk
          'http://www.imdb.com/title/tt1228705/fullcredits', #iron man 2
          'http://www.imdb.com/title/tt0800369/fullcredits', #thor
          'http://www.imdb.com/title/tt0458339/fullcredits', #captain america
          'http://www.imdb.com/title/tt0848228/fullcredits', #avengers
          'http://www.imdb.com/title/tt1300854/fullcredits', #iron man 3
          'http://www.imdb.com/title/tt2364582/fullcredits', #shield
          'http://www.imdb.com/title/tt1981115/fullcredits', #thor 2
          'http://www.imdb.com/title/tt1843866/fullcredits', #captain america 2
          'http://www.imdb.com/title/tt2015381/fullcredits', #GoG
          'http://www.imdb.com/title/tt3475734/fullcredits', #agent carter
          'http://www.imdb.com/title/tt3322312/fullcredits', #daredevil
          'http://www.imdb.com/title/tt2395427/fullcredits', #avengers 2
          'http://www.imdb.com/title/tt0478970/fullcredits', #ant man
          'http://www.imdb.com/title/tt2357547/fullcredits', #jessica jones
          'http://www.imdb.com/title/tt3498820/fullcredits', #captain america 3
          'http://www.imdb.com/title/tt1211837/fullcredits'  #doctor strange
          ]

#test movie
movies = ['http://www.imdb.com/title/tt1211837/fullcredits']

#print header
print('order,movie,year,actor,character,rank')

#iterate
for mov in movies:
    html = urlopen(mov)
    soup = BeautifulSoup(html, 'html.parser')

    morder = 0
    mtitle = ''
    myear = ''

    morder = movies.index(mov)

    mtt = soup.find('h3', {'itemprop': ['name']})
    if mtt is not None:
        mtitle = mtt.a.text.strip()
        myear = mtt.span.text.replace('(','').replace(')','').replace('–','').strip()

    # myy = soup.find('span', {'id': ['titleYear']})
    # if myy is not None:
    #     myear = myy.a.text
    # else:
    #     sep1 = 'TV Series ('
    #     sep2 = '-'
    #     myy = soup.find('a', {'title': ['See more release dates']})
    #     if myy.find(sep1) != -1:
    #         myear = myy.text[len(sep1):myy.text.find(sep2)-3]
    #     else:
    #         myear = ''

    ptb = soup.find('table', {'class': ['cast_list']})
    for ptr in ptb.find_all('tr', {'class': ['even', 'odd']}):

        line = ''
        aname = ''
        acharacter = ''
        arank = '10'
        mline = False

        for ptd in ptr.find_all('td'):
            if 'itemprop' in ptd['class']:
                if ptd.a.span.text != '':
                    aname = ptd.a.span.text
            if 'character' in ptd['class']:
                pa = ptd.div.find_all('a')
                if len(pa) == 0:
                    acharacter = ' '.join(ptd.div.text.split())
                if len(pa) == 1:
                    acharacter = pa[0].text
                    if ptd.div.text.find('episode') != -1:

                        arank = ptd.div.text
                        arank = arank[arank.find('episode')-5:arank.find('episode')].replace('(','').replace(')','').replace(' ','')

                        #arank = ptd.div.text.replace('(uncredited)','').replace('(archive footage)','').strip()
                        #arank = arank[arank.find('(')+1:arank.find('episodes')]
                    #else:
                        #if ptd.div.text.find('episode') != -1:
                            #arank = ptd.div.text.replace('(uncredited)','').replace('(archive footage)','').strip()
                            #arank = arank[arank.find('(')+1:arank.find('episode')]

                    mline = True
                if len(pa) > 1:
                    acharacter = pa[0].text
                    #acharacter = pa[0].text + ' / ' + pa[1].text
                    mline = True
            #if 'primary_photo' in ptd['class']:
                #line = ptd.a.img['src'] + ','
                #line += ptd.a.img['title']
        if mline:
            print(str(morder) + ',' + mtitle + ',' + myear + ',' + aname + ',' + acharacter + ',' + arank)
