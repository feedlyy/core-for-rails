class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token

  def login
    user = User.find_by_email(auth_params['email'])
    user.user_token = auth_token
    user.save
    render json: {token: auth_token, user: user,
                  params: auth_params['email'], status: :created}
  end
end
