class Country < ApplicationRecord
  validates :name, :alpha_2_code, :alpha_3_code, :currency, presence: true

  def soft_delete
    soft_deleted_at = Time.now
    self.save
  end

  alias :destroy :soft_delete
end
