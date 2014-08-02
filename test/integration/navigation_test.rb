class NavigationTest < ActiveSupport::IntegrationCase

  setup do
    ActionMailer::Base.deliveries.clear
  end

  test "send an email after filling the form" do
    visit "/"

    fill_in "Name",  with: "Pablo"
    fill_in "Email",  with: "pablo@pabloformoso.com"
    fill_in "Message",  with: "Hola que tal"

    click_button "Deliver"

    assert_match("Your message was succesfully sent.", page.body)   
    assert_equal(1, ActionMailer::Base.deliveries.size)

    mail = ActionMailer::Base.deliveries.last

    assert_equal ["pablo@pabloformoso.com"], mail.from
    assert_equal ["pablo@pabloformoso.com"], mail.to
    assert_match /Hola que tal/, mail.body.encoded
  end

end