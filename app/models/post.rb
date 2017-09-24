class Post < ApplicationRecord
  has_many :comments
  validates_presence_of :title, :body

  def to_s
    self.title
  end
end
