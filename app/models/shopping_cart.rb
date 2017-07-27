class ShoppingCart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def add_product(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def count_of(id)
    contents[id.to_s].to_i
  end

  def show_products
    contents.reduce({}) do |final, (product_id, count)|
      final[Product.find(product_id.to_i)] = count
      final
    end
  end

  def total_price
    contents.reduce(0) do |price, (product_id, count)|
      price += (Product.find(product_id.to_i).price * count)
      price
    end
  end
end
