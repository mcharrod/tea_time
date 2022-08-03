require 'rails_helper'

describe 'Tea subscription endpoints' do
  it 'subscribes user to tea' do
    user1 = User.create!(first_name: "Billy", last_name: "Bob", email: "BillyBob@gmail", address: "123 sesame street")
    tea1 = Tea.create!(title: "jasmine tea", description: "relaxing", temperature: 210, brew_time: "5 minutes")

    post api_v1_subscribe_path(user_id: user1.id, tea_id: tea1.id, title: "surprise box tea subscription", annual_frequency: 6, price: 10)
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expected_response = {
      data: {
        type: "tea subscription",
        attributes: {
          title: "surprise box tea subscription",
          annual_frequency: "6",
          price: "10"
        }
      }
    }
    expect(parsed_response).to eq(expected_response)
  end

  it 'cancel a subscription' do
    # post api_v1_subscriptions_path(user_id: user1.id, tea_id: tea1.id, title: "surprise box tea subscription", annual_frequency: 6, price: 10)

    # must be able to list record for user later
    # just change the status to inactive, nothing else??
  end
end
