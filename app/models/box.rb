class Box < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to  :paragraph
  has_many  :examples,:dependent => :destroy

  has_many  :longanswers,:dependent => :destroy

end
