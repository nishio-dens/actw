class FiltersController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = Filter
      .where(user_id: current_user.id)
      .order(display_order: :asc)
  end

  def new
    @form = Form::Filter.new
  end

  def create
    @form = Form::Filter.new(filter_params.merge(user_id: current_user.id))
    if @form.save
      redirect_to filters_path, flash: { success: "#{@form.name} を登録しました。" }
    else
      render :new
    end
  end

  def edit
    @form = Form::Filter.find_by(user_id: current_user.id, id: params[:id])
  end

  def update
    @form = Form::Filter.find_by(user_id: current_user.id, id: params[:id])
    @form.attributes = filter_params
    if @form.save
      redirect_to filters_path, flash: { success: "#{@form.name} を更新しました。" }
    else
      render :new
    end
  end

  def destroy
    @form = Form::Filter.find_by(user_id: current_user.id, id: params[:id])
    @form.destroy
    redirect_to filters_path, flash: { success: "#{@form.name} を削除しました。" }
  end

  def sort
    @form = Form::Filter.find_by(user_id: current_user.id, id: params[:id])
    if @form.update_attributes(filter_sort_params)
      render json: { success: true }
    else
      render json: { success: false }, status: 500
    end
  end

  private

  def filter_params
    params.require(:form_filter).permit(Form::Filter::PERMITTED_ATTRIBUTES)
  end

  def filter_sort_params
    params.require(:filter).permit(:display_order_position)
  end
end
