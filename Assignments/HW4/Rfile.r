#install.packages('geosphere')
library(geosphere)
pol <- rbind(c(-118.28923681432437,34.01947234452206), c(-118.28920422227644,34.02929472604578), c(-118.28514100828846,34.0253792740012), c(-118.28438818577652,34.024505115980915), c(-118.28259313775203,34.02130717752179), c(-118.28339398072083,34.020482996298284), c(-118.28923681432437,34.01947234452206))
areaPolygon(pol)
perimeter(pol)
c <- centroid(pol)
c
c[1][1]
c[2][1]

#install.packages("leaflet")
library("leaflet")
m <- leaflet()
m <- addTiles(m)
# our centroid - right now, it's the centroid of the 'pol' polygon above 
m <- addMarkers(m, lng=c[1][1], lat=c[2][1], popup="Hull centroid")

m <- addCircleMarkers(m, lng=-118.28923681432437, lat=34.01947234452206, radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28920422227644, lat=34.02929472604578, radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28514100828846, lat=34.0253792740012, radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28438818577652, lat=34.024505115980915, radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28259313775203, lat=34.02130717752179, radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28339398072083, lat=34.020482996298284, radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28923681432437, lat=34.01947234452206, radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m