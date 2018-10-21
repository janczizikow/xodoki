# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@xodki.org'
  layout 'mailer'
end
