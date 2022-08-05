class Api::V1::SubscriptionsSerializer
  def self.new_tea_subscription(params, sub)
    {
      data: {
        type: "tea subscription",
        attributes: {
          subscription_id: sub.id,
          tea_id: sub.tea_id,
          user_id: sub.user_id,
          title: params[:title],
          annual_frequency: params[:annual_frequency],
          price: params[:price],
          status: sub.status
        }
      }
    }
  end

  def self.cancel_tea_subscription(subscription)
    {
      data: {
        type: "tea subscription",
        attributes: {
          tea_id: subscription.tea_id,
          user_id: subscription.user_id,
          title: subscription.title,
          status: subscription.status
        }
      }
    }
  end

  def self.show_all_subscriptions(user)
    {
      data: {
        type: "subscriptions list",
        attributes: {
          subscriptions: user.subscriptions.map do |sub|
            {
              subscription_id: sub.id,
              tea_id: sub.tea_id,
              title: sub.title,
              price: sub.price,
              status: sub.status,
              frequency: sub.annual_frequency
            }
          end
        }
      }
    }
  end
end
