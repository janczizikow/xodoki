# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_page, only: :show

  def home
    scope = hikes
    scope = scope.search(params[:search]) if params[:search].present?
    @pagy, @hikes = paginate(scope)
  end

  def show; end

  def users
    @users = User.all
  end

  private

  # Pagy raises for a page that is not a positive integer or is past the last page,
  # which user-supplied params can easily be. Fall back to the first or last page instead.
  def paginate(scope)
    pagy scope, page: page_param
  rescue Pagy::OverflowError => e
    pagy scope, page: e.pagy.last
  end

  def page_param
    page = params[:page].to_s
    page.match?(/\A[1-9]\d*\z/) ? page.to_i : 1
  end

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
    return Hike.upcoming if params[:upcoming].present?
    return Hike.past if params[:past].present?

    Hike.where(nil).order(sort)
  end
end
