module DivisionAssociationUseable
  def belongs_to_division(association_id, options = {})
    options = options.reverse_merge(
      class_name: association_id.to_s.camelize,
      foreign_key: association_id.to_s.foreign_key
    )
    define_method(association_id) do
      Object
        .const_get(options[:class_name])
        .get(self.send(options[:foreign_key]))
    end
  end
end
