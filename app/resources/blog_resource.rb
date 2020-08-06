class BlogResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :content, :string
  attribute :image, :string
  attribute :user_id, :integer

  # Direct associations

  belongs_to :user

  # Indirect associations

end
