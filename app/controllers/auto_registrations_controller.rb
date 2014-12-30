class AutoRegistrationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @coordinations = Coordination.where(user_id: current_user.id)
  end
end
