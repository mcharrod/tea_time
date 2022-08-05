class Api::V1::TeasSerializer
  def self.list_all_teas
    {
      data: {
        attributes: {
          teas: Tea.all.map do |tea|
            {
              id: tea.id,
              title: tea.title
            }
          end 
        }
      }
    }
  end
end
