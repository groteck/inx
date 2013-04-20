class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :activate_first

  def activate_first
    self.activate if Admin.count < 1
  end

  def active_for_authentication?
    super && approved?
  end

  def activate
    self.update_attribute(:activated, true)
  end

  def deactivate
    self.update_attribute(:activated, false)
  end
end
