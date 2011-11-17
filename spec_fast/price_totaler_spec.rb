require File.expand_path('lib/cart/totaler')

describe Cart::Totaler do
  
  it "totals things with total_price" do
    line_items = [stub(:total_price => 5), stub(:total_price => 10)]
    
    Cart::Totaler.total_price(line_items).should == 15
  end
end