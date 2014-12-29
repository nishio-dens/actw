class UserGenresController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @category_summary = @user
      .user_category_summaries
      .find_by(category_id: params[:id])
    @category = @category_summary.category
    @products = if @category.id == Category.all_category_id
                  Product.where(user_id: @user.id)
                else
                  Product.where(user_id: @user.id, category_id: @category.id)
                end
    @products = @products
      .preload(:tags)
      .order(published_at: :desc)
      .distinct
      .page(params[:page])
      .decorate
  end
end
