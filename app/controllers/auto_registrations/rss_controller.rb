class AutoRegistrations::RssController < ApplicationController
  before_action :authenticate_user!

  def new
    @form = Form::Rss.new
  end

  def create
    @form = Form::Rss.new(registration_params.merge(user_id: current_user.id))
    if @form.save
      redirect_to auto_registrations_path, flash: { success: "#{@form.title} を登録しました。" }
    else
      render :new
    end
  end

  def edit
    @form = Form::Rss.find_by(user_id: current_user.id, id: params[:id])
  end

  def update
    @form = Form::Rss.find_by(user_id: current_user.id, id: params[:id])
    @form.attributes = registration_params
    if @form.save
      redirect_to auto_registrations_path, flash: { success: "#{@form.title} を更新しました。" }
    else
      render :edit
    end
  end

  private

  def registration_params
    params.require(:form_rss).permit(Form::Rss::PERMITTED_ATTRIBUTES)
  end
end
