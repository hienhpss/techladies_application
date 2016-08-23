require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(name:"aaa", email:"aaa@aaa.com")
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
  
end
