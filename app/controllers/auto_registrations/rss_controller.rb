class AutoRegistrations::RssController < ApplicationController
  def new
    @form = Form::Rss.new
  end

  def create
    binding.pry
    @form = Form::Rss.new(registration_params)
    if @form.save
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def registration_params
    params.require(:form_rss).permit(Form::Rss::PERMITTED_ATTRIBUTES)
  end
end
