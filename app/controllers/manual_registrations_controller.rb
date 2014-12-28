class ManualRegistrationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @form = Form::Product.new
  end

  def create
    @form = Form::Product.new(product_params.merge(user_id: current_user.id))
    if @form.save
      redirect_to mypages_path, flash: { success: "#{@form.title} を登録しました" }
    else
      render :new
    end
  end

  def edit
    @form = Form::Product
      .where(user_id: current_user.id)
      .find(params[:id])
  end

  def update
  end

  def destroy
    render text: 'TODO'
  end

  private

  def product_params
    params
      .require(:form_product)
      .permit(Form::Product::PERMITTED_ATTRIBUTES + Form::Product::REGISTRABLE_RELATIONS)
  end
end
