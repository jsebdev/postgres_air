select 
	b.booking_id,
	count(distinct bl.booking_leg_id ) as bl_count,
	count(distinct p.passenger_id) as p_count
from booking b 
join booking_leg bl using(booking_id)
join passenger p using(booking_id)
group by b.booking_id
order by bl_count desc
;

-- QUERY PLAN                                                                                                                           |
-- -------------------------------------------------------------------------------------------------------------------------------------+
-- Sort  (cost=9555029.94..9569915.35 rows=5954164 width=24)                                                                            |
--   Sort Key: (count(DISTINCT bl.booking_leg_id)) DESC                                                                                 |
--   ->  GroupAggregate  (cost=3586389.80..8640807.72 rows=5954164 width=24)                                                            |
--         Group Key: b.booking_id                                                                                                      |
--         ->  Incremental Sort  (cost=3586389.80..8089504.30 rows=65568238 width=16)                                                   |
--               Sort Key: b.booking_id, bl.booking_leg_id                                                                              |
--               Presorted Key: b.booking_id                                                                                            |
--               ->  Merge Join  (cost=3586389.20..6016151.07 rows=65568238 width=16)                                                   |
--                     Merge Cond: (b.booking_id = p.booking_id)                                                                        |
--                     ->  Merge Join  (cost=6.25..1347263.16 rows=18467424 width=16)                                                   |
--                           Merge Cond: (b.booking_id = bl.booking_id)                                                                 |
--                           ->  Index Only Scan using booking_pkey on booking b  (cost=0.43..154704.49 rows=5954164 width=8)           |
--                           ->  Index Scan using booking_leg_booking_id on booking_leg bl  (cost=0.44..946844.78 rows=18467424 width=8)|
--                     ->  Materialize  (cost=3586361.27..3692062.00 rows=21140146 width=8)                                             |
--                           ->  Sort  (cost=3586361.27..3639211.64 rows=21140146 width=8)                                              |
--                                 Sort Key: p.booking_id                                                                               |
--                                 ->  Seq Scan on passenger p  (cost=0.00..436241.46 rows=21140146 width=8)                            |
-- JIT:                                                                                                                                 |
--   Functions: 17                                                                                                                      |
--   Options: Inlining true, Optimization true, Expressions true, Deforming true                                                        |
