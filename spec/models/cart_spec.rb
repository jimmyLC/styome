require 'rails_helper'

RSpec.describe Cart, :type => :model do
  let(:cart){ Cart.new }

  let(:p1){Product.create!( title: "A", price: 100, quantity: 0 )}
  let(:p2){Product.create!( title: "B", price: 200, quantity: 2 )}
  let(:p3){Product.create!( title: "C", price: 300, quantity: 3 )}

  it "should be empty cart" do
    expect(cart.items).to eq([])
  end

  describe ".add_item" do
    it "should add product to cart" do
      cart.add_item(p2.id, 1)
      expect(cart.items).to eq([{ product_id: p2.id, quantity: 1 }])
    end

    it "should add two products to cart" do
      cart.add_item(p2.id, 1)
      cart.add_item(p3.id, 2)
      expect(cart.items).to eq([{ product_id: p2.id, quantity: 1},
                                {product_id: p3.id, quantity: 2 }])
    end

    it "should add the same product to cart" do
      cart.add_item(p2.id, 1)
      cart.add_item(p2.id, 1)
      expect(cart.items).to eq([{ product_id: p2.id, quantity: 2}])
    end

    it "should raise erroe if product is not exist"
    it "should raise erroe if product is sold out"
  end

  describe ".update" do
    it "should update quantity" do
      cart.add_item(p2.id, 1)
      cart.update(p2.id, 3)

      expect(cart.items).to eq([{ product_id: p2.id, quantity: 3 }])
    end

    it "should remove item if quantity <=0" do
      cart.add_item(p2.id, 1)
      cart.update(p2.id, 0)

      expect(cart.items).to eq( [] )
    end
  end

  describe ".remove" do
    it "should remove product" do
      cart.add_item(p2.id, 1)
      cart.remove(p2.id)

      expect(cart.items).to eq([])
    end
  end

  describe ".total" do
    it "should count total" do
      cart.add_item(p2.id, 1)
      cart.add_item(p3.id, 2)

      expect(cart.total).to eq(800)
    end
  end

  describe ".clear" do
    it "should clearr all" do
      cart.add_item(p2.id, 1)
      cart.add_item(p3.id, 2)

      expect(cart.clear).to eq([])
    end
  end
end


