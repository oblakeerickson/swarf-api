class Todo < ApplicationRecord

  belongs_to :list
  validates_presence_of :name

end
