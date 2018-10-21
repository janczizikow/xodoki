# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    column :id
    column :email
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'Создать Пользователя' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    actions
  end
end
