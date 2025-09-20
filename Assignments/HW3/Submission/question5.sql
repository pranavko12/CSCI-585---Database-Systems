--Create extension PostGIS;
create table locations(loc_id int PRIMARY KEY NOT NULL, name varchar(20), loc geometry);
INSERT INTO locations(loc_id, name, loc) VALUES
	(1, 'StarbucksLeavey', ST_GeomFromText('POINT(-118.28259313775203 34.02130717752179)', 4326)),
	(2, 'CCF Fountain', ST_GeomFromText('POINT(-118.28339398072083 34.020482996298284)', 4326)),
	(3, 'THH', ST_GeomFromText('POINT(-118.28414304410141 34.02233417076148)', 4326)),
	(4, 'GWSU Fountain', ST_GeomFromText('POINT(-118.28523824483564 34.020299457091916)', 4326)),
	(5, 'Phone_GF_Sal', ST_GeomFromText('POINT(-118.28754450920427 34.021274488223405)', 4326)),
	(6, 'SGM', ST_GeomFromText('POINT(-118.2890404473907 34.02191390326487)', 4326)),
	(7, 'SAL', ST_GeomFromText('POINT(-118.28923681432437 34.01947234452206)', 4326)),
	(8, 'Phone_JMKC', ST_GeomFromText('POINT(-118.28742712586285 34.023369641306914)', 4326)),
	(9, 'Phone_McCarthy', ST_GeomFromText('POINT(-118.28595228036897 34.02536412239503)', 4326)),
	(10, 'Dulce', ST_GeomFromText('POINT(-118.28514100828846 34.0253792740012)', 4326)),
	(11, 'Starbucks_Vill', ST_GeomFromText('POINT(-118.28438818577652 34.024505115980915)', 4326)),
	(12, 'Fountain Leavy', ST_GeomFromText('POINT(-118.28326000513549 34.022267746221104)', 4326)),
	(13, 'Home', ST_GeomFromText('POINT(-118.28920422227644 34.02929472604578)', 4326));
	
	
--Convex Hull
SELECT ST_AsText(ST_ConvexHull(ST_Collect(loc))) FROM locations;

--Nearest Neighbours
SELECT name, ST_Distance(locations.loc, home.loc) AS distance
FROM locations
CROSS JOIN (SELECT loc FROM locations WHERE name = 'Home') AS home
WHERE locations.name != 'Home'
ORDER BY ST_Distance(locations.loc, home.loc)
LIMIT 4;