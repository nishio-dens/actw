class Api::V1::ProductsController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    @products = Product
      .where(user_id: current_user.id)
      .order(published_at: :desc)
  end
end
