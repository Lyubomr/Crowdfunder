class ApplicationMailer < ActionMailer::Base
  default from: "donotreply@crowdfunder.com"
  layout 'mailer'
end
