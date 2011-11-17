module ShoppingCartExtensions
  module CalculatesTotalPrice    
    def total_price
      line_items.map(&:total_price).inject(0, &:+)
    end
  end
end