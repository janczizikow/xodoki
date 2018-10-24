# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def update
    if @user.update(user_params)
      bypass_sign_in(@user)
      flash[:notice] = 'Profile updated!'
      redirect_to account_path
    else
      flash[:alert] = @user.errors.full_messages
      render 'account/account'
    end
  end

  private

  def set_user
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :username, :avatar, :avatar_cache, :remove_avatar)
  end
end
