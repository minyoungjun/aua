class Example < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :box
  has_many :answers
end
