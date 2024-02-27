require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'

require 'stringio'

class CashRegisterTest < Minitest::Test
  attr_accessor :transaction, :register, :item_cost

  def setup
    @item_cost = 46
    @total_money = 100
    @register = CashRegister.new(@total_money)
    @transaction = Transaction.new(@item_cost)
    transaction.amount_paid = 60
  end

  def test_accept_money
    transaction.amount_paid = 100
    register.accept_money(transaction)
    assert_equal(200, register.total_money)
  end

  def test_change
    assert_equal(14, register.change(transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end

  def test_prompt_for_payment 
    input = StringIO.new("46\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 46, transaction.amount_paid
  end
end
