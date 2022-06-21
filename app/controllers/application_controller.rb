class ApplicationController < ActionController::Base
  include JsonWebToken

  private

  def authenticate_request
    unless request.headers['Authorization'].present?
      render json: { error: 'Not Authorized' }, status: :unauthorized
      return
    end

    header = request.headers['Authorization']
    header = header.split.last if header.present?

    begin
      @decoded = jwt_decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
