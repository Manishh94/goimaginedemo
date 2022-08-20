Vendor.destroy_all
vendor1 = Vendor.create(name: "vendor1", shipping_name: 'blue dart', shipping_price: 10)
vendor2 = Vendor.create(name: "vendor2", shipping_name: 'tcl', shipping_price: 20)
vendor3 = Vendor.create(name: "vendor3", shipping_name: 'dtdc', shipping_price: 30)
vendor4 = Vendor.create(name: "vendor4", shipping_name: 'balaji', shipping_price: 40)
vendor5 = Vendor.create(name: "vendor5", shipping_name: 'air way', shipping_price: 50)

# PRODUCT
Product.destroy_all
product1 = Product.create({:name=>"tomato", :price => 1, :vendor_id=> vendor1.id })
product2 = Product.create({:name=>"milk", :price => 3, :vendor_id=> vendor2.id })
product3 = Product.create({:name=>"bread", :price => 5.50, :vendor_id=> vendor3.id })
product4 = Product.create({:name=>"bacon", :price => 10 ,:vendor_id=> vendor4.id })
product5 = Product.create({:name=>"cheese", :price => 3.20, :vendor_id=> vendor5.id })

puts "Total number of products: #{Product.all.count}"
puts "Product names: #{Product.all.pluck("name")}"
puts "Product1: #{product1.name} price: #{product1.price.round(2)}"
puts "Product2: #{product2.name} price: #{product2.price.round(2)}"
puts "Product3: #{product3.name} price: #{product3.price.round(2)}"
puts "Product4: #{product4.name} price: #{product4.price.round(2)}"
puts "Product5: #{product5.name} price: #{product5.price.round(2)}"

# CART
Cart.destroy_all
puts "\nTotal cart count: #{Cart.all.count}"
