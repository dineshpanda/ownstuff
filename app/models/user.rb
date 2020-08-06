class User < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :username, :presence => true

  validates :username, :length => { :minimum => 6, :maximum => 20 }

  # Scopes
  def to_s
    username
  end

end
