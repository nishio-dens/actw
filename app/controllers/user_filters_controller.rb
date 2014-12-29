class UserFiltersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @filter = Filter.find_by(user_id: @user.id, id: params[:id])
    @products = Product
      .joins(:product_filters)
      .where(product_filters: { filter_id: @filter.id })
      .order(published_at: :desc)
      .distinct
      .page(params[:page])
      .decorate
  end
end
