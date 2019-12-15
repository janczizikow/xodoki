# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    include Administrate::Punditize
    before_action :authenticate_user!
    before_action :ensure_admin!

    def ensure_admin!
      user_not_authorized unless current_user.try(:admin?)
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end

    private

    def user_not_authorized
      redirect_to(request.referer || root_path, alert: 'You are not authorized to perform this action.')
    end
  end
end
