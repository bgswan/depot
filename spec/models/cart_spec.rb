require 'spec_helper'
require File.expand_path('app/models/cart')
require File.expand_path('app/models/line_item')
require File.expand_path('app/models/product')

describe Cart do

  before :each do
    Product.delete_all
    @cart = Cart.create!
    @book_one = Product.create!(title: "book one title", description: "book one", image_url: "/book1.gif", price: 10.00)
    @book_two = Product.create!(title: "book two title", description: "book two", image_url: "/book2.gif", price: 15.00)
  end
  
  it "add unique products" do
    @cart.add_product(@book_one.id).save!
    @cart.add_product(@book_two.id).save!
    @cart.line_items.size.should == 2
    @cart.total_price.should == @book_one.price + @book_two.price
  end

  it "add duplicate product" do
    @cart.add_product(@book_one.id).save!
    @cart.add_product(@book_one.id).save!
    @cart.total_price.should == 2*@book_one.price
    @cart.line_items.size.should == 1
    @cart.line_items[0].quantity.should == 2
  end
end
