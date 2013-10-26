class SecretTagging < ActiveRecord::Base
  attr_accessible :tag_id, :secret_id
  validates :tag_id, :secret_id, presence: true

  belongs_to :secret
  belongs_to :tag
end
