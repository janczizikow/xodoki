# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_page, only: :show

  def home
    @pagy, @hikes = pagy hikes
    @pagy, @hikes = pagy @hikes.search(params[:search]) if params[:search].present?
  end

  def show; end

  def users
    @users = User.all
  end

  private

  def set_page
    @page = Page.friendly.find(params[:id])
  end

  def sort
    case params[:sort]
    when 'recent'
      'created_at DESC'
    when 'date_ascending'
      'date ASC'
    else
      'date DESC'
    end
  end

  def hikes
    return Hike.upcoming if params.dig(:upcoming).present?
    return Hike.past if params.dig(:past).present?

    Hike.where(nil).order(sort)
  end
end
