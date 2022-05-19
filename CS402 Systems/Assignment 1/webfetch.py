import os
import requests
import re
from bs4 import BeautifulSoup
def makeDirectory(path_):
    directory = os.path.dirname(path_)
    if not os.path.exists(directory):
        os.makedirs(directory)

def takeInput():
    print("Enter Url:")
    url = input()
    return url

def getUrl(url):
    # Query website, get the page HTML, remove illegal characters from page address
    r = requests.get(url)
    pageName = re.compile(r"https?://(www\.)?")
    pageName = pageName.sub('', url).strip().strip('/')
    pageName = pageName.replace('/','_').replace('?','_')   
    return r,pageName

def writeToFile(path_, pageName, content):
    makeDirectory(path_)
    with open(path_+str(pageName)+'.txt', 'w', encoding="utf-8") as f:
        f.write(content)

def extractLinks(html):
    # Search the page HTML for links, save these to a list
    soup = BeautifulSoup(html, 'html.parser')
    urls =[]
    for link in soup.find_all('a', attrs={'href': re.compile("^https?://")}):
        urls.append(link.get('href'))
    return urls

def getPages(urls, path_):
    # Take the list of URLs and save each pages HTML in its own text file
    for url in urls:
        r,pageName = getUrl(url)       
        with open(path_+str(pageName)+'.txt', 'w', encoding="utf-8") as f:
            f.write(r.text)

def main():
    # Get URL from user    
    url = takeInput()
    # Get html and page name from the provided URL
    r,pageName= getUrl(url)
    path_="./Output/"+pageName+"/"
    # Write the page's HTML to a text file
    writeToFile(path_,pageName, r.text)
    # Get the nested URL's and write them to a text file inside a sub directory.
    path_+="Urls/"
    makeDirectory(path_)
    urls = extractLinks(r.text)
    getPages(urls, path_) 
    
if __name__ == "__main__":
    main()