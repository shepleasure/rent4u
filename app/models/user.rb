class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :listings, dependent: :destroy

  has_many :reviews, dependent: :destroy

  has_many :notifications, dependent: :destroy

  validates_presence_of :fullname
end
