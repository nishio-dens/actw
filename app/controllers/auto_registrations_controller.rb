class AutoRegistrationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @coordinations = Coordination.where(user_id: current_user.id)
  end

  def execute_coordination
    coordination = Coordination.find_by(user_id: current_user.id, id: params[:id])
    RssCrawlJob.perform_later(coordination)
    redirect_to auto_registrations_path,
      flash: { success: "#{coordination.title} の設定を元に、外部サイトからのデータ取得を開始しました。" }
  end

  def switch_auto_coordination
  end

  def destroy
  end
end
