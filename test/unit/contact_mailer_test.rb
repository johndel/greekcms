require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "message" do
    @expected.subject = 'ContactMailer#message'
    @expected.body    = read_fixture('message')
    @expected.date    = Time.now

    assert_equal @expected.encoded, ContactMailer.create_message(@expected.date).encoded
  end

end
