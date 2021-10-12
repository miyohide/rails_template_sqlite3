class Todo < ApplicationRecord
  validates :title, length: { in: 1..100 }
  validates :body, length: { in: 1..500 }
end
