# == Schema Information
#
# Table name: division_coordination_types # 連携先タイプ
#
#  id            :integer          not null, primary key
#  name          :string(255)      not null              # 連携先タイプ
#  division_type :string(10)       not null              # 区分値
#

class Division::CoordinationType < ActiveRecord::Base
  include ActsAsDivision
  enum_accessor :division_type
end
