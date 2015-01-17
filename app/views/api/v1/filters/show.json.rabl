object false
child(@products) do |product|
  attributes :id, :category_id, :user_id, :published_at, :display_published_at
  node(:title) { |m| Sanitize.clean(m.title) }
  node(:url) { |m| Sanitize.clean(m.url) }
  node(:description) { |m| Sanitize.clean(m.description) }
  node(:tags) { |m| m.tags.map(&:name) }
end
