import sys
from bs4 import BeautifulSoup
from urllib.request import urlopen

#list pages
pages = ['http://www.huffingtonpost.com/entry/rnc-polling-convention-record_us_579f7442e4b0693164c1e828',
         'http://www.huffingtonpost.com/entry/mitch-mcconnell-paul-ryan-donald-trump_us_579e61efe4b08a8e8b5e6e61?section=&section=us_politics',
         'http://www.huffingtonpost.com/entry/paul-ryan-donald-trump-veterans_us_579f912de4b0e2e15eb6a467?section=&section=us_politics',
         'http://www.huffingtonpost.com/entry/donald-trump-election-rigged_us_579fb173e4b08a8e8b5f07a9?section=us_politics']

#test page
#pages = ['http://www.huffingtonpost.com/entry/clinton-campaign-dnc-chair_us_579f93bce4b0693164c20cfb?section=&section=us_politics']

#print header
#print('header')

#iterate
for art in pages:
    html = urlopen(art)
    soup = BeautifulSoup(html, 'html.parser')

    morder = 0 #convert to guid
    mtitle = '' #main tittle
    msubtitle = '' #sub tittle
    myear = '' #year
    mdate = '' #datestamp
    mtext = '' #text or array os <p>?

    morder = pages.index(art)

    #<h1 class="headline__title">Hillary Clinton Campaign Wants A Progressive DNC Chair</h1>
    mtt = soup.find('h1', {'class': ['headline__title']})

    if mtt is not None:
        mtitle = mtt.get_text().strip()
        #myear = mtt.span.text.replace('(','').replace(')','').replace('–','').strip()

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

    #ptb = soup.find('table', {'class': ['cast_list']})
    #for ptr in ptb.find_all('tr', {'class': ['even', 'odd']}):

        #line = ''
        #aname = ''
        #acharacter = ''
        #arank = '10'
        #mline = False

        #for ptd in ptr.find_all('td'):
            #if 'itemprop' in ptd['class']:
                #if ptd.a.span.text != '':
                    #aname = ptd.a.span.text
            #if 'character' in ptd['class']:
                #pa = ptd.div.find_all('a')
                #if len(pa) == 0:
#                    acharacter = ' '.join(ptd.div.text.split())
 #               if len(pa) == 1:
#                    acharacter = pa[0].text
#                    if ptd.div.text.find('episode') != -1:

#                        arank = ptd.div.text
#                        arank = arank[arank.find('episode')-5:arank.find('episode')].replace('(','').replace(')','').replace(' ','')

                        #arank = ptd.div.text.replace('(uncredited)','').replace('(archive footage)','').strip()
                        #arank = arank[arank.find('(')+1:arank.find('episodes')]
                    #else:
                        #if ptd.div.text.find('episode') != -1:
                            #arank = ptd.div.text.replace('(uncredited)','').replace('(archive footage)','').strip()
                            #arank = arank[arank.find('(')+1:arank.find('episode')]

 #                   mline = True
#                if len(pa) > 1:
#                    acharacter = pa[0].text
                    #acharacter = pa[0].text + ' / ' + pa[1].text
#                    mline = True
            #if 'primary_photo' in ptd['class']:
                #line = ptd.a.img['src'] + ','
                #line += ptd.a.img['title']
#        if mline:
#            print(str(morder) + ',' + mtitle + ',' + myear + ',' + aname + ',' + acharacter + ',' + arank)

        print(str(morder) + ',' + mtitle)
