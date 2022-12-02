class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  serialize :avatars, JSON 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  validates :name,  presence: true, length: { minimum: 4, maximum: 50 }

  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 5 MB!" if avatar.size > 5.megabytes
    end
end
