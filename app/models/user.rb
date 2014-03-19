class User < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :survey
  belongs_to :curriculum
  has_many :answers
end
