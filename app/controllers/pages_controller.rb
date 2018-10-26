# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_page, only: :show

  def home
    @hikes = Hike.where(nil).order(sort)
    @hikes = Hike.upcoming if params[:upcoming].present?
    @hikes = Hike.past if params[:pasr].present?
    # filter_params(params).each do |key, value|
    #   value["#{key}_id".to_sym].shift
    #   @hikes = @hikes.public_send(key, value) if value["#{key}_id".to_sym].all?(&:present?)
    # end
    @hikes = @hikes.search(params[:search]) if params[:search].present?
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
    when 'date_descending'
      'date DESC'
    else
      'date DESC'
    end
  end

  def filter_params(params)
    params.slice(:category, :direction)
  end
end
