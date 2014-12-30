# == Schema Information
#
# Table name: division_coordination_types # 連携先タイプ
#
#  id   :integer          not null, primary key
#  name :string(255)      not null              # 連携先タイプ
#

class Division::CoordinationType < ActiveRecord::Base
end
