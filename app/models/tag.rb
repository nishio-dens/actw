# == Schema Information
#
# Table name: tags # タグ
#
#  id             :integer          not null, primary key
#  name           :string(255)      not null              # タグ名
#  taggings_count :integer          default(0), not null  # タグ数
#  created_at     :datetime         not null              # 作成日時
#  updated_at     :datetime         not null              # 更新日時
#

class Tag < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 255 }
end
