class Toy < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :url, presence: true
end
