require 'test_helper'
require "fixtures/sample_mail"

class MailFormTest < ActiveSupport::TestCase
  
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
end
