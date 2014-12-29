class Api::V1::FiltersController < Api::V1::BaseController
  DEFAULT_PAGE_PER = 10

  def show
    @products = Product
      .preload(:tags)
      .joins(:product_filters)
      .joins(:filters)
      .where(filters: { id: params[:id] })
      .distinct
      .page(params[:page])
      .per(DEFAULT_PAGE_PER)
      .decorate
  end
end
