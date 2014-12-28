class Api::V1::ProductsController < Api::V1::BaseController
  def index
    @products = Product
      .where(user_id: params[:user_id])
      .order(published_at: :desc)
  end
end
