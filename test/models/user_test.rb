require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test 'user can be instantiated' do
    u = User.new
    refute u.nil?
  end

  test 'empty user can not be valid' do
    u = User.new
    refute u.valid?
  end

  test 'this test can generate a valid user' do
    u = create_a_valid_user
    assert u.valid?
  end

  test 'user must have an email valid to be valid' do
    u = create_a_valid_user
    u.email = 'this is an invalid email.com.br'
    refute u.valid?
  end



  private

  def create_a_valid_user
    User.create!(email: 'valid@iugu.com.br',
                 password: '123456')
  end
end
