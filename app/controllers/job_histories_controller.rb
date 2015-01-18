class JobHistoriesController < ApplicationController
  def show
    @job_history = AutoCoordinationJobHistory
      .find_by!(user_id: current_user.id, id: params[:id])
    @products = Product.where(job_number: @job_history.id).decorate
  end

  def destroy
    @job_history = AutoCoordinationJobHistory
      .find_by!(user_id: current_user.id, id: params[:id])
    Product.transaction do
      Product.where(job_number: @job_history.id, manual: false).destroy_all
      @job_history.destroy
    end
    redirect_to auto_registrations_path,
      flash: { success: "#{@job_history.job_name}にて連携したデータを削除しました" }
  end
end
