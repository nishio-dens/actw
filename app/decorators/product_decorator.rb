class ProductDecorator < Draper::Decorator
  delegate_all

  def display_published_at
    published_at.strftime("%Y年%m月%d日")
  end
end
