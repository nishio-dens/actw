# == Schema Information
#
# Table name: user_profiles # ユーザプロフィール
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null              # ユーザID
#  profile    :text(65535)                            # プロフィール
#  created_at :datetime         not null              # 作成日時
#  updated_at :datetime         not null              # 更新日時
#

class UserProfile < ActiveRecord::Base
end
