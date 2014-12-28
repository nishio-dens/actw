class ManualRegistrationsController < ApplicationController
  def new
    @form = Form::Product.new
  end

  def create
    @form = Form::Product.new(product_params)
    if @form.save
      redirect_to mypage_path, flash: { success: "#{@form.title} を登録しました" }
    else
      render :new
    end
  end

  private

  def product_params
  end
end
