class Api::V1::FiltersController < Api::V1::BaseController
  def show
    @products = Product
      .joins(:product_filters)
      .joins(:filters)
      .where(filters: { id: params[:id] })
      .page(params[:page])
  end
end
