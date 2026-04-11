class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :operations, dependent: :destroy
    has_many :targets, through: :operations
    has_many :findings, through: :targets
    has_many :reports, through: :operations
    has_many :notifications, dependent: :destroy
    has_many :search_queries, dependent: :destroy
    has_many :user_roles, dependent: :destroy
    has_many :roles, through: :user_roles
    has_many :audit_logs, dependent: :destroy
    
    validates :name, presence: true, length: { minimum: 2, maximum: 100 }
    validates :email, presence: true, format: { with: /\A.+@gmail\.com\z/, message: 'must be a Gmail address (example@gmail.com)' }
    validates :terms_accepted, acceptance: { message: 'must be accepted' }
    validates :password, presence: true, unless: :guest_user?
    
    def unread_notifications
      notifications.unread
    end
    
    def notification_count
      unread_notifications.count
    end
    
    def has_permission?(permission)
      roles.any? { |role| role.has_permission?(permission) }
    end
    
    def has_role?(role_name)
      roles.exists?(name: role_name.to_s)
    end
    
    def guest_user?
      has_role?('guest')
    end
    
    def self.authenticate_guest(email)
      user = find_by(email: email)
      user if user && user.guest_user?
    end
    
    def role_names
      roles.pluck(:name)
    end
    
    def assign_role(role_name)
      role = Role.find_by!(name: role_name.to_s)
      user_roles.find_or_create_by!(role: role)
    end
    
    def remove_role(role_name)
      role = Role.find_by!(name: role_name.to_s)
      user_roles.where(role: role).destroy_all
    end
    
    def is_admin?
      has_role?('admin')
    end
    
    def is_operator?
      has_role?('operator') || is_admin?
    end
    
    def is_analyst?
      has_role?('analyst') || is_operator?
    end
end
