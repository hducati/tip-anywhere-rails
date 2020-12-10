# frozen_string_literal: true

# Controller of actions regarding the Tip model
class UserTipsController < ApplicationController
  def index
    @tips = current_user.tips
    json_response(@tips)
  end

  def create
    @tip = current_user.tips.create!(tip_params)
    json_response(@tip, :created)
  end

  def show
    json_response(@tip)
  end

  def update
    current_user.tips(@tip)
    @tip.update(params.permit(status), closed: true)
    json_response(@tip, :accepted)
  end
end

private

def tip_params
  params.permit(:odd, :tip, :game, :unit)
end

def set_tip
  @tip = Tip.find(params[:id])
end
