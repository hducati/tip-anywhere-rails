# frozen_string_literal: true

# Controller of actions regarding the Tip model
class UserTipsController < ApplicationController
  def index
    @tips = Tip.where.not(user_id: current_user.id)
    json_response(@tips)
  end

  def create
    tip = current_user.tip.create!(tip_params)
    json_response(tip, :created)
  end

  def show
    json_response(@tip)
  end

  def update
    @tip.update(params.permit(status))
    json_response(@user, :accepted)
  end
end

private

def tip_params
  params.permit(:odd, :tip, :game, :unit)
end

def set_tip
  @tip = Tip.find(params[:id])
end
