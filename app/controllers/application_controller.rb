class ApplicationController < ActionController::API
  respond_to :json

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end
end
