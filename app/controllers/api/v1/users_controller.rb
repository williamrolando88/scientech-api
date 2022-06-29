class Api::V1::UsersController < ApiController
  load_and_authorize_resource

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)

    unless can_set_this_role?(@current_user, @user.role)
      render json: { errors: 'User cannot be created' },
             status: :unauthorized
      return
    end

    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless can_set_this_role?(@current_user, @user.role)
      render json: { errors: 'User cannot be updated' },
             status: :unauthorized
      return
    end

    return if @user.update(user_params)

    render json: { errors: @user.errors.full_messages },
           status: :unprocessable_entity
  end

  # DELETE /users/{username}
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: { message: 'User was successfully deleted.' }, status: :no_content
  end

  private

  def user_params
    params.permit(:name, :role, :email, :password, :avatar)
  end

  def can_set_this_role?(user, desired_role)
    authorized_roles = %w(admin, manager)
    available_roles = %w(manager, user)

    if authorized_roles.include?(user.role)
      return true if available_roles.include?(desired_role)
      return false
   end
  end
end
