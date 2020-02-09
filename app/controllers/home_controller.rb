require_dependency "knock/application_controller"

module Knock
  class HomeController < ApplicationController
    before_action :authenticate

    def create
      @user = User.where(email: params[:email])
      @user.first.user_token = auth_token

      if @user.save
        render json: {token: auth_token, user: @user}, status: :created
      end
    end

    private
    def authenticate
      unless entity.present? && entity.authenticate(auth_params[:password])
        raise Knock.not_found_exception_class
      end
    end

    def auth_token
      if entity.respond_to? :to_token_payload
        AuthToken.new payload: entity.to_token_payload
      else
        AuthToken.new payload: { sub: entity.id }
      end
    end

    def entity
      @entity ||=
          if entity_class.respond_to? :from_token_request
            entity_class.from_token_request request
          else
            entity_class.find_by email: auth_params[:email]
          end
    end

    def entity_class
      entity_name.constantize
    end

    def entity_name
      self.class.name.scan(/\w+/).last.split('TokenController').first
    end

    def auth_params
      params.require(:auth).permit :email, :password
    end
  end
end
