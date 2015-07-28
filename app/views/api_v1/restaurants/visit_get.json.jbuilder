json.data @visits do |res|

json.id res.restaurant.id
json.name res.restaurant.name
json.tel res.restaurant.tel
json.address res.restaurant.address
json.latitude res.restaurant.latitude
json.longitude res.restaurant.longitude
json.image res.restaurant.image_url

end