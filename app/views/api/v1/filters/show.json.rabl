object false
node(:products_count) { @products.count }
child(@products) do |product|
  attributes :id, :title, :url, :description, :category_id, :user_id, :published_at, :display_published_at
  node(:tags) do |m|
    m.tags.map(&:name)
  end
end
