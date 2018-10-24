# frozen_string_literal: true

class PasswordsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def update
    if @user.update_with_password(password_params)
      bypass_sign_in(@user)
      flash[:notice] = 'Password updated!'
      redirect_to account_password_path
    else
      flash[:alert] = @user.errors.full_messages.join(', ')
      render 'account/password'
    end
  end

  private

  def set_user
    @user = current_user
    authorize @user
  end

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
