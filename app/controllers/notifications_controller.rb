class NotificationsController < ApplicationController
	before_action :set_notification, only: [:show, :update, :destroy]

  # GET /notifications
  def index
    @notifications = Notification.where("category = ?", params[:category])
    json_response(@notifications)
  end

  # POST /notifications
  def create
    @notification = Notification.create!(notification_params)
    json_response(@notification, :created)
  end

  # GET /notifications/:id
  def show
    json_response(@notification)
  end

  # PUT /notifications/:id
  def update
    @notification.update(notification_params)
    head :no_content
  end

  # DELETE /notifications/:id
  def destroy
    @notification.destroy
    head :no_content
  end

  private

  def notification_params
    # whitelist params
    params.permit( :message, :category, :player_id, :question_id, :url )
  end

  def set_notification
    @notification = Notification.find(params[:id])
  end
end
