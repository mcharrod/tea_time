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
          price: "10",
          status: "active"
        }
      }
    }
    expect(parsed_response).to eq(expected_response)
  end

  it 'cancel a subscription' do
    user1 = User.create!(first_name: "Billy", last_name: "Bob", email: "BillyBob@gmail", address: "123 sesame street")
    tea1 = Tea.create!(title: "jasmine tea", description: "relaxing", temperature: 210, brew_time: "5 minutes")
    subscription = Subscription.create!(tea_id: tea1.id, user_id: user1.id, title: "jasmine tea subscription box", annual_frequency: 6, price: 5, status: "active")

    post api_v1_unsubscribe_path(subscription_id: subscription.id)
    subscription.reload

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expected_response = {
      data: {
        type: "tea subscription",
        attributes: {
          title: "jasmine tea subscription box",
          annual_frequency: 6,
          price: 5,
          status: "inactive"
        }
      }
    }

    expect(expected_response).to eq(parsed_response)
    expect(subscription.status).to eq("inactive")


    # must be able to list record for user later
    # just change the status to inactive, nothing else??
  end
end
