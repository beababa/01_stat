select * from bv;
select * from inter;
select recovergeometrycolumn('bv', 'GEOMETRY', 2, 'MULTIPOLYGON',2);
select * from sqlite_master where type='trigger' and lower(tbl_name)='bv'
select b.bureau,  i.ogc_fid,st_intersection(b.GEOMETRY, i.GEOMETRY) as geom
from bv as b, inter as i
where st_intersects(b.GEOMETRY, i.GEOMETRY);