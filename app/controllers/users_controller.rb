# frozen_string_literal: true

class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  before_action :authorize, only: [:profile]

  def create
    user = User.create!(user_params)
    token = encode_token(user_id: user.id)
    render json: { user: UserSerializer.new(user), jwt: token }, status: :created
  end

  def profile
    render json: { user: UserSerializer.new(current_user)}, status: :accepted
  end

  private

  def user_params
    params.permit :name, :username, :password, :password_confirmation, :email, :location
  end

  def render_unprocessable_entity_response(invalid)
    render json: { error: invalid.record.errors }, status: :unprocessable_entity
  end
end
