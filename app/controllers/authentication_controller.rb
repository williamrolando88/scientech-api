class AuthenticationController < ApiController
  include JsonWebToken
  skip_before_action :authenticate_request
  
  # POST /login
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = jwt_encode( user_id: user.id, user_data: { name: user.name, email: user.email }, role: user.role)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :role, :avatar)
  end
end