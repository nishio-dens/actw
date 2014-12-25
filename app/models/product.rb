# == Schema Information
#
# Table name: products # 成果物
#
#  id           :integer          not null, primary key # ID
#  title        :string(255)      not null              # タイトル
#  description  :text                                   # 概要
#  url          :text             not null              # URL
#  category_id  :integer                                # カテゴリID
#  user_id      :integer          not null              # ユーザID
#  published_at :datetime         not null              # 公開日
#  created_at   :datetime         not null              # 作成日時
#  updated_at   :datetime         not null              # 更新日時
#

class Product < ActiveRecord::Base
  acts_as_taggable_on :tags
end
