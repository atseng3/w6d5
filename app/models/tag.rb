class Tag < ActiveRecord::Base
  attr_accessible :title
  validates :title, presence: true

  has_many :secret_taggings
end
