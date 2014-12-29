select 'ユーザカテゴリ集計にcategory_idのデータが無い', users.id, products.category_id
from users
inner join products
on users.id = products.user_id
where not exists(
  select 1
  from user_category_summaries summary
  where products.category_id = summary.category_id and users.id = summary.user_id
)
and products.category_id is not NULL
;

-- ユーザが持つ成果物の数と、ユーザカテゴリ集計のカテゴリ「すべて」に保存されているデータ数が違う
select users.id, count(*) expect_count, max(summary.data_count) actual_count
from users
inner join products
on users.id = products.user_id
left outer join user_category_summaries summary
on summary.category_id = 1 and summary.user_id = users.id
group by users.id
having expect_count != actual_count
;

-- ユーザが持つカテゴリ付された成果物の数と、ユーザカテゴリ集計のカテゴリに保存されているデータ数が違う
select users.id, products.category_id, count(*) expect_data_count, max(summary.data_count) actual_data_count
from users
inner join products
on users.id = products.user_id
left outer join user_category_summaries summary
on summary.user_id = users.id and summary.category_id = products.category_id
where products.category_id is not NULL
group by users.id, products.category_id
having expect_data_count != actual_data_count
;
