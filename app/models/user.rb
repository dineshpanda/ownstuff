class User < ApplicationRecord
  # Direct associations

  has_many   :blogs,
             dependent: :destroy

  # Indirect associations

  # Validations

  validates :username, uniqueness: { case_sensitive: true }

  validates :username, presence: true

  validates :username, length: { minimum: 6, maximum: 20 }

  # Scopes

  def to_s
    username
  end
end
