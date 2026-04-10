class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :update]
  
  def index
    @notifications = current_user.notifications.recent.limit(50)
    @unread_count = current_user.notification_count
    
    render json: {
      notifications: @notifications.map(&:to_json_with_methods),
      unread_count: @unread_count
    }
  end
  
  def show
    render json: @notification.to_json_with_methods
  end
  
  def update
    if @notification.update(read: true)
      render json: { success: true, notification: @notification.to_json_with_methods }
    else
      render json: { success: false, errors: @notification.errors }
    end
  end
  
  def mark_all_read
    current_user.unread_notifications.update_all(read: true)
    render json: { success: true, unread_count: 0 }
  end
  
  private
  
  def set_notification
    @notification = current_user.notifications.find(params[:id])
  end
end
