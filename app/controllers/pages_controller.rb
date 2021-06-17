# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_page, only: :show

  def home
    @pagy, @hikes = pagy Hike.where(nil).order(sort)
    @pagy, @hikes = pagy Hike.upcoming if params[:upcoming].present?
    @pagy, @hikes = pagy Hike.past if params[:past].present?
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

  def filter_params(params)
    params.slice(:category, :direction)
  end
end
