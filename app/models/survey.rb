class Survey < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :paragraphs,:dependent => :destroy
  has_many :users
end
