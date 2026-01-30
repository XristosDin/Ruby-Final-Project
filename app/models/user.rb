class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :contacts
  has_many :contact_users, through: :contacts, source: :contact_user

  has_many :sent_private_messages,
           class_name: "PrivateMessage",
           foreign_key: :sender_id,
           dependent: :destroy

  has_many :received_private_messages,
           class_name: "PrivateMessage",
           foreign_key: :receiver_id,
           dependent: :destroy

  has_many :todos, dependent: :destroy
end




