class Chat < ApplicationRecord
  validates :post, presence: true, length: {minimum:1,maximum: 140}
end
