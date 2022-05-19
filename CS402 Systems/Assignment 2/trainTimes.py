import requests
import xml.etree.ElementTree as ET
import pandas as pd

def main():
    url = "https://api.irishrail.ie/realtime/realtime.asmx/getStationDataByCodeXML_WithNumMins?StationCode=MYNTH&NumMins=90&format=xml"
    r = requests.get(url)
    timeTable = ET.ElementTree(ET.fromstring(r.text)).getroot()
    header ="{http://api.irishrail.ie/realtime/}"
    cols = ["Train Code", "Scheduled Arrival", "Expected Arrival","Scheduled Departure", "Expected Departure", "From", "Destination", "Due In", "Status", "Last Location"]
    rows = []
    for element in timeTable:
        traincode = element.find(header+"Traincode").text
        scharrival = element.find(header+"Scharrival").text
        exparrival = element.find(header+"Exparrival").text
        schdepart = element.find(header+"Schdepart").text
        expdepart = element.find(header+"Expdepart").text
        origin = element.find(header+"Origin").text
        destination = element.find(header+"Destination").text
        duein = element.find(header+"Duein").text+" mins"
        status = element.find(header+"Status").text
        lastlocation = element.find(header+"Lastlocation").text
        rows.append({"Train Code": traincode,"Scheduled Arrival": scharrival, "Expected Arrival": exparrival,"Scheduled Departure": schdepart, "Expected Departure": expdepart, "From": origin, "Destination": destination, "Due In": duein, "Status": status, "Last Location": lastlocation})

    dfTimetable = pd.DataFrame(rows, columns = cols)
    htmlTimetable = dfTimetable.to_html()
    output = open("timetable.html", "w")
    output.write("<head><title>Maynooth Station Timetable</title></head><h1>Maynooth Train Station Timetable</h1>"+htmlTimetable)
    output.close()
    print("Timetable build for Maynooth Station.\nHTML table can be found in ./timetable.html")
       
if __name__ == "__main__":
    main()