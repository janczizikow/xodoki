# frozen_string_literal: true

class AccountController < ApplicationController
  def account
    @user = current_user
    authorize @user
  end

  def password
    @user = current_user
    authorize @user
  end

  def hikes
    @hikes = Hike.my(current_user)
    authorize @hikes
  end
end
