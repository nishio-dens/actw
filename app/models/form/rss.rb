class Form::Rss < Coordination
  PERMITTED_ATTRIBUTES = %i(
    title url
  )

  before_save :set_coordination_type

  private

  def set_coordination_type
    self.coordination_type_id = Division::CoordinationType::RSS
  end
end
