# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :username

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :username
      f.input :password
      f.input :password_confirmation
    end
    f.button
  end
end
