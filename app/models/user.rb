class User < ActiveRecord::Base
  validates_uniqueness_of :username
  has_secure_password
  def admin?
    self.role == 'admin'
  end
end
