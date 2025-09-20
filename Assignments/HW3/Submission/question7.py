import math
import simplekml

R = 90  
r = 36  
a = 44

center_x = 34.02059366039974
center_y = -118.28530386340735 
scale=0.0001

def spirograph_coordinates(theta):
    x = scale * ((R + r) * math.cos((r / R) * t) - a * math.cos((1 + r / R) * t))
    y = scale * ((R + r) * math.sin((r / R) * t) - a * math.sin((1 + r / R) * t))
    return x, y

kml = simplekml.Kml()
center_placemark = kml.newpoint(name="Center", coords=[(center_y, center_x)])

n =2
coordinates = []
for t in range(0, int(n * math.pi * 100), 1):
    theta = t / 100.0  
    x, y = spirograph_coordinates(theta)
    lat = center_x + x
    lon = center_y + y
    coordinates.append((lon, lat))

linestring = kml.newlinestring(name="Spirograph")
linestring.linestyle.width = 2
linestring.coords = coordinates

kml_file = "spiro.kml"
kml.save(kml_file)

print(f"KML file '{kml_file}' generated successfully!")
