class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscriptions

  validates :phone, format: { with: /\A\+?\d*\z/, message: "Phone must start with + and country code e.g. +353"}
end
