update filters
set filters.data_count = (
  select count(*)
  from product_filters pf
  where pf.filter_id = filters.id
  group by filter_id
)
;
