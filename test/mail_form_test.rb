require 'test_helper'
require "fixtures/sample_mail"

class MailFormTest < ActiveSupport::TestCase
  
  setup do
    ActionMailer::Base.deliveries.clear
  end

  test "sample_mail has name and mail attributes" do
    sample = SampleMail.new

    sample.name = "User"
    sample.email = "pablo@pabloformoso.com"

    assert_equal("User", sample.name)
    assert_equal("pablo@pabloformoso.com", sample.email)
  end

  test "sample_mail can clear attributes using clear_ prefix" do
    sample = SampleMail.new

    sample.name = "User"
    sample.email = "pablo@pabloformoso.com"
    assert_equal("User", sample.name)
    assert_equal("pablo@pabloformoso.com", sample.email)

    sample.clear_name
    sample.clear_email
    assert_nil(sample.name)
    assert_nil(sample.email)
  end

  test "sample_mail can ask if attr is present with ?" do
    sample = SampleMail.new
    assert(!sample.name?, "Failure message.")

    sample.name = "User"
    assert(sample.name?, "Failure message.")

    sample.email = ""
    assert(!sample.email?, "Failure message.")
  end

  test "delivery an email with attributes" do
    sample = SampleMail.new
    sample.email = "pablo@pabloformoso.com"
    sample.deliver

    assert_equal(1, ActionMailer::Base.deliveries.size)

    mail = ActionMailer::Base.deliveries.last
    assert_equal(["pablo@pabloformoso.com"], mail.from)
    assert_match(/pablo@pabloformoso.com/, mail.body.encoded)
  end 

  test "validates abscense of nickname" do
    sample = SampleMail.new(nickname: "Spam")
    assert !sample.valid?
    assert_equal(["is invalid"], sample.errors[:nickname])
  end
  
  test "provides before and after deliver callbacks" do
    sample = SampleMail.new(email: "pablo@pabloformoso.com")
    sample.deliver
    assert_equal([:before, :after], sample.evaluated_callbacks)
  end  

end
