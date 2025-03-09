---- intersection 1
select * from Filosofi2015_carreaux_1000m_metropole  limit 10;
select f.Men_pauv, f.geometry from Filosofi2015_carreaux_1000m_metropole as f, villes2154 as v
where st_intersects(f.geometry, v.geometry)


select * from bv;

select * from inter;
-- aire et transformation
select distinct(st_srid(inter.geometry)) as SRID from inter;
select st_area(inter.geometry) from inter;
select st_area(st_transform(inter.geometry, 2154))/1000000 as geom from inter;

--select recovergeometrycolumn('bv', 'GEOMETRY', 2, 'MULTIPOLYGON',2);

--select * from sqlite_master where type='trigger' and lower(tbl_name)='bv'


select b.bureau,  i.ogc_fid, st_intersection(b.GEOMETRY, i.GEOMETRY) as geom, st_area(st_intersection(b.GEOMETRY, i.GEOMETRY)) as aire

from bv as b, inter as i

where st_intersects(b.GEOMETRY, i.GEOMETRY);


select st_transform(i.geometry, 2154)
from inter as i;