class Notification < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :message, presence: true
  validates :notification_type, presence: true, inclusion: { in: %w[info warning error success] }
  
  scope :unread, -> { where(read: false) }
  scope :read, -> { where(read: true) }
  scope :recent, -> { order(created_at: :desc) }
  
  def self.create_for_user(user, title:, message:, type: 'info')
    create!(
      user: user,
      title: title,
      message: message,
      notification_type: type,
      read: false
    )
  end
  
  def mark_as_read!
    update!(read: true)
  end
  
  def icon
    case notification_type
    when 'success' then '>'
    when 'warning' then '>'
    when 'error' then '>'
    when 'info' then '>'
    else '>'
    end
  end
  
  def color_class
    case notification_type
    when 'success' then 'text-success'
    when 'warning' then 'text-warning'
    when 'error' then 'text-danger'
    when 'info' then 'text-info'
    else 'text-secondary'
    end
  end
  
  def to_json_with_methods
    as_json(methods: [:icon, :color_class])
  end
end
