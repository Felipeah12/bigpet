# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActionController::ParameterMissing, with: :unprocessable_entity

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def not_found
    render :nothing, status: __method__
  end

  def unprocessable_entity
    render :nothing, status: __method__
  end

  def api_messages(messages)
    messages.map do |attribute, error_description|
      message = { attribute: attribute.to_s, messages: [] }

      error_description.each_with_index do |description, index|
        code = details[attribute][index][:error].to_s if respond_to?(:details)
        message[:messages] << { code: code, description: description }
      end

      message
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone address birthdate])

    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[email name phone address birthdate password current_password]
    )
  end
end
