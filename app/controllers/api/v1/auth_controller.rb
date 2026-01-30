class Api::V1::AuthController < ActionController::API
  def signup
    user = User.new(user_params)
    user.api_token = SecureRandom.hex

    if user.save
      render json: { token: user.api_token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      user.update!(api_token: SecureRandom.hex)
      render json: { token: user.api_token }
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end

  def logout
    authenticate_or_request_with_http_token do |token|
      user = User.find_by(api_token: token)
      user&.update(api_token: nil)
    end

    render json: { message: "Logged out" }
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end


