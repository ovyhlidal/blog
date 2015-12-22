class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # User::Roles
  # The available roles
  has_and_belongs_to_many :roles

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  has_many :articles
end
