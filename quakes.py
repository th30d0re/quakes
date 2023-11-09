# lab 10 Web Json Earthquake

import datetime # will use later 
#CH 5.1 Fetching internet Data
import urllib.request


# CH 5.2 Working with JSON Data
import json

def  printResults(data):
    Json = json.loads(data.decode('utf-8'))

    if "title" in Json["metadata"]:
        print(Json["metadata"]["title"])

    count = Json["metadata"]["count"]
    print(str(count) + " events recorded")

    for i in Json["features"]:
        print(i["properties"]["place"])
    print("----------------\n")

    for i in Json["features"]:
        if i["properties"]["mag"] >= 4.0:
            print("%2.1f" % i["properties"]["mag"], i["properties"]["place"])
    print("----------------\n")

    print("Events that were felt:")
    for i in Json["features"]:
        feltReports = i["properties"]["felt"]
        if feltReports != None:
            if feltReports > 0:
                print("%2.1f" % i["properties"]["mag"], i["properties"]["place"],
                " reported " +str(feltReports) + " times")
    print("----------------\n")
def ch5_2():
    urlData = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson"

    url = urllib.request.urlopen(urlData)
    print("result code: " + str(url.getcode()))
    if (url.getcode() == 200):
        data = url.read()
        printResults(data)
    else:
        print("Received error, cannot parse results")


# eprint
def eprint(i):
    time = i["properties"]["time"] # getting Time 
    date = datetime.datetime.fromtimestamp(time / 1e3) # formating timestamp

    # getting lat, lon, and dep
    geo = i["geometry"]["coordinates"]
    print(i["properties"]["place"] + " @ " + str(date))
    Lat = "Latitude:" + str(geo[0]) + "°"
    Lon = "Longitude:"+ str(geo[1]) + "°"
    Dep = "Depth:" + str(geo[2])
    print(" > Coordinates: " + Lat + "," + Lon + ", " + Dep)
    print("----------------\n")

# Lab 10
def lab10():
    # Part 1:  Request and Analyze JSON Data

    # grabbing significant Earthquakes in the past 7 days
    sig7 = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_week.geojson"

    # check to make sure url works
    url = urllib.request.urlopen(sig7)
    print("Result Code: " + str(url.getcode()))
    
    if (url.getcode() == 200):
        data = url.read() #getting json data
        data = json.loads(data.decode('utf-8')) # insuring ift-8 is used to decode 
        # print title 
        print(data["metadata"]["title"])

        # print number of Earthquakes
        count = data["metadata"]["count"]
        print(str(count) + " events occurred")

        print("------------------------\n")
        print("Printing events:")

        for i in data["features"]:
            eprint(i)

        # leting the user choose
        choice = input("Choose Event: ")
        choice = int(choice)
        eprint(2)


    

        
    else:
        print("Received error, cannot parce results")

    

    
    


def main():
    lab10()    


##
if __name__ == "__main__":
    main()
