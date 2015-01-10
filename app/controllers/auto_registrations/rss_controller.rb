class AutoRegistrations::RssController < ApplicationController
  def new
    @form = Form::Rss.new
  end

  def create
    @form = Form::Rss.new(registration_params.merge(user_id: current_user.id))
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
