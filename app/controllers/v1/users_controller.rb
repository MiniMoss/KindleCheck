module V1
  class UsersController < ApplicationController
    # login
    def login
      # req = ActiveSupport::JSON.decode(request.body.first)
      credentials = { email: user_params['email'], password: user_params['password'] }
      current_token = User.confirm_password(credentials)
      if current_token
        sign_in current_token, store: false
        secret = AuthenticationToken.create(user_id: current_user.id).secret
        render json: {current_user: current_user, secret: secret}, status: 200
      else
        render json:  'Login failed', status: 401  #Unauthorized
      end
    end

    # register
    def sign_up
      user = User.new(user_params)
      if user.save
        sign_in user
        secret = AuthenticationToken.create(user_id: user.id).secret
        render json: {current_user: user, secret: secret}, status: 200
      else
        render json:  'Sign up failed', status: 422  #Entity already exists
      end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end
