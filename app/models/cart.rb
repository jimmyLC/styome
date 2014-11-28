class Cart
  attr_accessor :items

  def initialize
    @items = []
  end

  def add_item(product_id, quantity)
    product_id = product_id.to_i
    quantity = quantity.to_i

    product = Product.find(product_id) #check if product exist

    item = @items.find{ |x| x[:product_id] == product_id} #when exist

    if item
      item[:quantity] += quantity
    else
    @items << { product_id: product_id, quantity: quantity }
    end
  end

  def update(product_id, quantity)
    product_id = product_id.to_i
    quantity = quantity.to_i

    item = @items.find{ |x| x[:product_id] == product_id}

    item[:quantity] = quantity
    refresh
  end

  def remove(product_id)
    @items.delete_if{ |x| x[:product_id] == product_id.to_i }
  end

  def products
    @items.map{ |i|
      p = Product.find(i[:product_id])
      {
        product_id: p.id,
        title: p.title,
        price: p.price,
        quantity: i[:quantity],
        amount: p.price * i[:quantity].to_i
      }
    }
  end

  def total
    products.map{ |p| p[:amount] }.sum
  end

  def clear
    @items = []
  end

  private

  def refresh
    @items.delete_if{ |x| x[:quantity].to_i <= 0 }
  end
end