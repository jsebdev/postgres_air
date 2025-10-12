with bl_per_booking as (
	select
		bl.booking_id,
		count(*) as bl_count
	from
		booking_leg bl 
	group by bl.booking_id 
),
p_per_booking as (
	select
		p.booking_id,
		count(*) as p_count
	from
		passenger p 
	group by p.booking_id 
)
select 
	b.booking_id ,
	blpb.bl_count,
	ppb.p_count
from booking b 
join bl_per_booking blpb on b.booking_id = blpb.booking_id
join p_per_booking ppb on b.booking_id  = ppb.booking_id
order by bl_count desc
;

-- QUERY PLAN                                                                                                                    |
-- ------------------------------------------------------------------------------------------------------------------------------+
-- Sort  (cost=1828892.44..1829223.85 rows=132565 width=24)                                                                      |
--   Sort Key: (count(*)) DESC                                                                                                   |
--   ->  Merge Join  (cost=948998.91..1814894.09 rows=132565 width=24)                                                           |
--         Merge Cond: (b.booking_id = bl.booking_id)                                                                            |
--         ->  Merge Join  (cost=948998.48..1277622.71 rows=576527 width=20)                                                     |
--               Merge Cond: (b.booking_id = p.booking_id)                                                                       |
--               ->  Index Only Scan using booking_pkey on booking b  (cost=0.43..154704.49 rows=5954164 width=8)                |
--               ->  Finalize GroupAggregate  (cost=948998.04..1095060.94 rows=576527 width=12)                                  |
--                     Group Key: p.booking_id                                                                                   |
--                     ->  Gather Merge  (cost=948998.04..1083530.40 rows=1153054 width=12)                                      |
--                           Workers Planned: 2                                                                                  |
--                           ->  Sort  (cost=947998.02..949439.34 rows=576527 width=12)                                          |
--                                 Sort Key: p.booking_id                                                                        |
--                                 ->  Partial HashAggregate  (cost=808396.10..882976.95 rows=576527 width=12)                   |
--                                       Group Key: p.booking_id                                                                 |
--                                       Planned Partitions: 8                                                                   |
--                                       ->  Parallel Seq Scan on passenger p  (cost=0.00..312923.94 rows=8808394 width=4)       |
--         ->  GroupAggregate  (cost=0.44..517390.83 rows=1369087 width=12)                                                      |
--               Group Key: bl.booking_id                                                                                        |
--               ->  Index Only Scan using booking_leg_booking_id on booking_leg bl  (cost=0.44..411362.84 rows=18467424 width=4)|
-- JIT:                                                                                                                          |
--   Functions: 15                                                                                                               |
--   Options: Inlining true, Optimization true, Expressions true, Deforming true                                                 |
