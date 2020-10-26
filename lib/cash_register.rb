#require pry

class CashRegister
    attr_accessor :total, :discount, :price, :items

        def initialize(discount=20)
            @total = 0
            @discount = discount
            @items = []
        end

        def add_item(item, price, quantity=1)
            @total += price * quantity
            quantity.times do 
                @items << item
            end
            @last_transaction = price * quantity
        end

        def apply_discount
            @total = @total * (1 - (@discount.to_f/100))
            if @total <= 0
                "There is no discount to apply."
            else
                "After the discount, the total comes to $#{total.to_i}."
            end
        end

        def void_last_transaction
            @price = @last_transaction
            @total -= @price
        end
    end



