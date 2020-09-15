class Physician < ApplicationRecord
  has_many :appointments
  has_many :customers
end
