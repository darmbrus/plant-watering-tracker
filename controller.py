import requests
import serial

payload = {'session':{'email':'david.armbrust@gmail.com','password':'Ovation1'}}

session = requests.Session()
r = session.post('http://localhost:3000/login', json=payload)

print r.status_code

# payload = {'plant':{'name':'Test Name','species':'Test species','days_per_watering':'9','start_date':'9/9/1999'}}
# r = session.post('http://localhost:3000/plants', json=payload)

# print r.status_code
ser = serial.Serial('/dev/cu.usbmodem1421', 9600)
while True:
    line_read = ser.readline()
    print "--------line read---------"
    print line_read
    payload = {'plant':{'name':'ArduinoPlant','species':'Test species','days_per_watering':line_read,'start_date':'9/9/1999'}}
    r = session.post('http://localhost:3000/plants', json=payload)
ser.close()
