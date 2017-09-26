class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
  ROLES = {:full_access => 0, :restricted_access => 1}
  
  enum role: ROLES

  scope :with_full_access, -> { where(role: 0) }
  scope :with_restricted_access, -> { where(role: 1) }

 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
