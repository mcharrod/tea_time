require 'rails_helper'

describe 'Tea subscription endpoints' do
  it 'subscribes user to tea' do
    user1 = User.create!(first_name: "Billy", last_name: "Bob", email: "BillyBob@gmail", address: "123 sesame street")
    tea1 = Tea.create!(title: "jasmine tea", description: "relaxing", temperature: 210, brew_time: "5 minutes")

    post api_v1_subscribe_path(user_id: user1.id, tea_id: tea1.id, title: "surprise box tea subscription", annual_frequency: 6, price: 10)

    sub = Subscription.find_by({ user_id: user1.id, tea_id: tea1.id })

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expected_response = {
      data: {
        type: "tea subscription",
        attributes: {
          subscription_id: sub.id,
          tea_id: sub.tea_id,
          user_id: sub.user_id,
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
          tea_id: subscription.tea_id,
          user_id: subscription.user_id,
          title: "jasmine tea subscription box",
          status: "cancelled"
        }
      }
    }

    expect(expected_response).to eq(parsed_response)
    expect(subscription.status).to eq("cancelled")


    # must be able to list record for user later
    # just change the status to cancelled, nothing else??
  end

  it 'index all subscriptions active and cancelled' do
    user1 = User.create!(first_name: "Billy", last_name: "Bob", email: "BillyBob@gmail", address: "123 sesame street")

    tea1 = Tea.create!(title: "jasmine tea", description: "relaxing", temperature: 210, brew_time: "5 minutes")
    tea2 = Tea.create!(title: "oolong tea", description: "invigorating", temperature: 190, brew_time: "3 minutes")
    tea3 = Tea.create!(title: "amethyst tea", description: "sparkly", temperature: 3000, brew_time: "5 minutes")

    subscription1 = Subscription.create!(tea_id: tea1.id, user_id: user1.id, title: "jasmine tea subscription box", annual_frequency: 6, price: 5, status: "active")
    subscription2 = Subscription.create!(tea_id: tea2.id, user_id: user1.id, title: "oolong tea subscription box", annual_frequency: 6, price: 5, status: "active")
    subscription3 = Subscription.create!(tea_id: tea3.id, user_id: user1.id, title: "amethyst tea subscription box", annual_frequency: 6, price: 5, status: "cancelled")

    get api_v1_subscriptions_path(user_id: user1.id)

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    subscriptions_list = [subscription1, subscription2, subscription3]

    expected_response = {
      data: {
        type: "subscriptions list",
        attributes: {
          subscriptions:
          subscriptions_list.map do |subscription|
            {
              subscription_id: subscription.id,
              tea_id: subscription.tea_id,
              title: subscription.title,
              price: subscription.price,
              status: subscription.status,
              frequency: subscription.annual_frequency
            }
          end

        }
      }
    }

    expect(parsed_response).to eq(expected_response)
  end
end
