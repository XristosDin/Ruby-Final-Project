class Api::V1::BaseController < ActionController::API
  before_action :authenticate_user_from_token!

  private

  def authenticate_user_from_token!
    auth_header = request.headers['Authorization']
    return render json: { error: "Unauthorized" }, status: :unauthorized unless auth_header

    token = auth_header.split.last
    user = User.find_by(api_token: token)

    if user
      @current_user = user
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end

  

