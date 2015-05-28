module V1
  class LoginsController < ApplicationController
    def create
      req = ActiveSupport::JSON.decode(request.body.first)
      credentials = { email: req['email'], password: req['password'] }
      current_token = User.confirm_password(credentials)
      if current_token
        sign_in current_token, store: false
        secret = AuthenticationToken.create(user_id: current_user.id).secret
        render json: {current_user: current_user, secret: secret}, status: 200
      else
        render json:  'login failed', status: 401
      end
    end
  end
end
