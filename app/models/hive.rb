# frozen_string_literal: true

# Hive Model
# @attribut name : String
# @attribut weight : Integer
class Hive < ApplicationRecord
  validates :name,
            length: { minimum: 6,
                      too_short:
                        "There's something wrong with the name. Please add a name with at least 6 characters" },
            presence: true

  validates :weight,
            presence: true, numericality: { only_integer: true, message: 'Weight is required. Please add a number' }
end
