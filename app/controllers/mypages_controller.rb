class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = Filter
      .where(display_mypage: true, user_id: current_user.id)
      .order(:display_order)
  end
end
