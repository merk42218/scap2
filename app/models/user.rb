class User < ApplicationRecord
  has_many :users_roles
  has_many :roles, :through => :users_roles
  # before_create :create_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
 def has_role?(role)
   if role.blank?
     return false
   end
   self.roles.each do |r|
     if r.name == role
       return true
     end
   end
   return false
 end
 private
   def create_role
     self.roles << Role.find_by_name(:user)
   end
end
