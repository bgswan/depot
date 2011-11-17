require 'shopping_cart_extensions/calculates_total_price'

describe "Calculating total price" do
  
  it "returns the total price of the line items" do
    cart = stub.extend(ShoppingCartExtensions::CalculatesTotalPrice)
    line_items = [stub(total_price: 5), stub(total_price: 10)]
    
    cart.stub(:line_items).and_return(line_items)
    
    cart.total_price.should == 15
  end
end