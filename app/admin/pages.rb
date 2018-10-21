# frozen_string_literal: true

ActiveAdmin.register Page do
  permit_params :title, :content, :in_header, :in_footer
  before_action only: %i[show edit update destroy] do
    @page = Page.friendly.find(params[:id])
  end

  index do
    selectable_column
    column :id
    column :title
    column :slug
    column :in_header
    column :in_footer
    actions
  end

  form do |f|
    f.inputs 'Создать Страницу' do
      f.input :title
      div do
        f.input :content, as: :ckeditor, input_html: { ckeditor: { language: 'ru', toolbar: 'Full' } }
      end
      f.input :in_header
      f.input :in_footer
    end
    actions
  end
end
