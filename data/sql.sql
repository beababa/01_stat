-- sélection simple
select * from bv;
select * from iris limit 10;
select st_area(geomfromwkb(bv.GEOMETRY)) as aire from bv;
select st_area(geomfromwkb(iris.GEOMETRY)) as aire from iris;
-- sélection attributaire
select nom_iris,iris.dec_q119 from iris where iris.insee_com like 93010;
-- sélection spatiale et attributaire
select iris.nom_iris , bv.bureau,  st_intersection(geomfromwkb(iris.GEOMETRY), geomfromwkb(bv.GEOMETRY)) as geom
from iris, bv
where st_intersects(geomfromwkb(iris.GEOMETRY), geomfromwkb(bv.GEOMETRY)) 
-- calcul 
select iris.nom_iris , bv.bureau,  sum(st_intersects(geomfromwkb(iris.GEOMETRY), geomfromwkb(bv.GEOMETRY)) ) as nb, 
sum(st_area (st_intersection(geomfromwkb(iris.GEOMETRY), geomfromwkb(bv.GEOMETRY)) ) )as aire
from iris, bv
where st_intersects(geomfromwkb(iris.GEOMETRY), geomfromwkb(bv.GEOMETRY)) 
group by bv.bureau;