# == Schema Information
#
# Table name: products # 成果物
#
#  id           :integer          not null, primary key  # ID
#  title        :string(255)      not null               # タイトル
#  url          :text(65535)      not null               # URL
#  description  :text(65535)                             # 概要
#  category_id  :integer                                 # カテゴリID
#  user_id      :integer          not null               # ユーザID
#  published_at :datetime         not null               # 公開日
#  manual       :boolean          default("0"), not null # 手動登録
#  created_at   :datetime         not null               # 作成日時
#  updated_at   :datetime         not null               # 更新日時
#

class Form::Product < Product
  include HabtmReservedUpdatable

  PERMITTED_ATTRIBUTES = %i(
    title url description category_id published_at tag_list
    published_at(1i) published_at(2i) published_at(3i) published_at(4i) published_at(5i)
  )
  REGISTRABLE_RELATIONS = [filter_ids: []]

  has_and_belongs_to_many_reserved_update :filters, through: :product_filters

  before_save :setup_manual_registration

  private

  def setup_manual_registration
    self.manual = true
  end
end
