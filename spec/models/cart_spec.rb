require 'spec_helper'

describe Cart do

  before :each do
    @cart = Cart.create!
    @book_one = Product.create!(title: "book one title", description: "book one", image_url: "/book1.gif", price: 10.00)
    @book_two = Product.create!(title: "book two title", description: "book two", image_url: "/book2.gif", price: 15.00)
  end
  
  it "add unique products" do
    @cart.add_product(@book_one.id).save!
    @cart.add_product(@book_two.id).save!
    assert_equal 2, @cart.line_items.size
    assert_equal @book_one.price + @book_two.price, @cart.total_price
  end

  it "add duplicate product" do
    @cart.add_product(@book_one.id).save!
    @cart.add_product(@book_one.id).save!
    assert_equal 2*@book_one.price, @cart.total_price
    assert_equal 1, @cart.line_items.size
    assert_equal 2, @cart.line_items[0].quantity
  end
end
