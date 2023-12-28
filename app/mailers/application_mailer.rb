# typed: true
# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  extend T::Sig

  default from: 'from@example.com'
  layout 'mailer'
end
