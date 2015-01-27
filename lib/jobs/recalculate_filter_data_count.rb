# フィルターデータ数 再集計バッチ
# bundle exec rails runner 'Jobs::RecalculateFilterDataCount.execute'
class Jobs::RecalculateFilterDataCount
  def self.execute
    Filter.all.each do |filter|
      actual_data_count = filter.products.count
      if filter.data_count != actual_data_count
        filter.update(data_count: actual_data_count)
      end
    end
  end
end
