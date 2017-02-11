class User < ApplicationRecord
  ADMIN_EMAIL = 'pdonat@seznam.cz'

  def admin?
    email == ADMIN_EMAIL
  end

  def anonymous?
    false
  end
end
