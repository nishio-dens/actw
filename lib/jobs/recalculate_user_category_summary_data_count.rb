# ユーザカテゴリ集計 再集計バッチ
# bundle exec rails runner 'Jobs::RecalculateUserCategorySummaryDataCount.execute'
class Jobs::RecalculateUserCategorySummaryDataCount
  def self.execute
    UserCategorySummary.all.each do |summary|
      actual_data_count =
        if summary.category_id == Category.all_category_id
          Product.where(user_id: summary.user_id).count
        else
          Product.where(user_id: summary.user_id, category_id: summary.category_id).count
        end
      if summary.data_count != actual_data_count
        summary.update(data_count: actual_data_count)
      end
    end
  end
end
