class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :listings, dependent: :destroy

  has_many :reviews, dependent: :destroy

  has_many :notifications, dependent: :destroy

  validates_presence_of :fullname

  validates :mobile_number, phone: { possible: false, types: [:mobile] }

  def needs_mobile_number_verifying?
    if is_verified
      return false
    else
      return true
    end
  end

end
