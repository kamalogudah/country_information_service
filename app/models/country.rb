class Country < ApplicationRecord
  validates :name, :alpha_2_code, :alpha_3_code, :currency, presence: true
end
