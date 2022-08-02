class Api::V1::SubscriptionsSerializer
  def self.new_tea_subscription(params)
    {
      data: {
        type: "tea subscription",
        attributes: {
          title: params[:title],
          annual_frequency: params[:annual_frequency],
          price: params[:price]
        }
      }
    }
  end
end
