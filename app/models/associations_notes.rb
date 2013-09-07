class Customer < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

# Suppose we make a new order for a customer. 
# It would look something like this:

	@order = Order.create(order_date: Time.now, customer_id: @customer_id)

# Or deleting a customer, making sure that all the orders get deleted as well:
	
	@orders = Order.where(customer_id: @customer_id)
	@orders.each do |order|
		order.destroy
	end
	@customer.destroy

# With Active Record associations, 
# we can streamline operations like the one above.
# We tell Rails there is a connection between two models. 

	class Customer < ActiveRecord::Base
		has_many :orders, dependent: :destroy
	end

	class Order < ActiveRecord::Base
		belongs_to :customer
	end

# This change allows us to create a new order for a particulat customer easier: 
	
	@order = @customer.orders.create(order_date: Time.now)

# And deleting a customer is way easier now: 
	
	@customer.destroy

# There are six types of these associations in Rails: 
	# belongs_to
		# One-to-One connection with another model
		# Each instance of the declaring model "belongs to" 
			# one instance of the other model
		# must use singular term (belongs_to :customer)
			class CreateOrders < ActiveRecord::Migration
				def change
					create_table :customers do |t|
						t.string :name
						t.timestamps
					end
				

					create_table :orders do |t|
						t.belongs_to :customer
						t.datetime :order_date
						t.timestamps
					end
				end
			end

	has_one
	has_many
	has_many :through 
	has_one :through
	has_and_belongs_to_many


