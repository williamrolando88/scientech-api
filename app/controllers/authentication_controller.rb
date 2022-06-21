class AuthenticationController < ApiController
  include JsonWebToken
  skip_before_action :authenticate_request
  
  # POST /auth/login
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = jwt_encode( user_id: user.id, role: user.role)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  # POST /auth/signup
  def sign_up
    user = User.create(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages },
              status: :unprocessible_entity
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :role, :avatar)
  end
end