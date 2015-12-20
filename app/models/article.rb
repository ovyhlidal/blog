class Article < ActiveRecord::Base
  validates :title, presence: true,
            length: { minimum: 3 }

  has_one :user
end
