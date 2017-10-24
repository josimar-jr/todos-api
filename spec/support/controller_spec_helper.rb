# spec/support/controller_spec_helper.rb
module ControllerSpecHelper
  # generate tokens from user id
  def token_generator(user_id)
    JsonWebToken.encode( user_id: user_id )
  end

  # generate expired tokens from user id
  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  # return valid header
  def valid_headers
    { "Authorization" => token_generator(user.id), "Content-Type" => "application/json" }
  end

  # return invalid header
  def invalid_headers
    { "Authorization" => nil, "Content-Type" => "application/json" }
  end
end