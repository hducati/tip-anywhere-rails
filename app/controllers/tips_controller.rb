# Controller of actions regarding the Tip model

class TipsController < ApplicationController
  def index
    @tips = Tip.where.not(user_id: current_user.id)
    json_response(@tips)
  end
end

private

def tip_params
  params.permit(:odd, :tip, :game, :unit)
end
