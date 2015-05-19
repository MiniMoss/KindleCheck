module Authenticable
  protected
  def authenticate_from_token
    if current_token.try :user
      sign_in token.user, store:false
    end
  end

  def current_token
    AuthenticationToken.find_authenticated({ secrect: request.headers[:secrect], secrect_id: request.headers[:secrect_id]})
  end
end
