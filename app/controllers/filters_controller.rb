class FiltersController < ApplicationController
  def index
    @filters = Filter
      .all
      .order(display_mypage: :desc, display_order: :asc)
  end

  def new
    @form = Form::Filter.new
  end

  def create
    @form = Form::Filter.new(filter_params)
    if @form.valid?
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def filter_params
    params.require(:form_filter).permit(Form::Filter::PERMITTED_ATTRIBUTES)
  end
end
