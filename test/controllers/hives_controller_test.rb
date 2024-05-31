require "test_helper"

# apply test hive controller:
#  1- rails db:migrate RAILS_ENV=test (only if it's the first time)
#  2- rails test test/controllers/hives_controller_test.rb

class HivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hive = hives(:one)
    @hive.name = 'ValidName' if @hive.name.length < 6
    @hive.weight ||= 10
  end

  test 'should get index' do
    get api_v1_hive_url(@hive), as: :json
    assert_response :success
  end

  test 'should create hive' do
    assert_difference('Hive.count') do
      post api_v1_hive_url(@hive.id), params: { hive: { name: @hive.name, weight: @hive.weight } }, as: :json
    end

    assert_response :created
  end

  test 'should show hive' do
    get api_v1_hive_url(@hive.id), as: :json
    assert_response :success
  end
end
