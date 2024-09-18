# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  # Override the default create action
  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { message: 'Signed up successfully.' }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Prevent Devise from using session storage
  def sign_up(resource_name, resource)
    # Do nothing
  end
end

