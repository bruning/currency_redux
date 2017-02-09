require 'minitest/pride'
require 'minitest/autorun'
require './currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_creation
    Currency.new(amount: 50, currency_code: 'USD')
  end

  def test_equal_currencies
    a = Currency.new(amount: 10, currency_code: 'USD')
    b = Currency.new(amount: 10, currency_code: 'USD')
    #assert a == b
    assert a.==(b)

    c = Currency.new(amount: 10000, currency_code: 'YEN')
    refute a.==(c)
  end

  def test_plus
    a = Currency.new(amount: 10, currency_code: 'EUR')
    b = Currency.new(amount: 50, currency_code: 'EUR')
    c = a.plus(b)
    refute c != Currency.new(amount: 60, currency_code: 'EUR')
    assert_raises RuntimeError do
      d = Currency.new(amount: 50, currency_code: 'GBP')
      e = b.plus(d)
    end
  end

  def test_minus
    a = Currency.new(amount: 50, currency_code: 'EUR')
    b = Currency.new(amount: 50, currency_code: 'EUR')
    c = a.minus(b)
    refute c != Currency.new(amount: 0, currency_code: 'EUR')
    assert_raises RuntimeError do
      d = Currency.new(amount: 50, currency_code: 'GBP')
      e = b.minus(d)
    end
  end

  def test_multiply
    a = Currency.new(amount: 10, currency_code: 'EUR')
    b = Currency.new(amount: 10, currency_code: 'EUR')
    c = a.multiply(b)
    assert_equals Currency.new(amount: 100, currency_code: 'EUR'), c
    assert_raises RuntimeError do
      d = Currency.new(amount: 10, currency_code: 'GBP')
      e = b.multiply(d)
    end
  end

end
