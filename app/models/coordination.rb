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
#  category_id       :integer                                 # カテゴリID
#  last_updated_at   :datetime                                # 最終連携日時
#  created_at        :datetime         not null               # 作成日時
#  updated_at        :datetime         not null               # 更新日時
#

class Coordination < ActiveRecord::Base
  extend DivisionAssociationUseable

  has_many :coordination_conditions, dependent: :destroy
  has_many :coordination_exclude_conditions, dependent: :destroy
  has_many :coordination_filters, dependent: :destroy
  has_many :filters, through: :coordination_filters

  accepts_nested_attributes_for :coordination_conditions, allow_destroy: true
  accepts_nested_attributes_for :coordination_exclude_conditions, allow_destroy: true

  validates :title, presence: true, length: { maximum: 255 }
  validates :url, length: { maximum: 4096 }
end
