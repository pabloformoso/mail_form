class ContactForm < MailForm::Base

  attributes :name, :email, :message

  def headers
    { to: "pablo@pabloformoso.com", from: self.email }
  end
end