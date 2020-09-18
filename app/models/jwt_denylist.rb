class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist
  self.table_name = 'jwt_denylist'
end

#Keeps track of people who sign out so that they cant sign in with the same jwt token
