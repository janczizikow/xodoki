# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_page, only: :show

  def home
    @hikes = Hike.all.order('date DESC')
  end

  def show; end

  private

  def set_page
    @page = Page.friendly.find(params[:id])
  end
end
