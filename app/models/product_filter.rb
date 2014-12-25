# == Schema Information
#
# Table name: product_filters # 成果物/フィルタ関連
#
#  id         :integer          not null, primary key
#  product_id :integer          not null              # 成果物ID
#  filter_id  :integer          not null              # フィルタID
#  created_at :datetime         not null              # 作成日時
#  updated_at :datetime         not null              # 更新日時
#

class ProductFilter < ActiveRecord::Base
end
