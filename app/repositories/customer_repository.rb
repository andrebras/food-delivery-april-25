class CustomerRepository < BaseRepository
  def build_row_header
    ['id', 'name', 'address']
  end

  def build_row(customer)
    [customer.id, customer.name, customer.address]
  end

  def build_instance(row)
    customer_attributes = {
      id: row[:id].to_i,
      name: row[:name],
      address: row[:address].to_i,
    }

    Customer.new(customer_attributes)
  end
end