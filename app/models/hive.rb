class Hive < ApplicationRecord
  validates :name,
            length: { minimum: 6,
                      too_short: '%{value} is not allowed, please add a new name with at least 6 characters' },
            presence: true

  validates :weight,
            presence: true, numericality: { only_integer: true }
end
