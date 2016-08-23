require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(name:"aaa", email:"aaa@aaa.com", password:"abcdefgh", password_confirmation:"abcdefgh")
  end
  
  test "user should be valid" do
    assert @user.valid?
  end
  
 test "name should not be blank" do
   @user.name = ""
   assert_not @user.valid?
 end
 
  test "email should not be blank" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "name should not longer than 50" do
    @user.name = "a"*51
    assert_not @user.valid?
  end
  
  test "email should not longer than 255" do
    @user.email = "a"*244 + "@examplessis"
    assert_not @user.valid?
  end
  
  test "email should have valid format" do
    email_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    email_addresses.each do |email_address|
      @user.email = email_address
      assert_not @user.valid?, "#{email_addresses.inspect} should be invalid"
    end
  end
  
  test "email should be unique" do
    dup_user = @user.dup
    assert_not dup_user.valid?
  end
  
  test "case sensitive" do
    sen_user = @user.dup
    sen_user.email = @user.email.upcase
    assert_not sen_user.valid?
  end
  
  test "password should long enough" do
    @user.password = "a"*7
    assert_not @user.valid?
  end
  
end
