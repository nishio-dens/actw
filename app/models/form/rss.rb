# == Schema Information
#
# Table name: coordinations # 自動連携
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null               # ユーザID
#  title             :string(255)      not null               # 連携名
#  url               :text(65535)                             # 連携先URL
#  coordination_type :string(20)       not null               # 連携先タイプ
#  tagging           :boolean          default("1"), not null # タグ付け
#  category_id       :integer          not null               # カテゴリID
#  last_updated_at   :datetime                                # 最終連携日時
#  created_at        :datetime         not null               # 作成日時
#  updated_at        :datetime         not null               # 更新日時
#

class Form::Rss < Coordination
  PERMITTED_ATTRIBUTES = [
    :title, :url, :category_id, :tagging,
    filter_ids: [],
    coordination_conditions_attributes: %i(id condition_key predicate condition_value _destroy),
    coordination_exclude_conditions_attributes: %i(id condition_key predicate condition_value _destroy)
  ]

  validates :url, presence: true

  before_save :set_coordination_type

  private

  def set_coordination_type
    self.coordination_type = Division::CoordinationType::RSS.id
  end
end
