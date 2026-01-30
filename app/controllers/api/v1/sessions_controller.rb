class Api::V1::SessionsController < ActionController::API
  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      user.update(api_token: SecureRandom.hex(20)) if user.api_token.blank?
      render json: { token: user.api_token }
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end
end
