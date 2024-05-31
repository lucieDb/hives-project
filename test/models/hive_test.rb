# frozen_string_literal: true

require "test_helper"

# apply test hive model:
#  1- rails db:migrate RAILS_ENV=test (only if it's the first time)
#  2- rails test test/models/hive_test.rb

class HiveTest < ActiveSupport::TestCase
  def setup
    @hive = Hive.new(name: 'BeesBees', weight: 9)
  end

  test 'valid hive' do
    assert @hive.valid?
  end

  test 'invalid with short name' do
    @hive.name = 'C'
    refute @hive.valid?
    assert @hive.errors[:name]
  end

  test 'invalid with another string type for name' do
    @hive.name = 12
    refute @hive.valid?
    assert @hive.errors[:name]
  end

  test 'invalid without name' do
    hive_no_name = Hive.new(weight: 15)
    refute hive_no_name.valid?
    assert hive_no_name.errors[:name]
  end

  test 'invalid with another integer type for weight' do
    @hive.weight = 'Yes'
    refute @hive.valid?
    assert @hive.errors[:weight]
  end

  test 'invalid without weight' do
    hive_no_weight = Hive.new(name: 'Beel Murray')
    refute hive_no_weight.valid?
    assert hive_no_weight.errors[:weight]
  end
end
