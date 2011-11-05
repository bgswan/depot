require 'spec_helper'
require File.expand_path('app/models/product')

describe Product do
  
  before :each do
    Product.delete_all
  end
  
  it "product attributes must not be empty" do
    product = Product.new
    product.should be_invalid
    product.errors[:title].should_not be_empty
    product.errors[:description].should_not be_empty
    product.errors[:price].should_not be_empty
    product.errors[:image_url].should_not be_empty
  end

  it "product price must be positive" do
    product = Product.new(title:       "My Book Title",
                          description: "yyy",
                          image_url:   "zzz.jpg")
    product.price = -1
    product.should be_invalid
    product.errors[:price].join('; ').should == "must be greater than or equal to 0.01"

    product.price = 0
    product.should be_invalid
    product.errors[:price].join('; ').should == "must be greater than or equal to 0.01"

    product.price = 1
    product.should be_valid
  end

  def new_product(image_url)
    Product.new(title:       "My Book Title",
                description: "yyy",
                price:       1,
                image_url:   image_url)
  end

  it "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      new_product(name).should be_valid
    end

    bad.each do |name|
      new_product(name).should be_invalid
    end
  end

  it "product is not valid without a unique title" do
    product = Product.create!(title:       "A Ruby book title",
                              description: "yyy", 
                              price:       1, 
                              image_url:   "fred.gif")
    duplicate = Product.new(product.attributes)

    duplicate.save.should be_false
    duplicate.errors[:title].join('; ').should == "has already been taken"
  end

  it "product is not valid without a unique title - i18n" do
    product = Product.create!(title:       "A Ruby book title",
                              description: "yyy", 
                              price:       1, 
                              image_url:   "fred.gif")
    duplicate = Product.new(product.attributes)
    
    duplicate.save.should be_false
    duplicate.errors[:title].join('; ').should == I18n.translate('activerecord.errors.messages.taken')
  end
end
