# == Schema Information
#
# Table name: coordinations # 自動連携
#
#  id                   :integer          not null, primary key
#  user_id              :integer          not null              # ユーザID
#  title                :string(255)      not null              # 連携名
#  url                  :text(65535)                            # 連携先URL
#  coordination_type_id :integer          not null              # 連携先タイプ
#  created_at           :datetime         not null              # 作成日時
#  updated_at           :datetime         not null              # 更新日時
#

class Coordination < ActiveRecord::Base
end