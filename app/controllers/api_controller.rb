class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_request
end