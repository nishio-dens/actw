class Api::V1::ProductsController < Api::V1::BaseController
  def index
    @products = Product
      .joins(:product_filters)
      .joins(:filters)
      .where(filters: { id: params[:id] })
      .page(params[:page])
  end
end
