class ApplicationController < ActionController::Base
  include JsonWebToken

  before_action :authenticate_request

  private

  def authenticate_request
    unless request.headers['Authorization'].present?
      render json: { error: 'Not Authorized' }, status: :unauthorized
      return
    end

    header = request.headers['Authorization']
    header = header.split('.').last
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
