json.data @restaurants do |res|

json.name res.name
json.tel res.tel
json.address res.address
#json.latitude Geocoder.coordinates(res.address)[0]
#json.longtitude Geocoder.coordinates(res.address)[1]


end