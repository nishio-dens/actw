select f.id, max(data_count) actual_data_count, count(*) expect_data_count
from filters f
inner join product_filters pf
on f.id = pf.filter_id
group by f.id
having actual_data_count != expect_data_count
;
