# == Schema Information
#
# Table name: taggings # タギング
#
#  id            :integer          not null, primary key
#  tag_id        :integer                                # タグID
#  taggable_id   :integer
#  taggable_type :string(255)
#  tagger_id     :integer
#  tagger_type   :string(255)
#  context       :string(128)
#  created_at    :datetime         not null              # 作成日時
#  updated_at    :datetime         not null              # 更新日時
#

class Tagging < ActiveRecord::Base
end
