class PrivateMessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = PrivateMessage
      .where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
      .order(created_at: :asc)

    @contacts = current_user.contacts.includes(:contact_user)
  end

  def create
    if params[:receiver_id].to_i == current_user.id
      redirect_to private_messages_path, alert: "Δεν μπορείς να στείλεις μήνυμα στον εαυτό σου"
      return
    end

    unless current_user.contacts.exists?(contact_user_id: params[:receiver_id])
      redirect_to private_messages_path, alert: "Ο χρήστης δεν είναι στις επαφές σου"
      return
    end

    if params[:body].blank?
      redirect_to private_messages_path, alert: "Το μήνυμα δεν μπορεί να είναι κενό"
      return
    end

    PrivateMessage.create!(
      sender_id: current_user.id,
      receiver_id: params[:receiver_id],
      body: params[:body]
    )

    redirect_to private_messages_path, notice: "Το μήνυμα στάλθηκε"
  end
end
