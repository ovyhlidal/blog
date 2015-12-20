class Article < ActiveRecord::Base
  validates :title, presence: true,
            length: { minimum: 3 }
  validates :text, presence:  true

  has_one :user
end
