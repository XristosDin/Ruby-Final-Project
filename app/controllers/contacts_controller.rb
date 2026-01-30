class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = current_user.contact_users
    @users = User.where.not(id: current_user.id)
  end

  def create
    contact = current_user.contacts.build(contact_user_id: params[:contact_user_id])
    contact.save
    redirect_to contacts_path
  end

  def destroy
    contact = current_user.contacts.find_by(contact_user_id: params[:id])
    contact.destroy if contact
    redirect_to contacts_path
  end
end
