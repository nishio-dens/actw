class Api::V1::FiltersController < Api::V1::BaseController
  def show
    @products = Product
      .preload(:tags)
      .joins(:product_filters)
      .joins(:filters)
      .where(filters: { id: params[:id] })
      .distinct
      .page(params[:page])
  end
end
