object false
node(:products_count) { @products.count }
child(@products) do
  attributes :id, :title, :url, :description, :category_id, :user_id, :published_at
end
