class Api::V1::RegistrationsController < ActionController::API
  def create
    user = User.new(user_params)
    user.api_token = SecureRandom.hex(20)

    if user.save
      render json: { token: user.api_token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
