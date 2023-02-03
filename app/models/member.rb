class Member < ActiveRecord::Base
  has_one :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  ROLES = %w[admin user public].freeze
  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end
end
