class ApplicationMailer < ActionMailer::Base
  default from: ENV["ENNOVAR_HPC_GMAIL_EMAIL"]
  layout 'mailer'
end
