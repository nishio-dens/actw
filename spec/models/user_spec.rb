# == Schema Information
#
# Table name: users # ユーザ
#
#  id         :integer          not null, primary key # ID
#  name       :string(255)      not null              # ユーザ名
#  created_at :datetime         not null              # 作成日時
#  updated_at :datetime         not null              # 更新日時
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end