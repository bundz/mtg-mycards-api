class UserController < ApplicationController
  before_action :authorize_request, except: %i[create login]

  def create
    user = User.new(user_params)

    return render status: :created if user.save

    render status: :bad_request
  end

  def login
    puts user_params[:email]
    user = User.find_by email: user_params[:email]

    return render status: :unauthorized unless user

    return render status: :unauthorized unless user.validate_password user_params[:password]

    token = JsonWebToken.encode({ user_id: user.id })

    render json: { token: token }, status: :ok
  end

  def show
    render json: { user: @current_user }, status: :ok
  end

  def user_params
    params.require(:user).permit(:password, :email)
  end
end
