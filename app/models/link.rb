class Link < ApplicationRecord
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :url
  validates :url, url: true

  def self.parse(link)
    input = link.split(' ')
  end
  
end
