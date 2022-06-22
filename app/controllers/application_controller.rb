class ApplicationController < ActionController::Base
  include JsonWebToken

  # Override default current_ability function from cancancan gem
  def current_ability
    @current_ability ||= Ability.new(@current_user)
  end

  # Override dafault message for AccessDenied exception of cancancan gem
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
    end
  end

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
