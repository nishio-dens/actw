class ManualRegistrationsController < ApplicationController
  def new
    @form = Form::Product.new
  end

  def create
  end
end
