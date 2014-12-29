class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = Filter
      .where(user_id: current_user.id)
      .order(:display_order)
    @user = User
      .preload(:user_category_summaries)
      .preload(:categories)
      .find(current_user.id)
  end
end
