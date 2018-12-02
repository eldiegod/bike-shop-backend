require 'test_helper'

class Resolvers::CreateCustomerTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateCustomer.new.call(nil, args, {})
  end

  test 'creating new customer' do
    customer = perform(
      name: 'Test Name',
      email: 'test@email.com',
    )

    assert customer.persisted?
    assert_equal customer.email, 'test@email.com'
    assert_equal customer.name, 'Test Name'
  end
end
