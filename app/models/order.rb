class Order < ApplicationRecord
  belongs_to :clients
  belongs_to :meals
end
