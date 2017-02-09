class Currency
  attr_reader :amount, :currency_code

  def initialize(amount:, currency_code:)
    @amount = amount
    @currency_code = currency_code
  end

  def ==(parameter)
    @amount == parameter.amount && @currency_code == parameter.currency_code
  end

  def ensure_match!(parameter)
    unless parameter.currency_code == @currency_code
      raise "Different currency types, please convert"
    end
  end

  def plus(parameter)
    ensure_match!(parameter)
      Currency.new(amount: @amount + parameter.amount, currency_code: @currency_code)
  end

  def multiply(parameter)
    if parameter.currency_code == @currency_code
      Currency.new(amount: @amount * parameter.amount, currency_code: @currency_code)
    else
      raise "Different currency types, please convert"
    end
  end

  def minus(parameter)
    if parameter.currency_code == @currency_code
      Currency.new(amount: @amount - parameter.amount, currency_code: @currency_code)
    else
      raise "Different currency types, please convert"
    end
  end
end
