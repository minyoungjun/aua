class Box < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to  :paragraph
  has_many  :examples
  has_many  :longanswers
end
