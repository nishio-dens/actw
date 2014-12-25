# == Schema Information
#
# Table name: taggings # タギング
#
#  id            :integer          not null, primary key
#  tag_id        :integer                                # タグID
#  taggable_id   :integer                                # タグ付け対象ID
#  taggable_type :string(255)                            # タグ付け対象クラス
#  tagger_id     :integer                                # タグ所有者ID
#  tagger_type   :string(255)                            # タグ所有者クラス
#  context       :string(128)                            # タグ種別
#  created_at    :datetime         not null              # 作成日時
#  updated_at    :datetime         not null              # 更新日時
#

class Tagging < ActiveRecord::Base
end
