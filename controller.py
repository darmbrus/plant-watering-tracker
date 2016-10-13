import requests

payload = {'session':{'email':'david.armbrust@gmail.com','password':'Ovation1'}}

r = requests.post('http://localhost:3000/login', json=payload)

print r.status_code
