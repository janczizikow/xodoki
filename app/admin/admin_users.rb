# frozen_string_literal: true

ActiveAdmin.register AdminUser do
  controller do
    # before_action :authorize_index, only: :index
    # def authorize_index
    #   policy_scope(User)
    # end
    before_action :authorize_show_edit_destroy, only: %i[show edit destroy]

    def authorize_show_edit_destroy
      authorize resource
    end
  end

  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
