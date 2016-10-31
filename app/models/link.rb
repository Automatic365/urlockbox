class Link < ApplicationRecord
  belongs_to :user
  validates_presence of :title
  validate_presence_of :url
  validates :url, url: true
end
