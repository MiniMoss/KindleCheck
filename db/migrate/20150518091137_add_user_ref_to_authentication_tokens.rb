class AddUserRefToAuthenticationTokens < ActiveRecord::Migration
  def change
    add_reference :authentication_tokens, :user, index: true
    add_foreign_key :authentication_tokens, :users
  end
end
