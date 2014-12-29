# == Schema Information
#
# Table name: categories # カテゴリ
#
#  id         :integer          not null, primary key  # ID
#  name       :string(255)      not null               # カテゴリ名
#  selectable :boolean          default("1"), not null # ユーザが選択可能
#  created_at :datetime         not null               # 作成日時
#  updated_at :datetime         not null               # 更新日時
#

class Category < ActiveRecord::Base
end
