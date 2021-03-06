class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes
  def to_s
    user.to_s
  end
end
