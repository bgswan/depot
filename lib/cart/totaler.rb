module Cart
  class Totaler
    
    def self.total_price(line_items)
      line_items.map(&:total_price).inject(&:+)
    end
  end
end