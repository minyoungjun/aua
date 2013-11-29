class Paragraph < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :survey
  has_many :boxes
end
