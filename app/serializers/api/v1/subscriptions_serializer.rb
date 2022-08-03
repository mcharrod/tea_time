class Api::V1::SubscriptionsSerializer
  def self.new_tea_subscription(params)
    {
      data: {
        type: "tea subscription",
        attributes: {
          title: params[:title],
          annual_frequency: params[:annual_frequency],
          price: params[:price],
          status: "active"
        }
      }
    }
  end

  def self.cancel_tea_subscription(subscription)
    {
      data: {
        type: "tea subscription",
        attributes: {
          title: subscription.title,
          annual_frequency: subscription.annual_frequency,
          price: subscription.price,
          status: subscription.status
        }
      }
    }
  end
end
