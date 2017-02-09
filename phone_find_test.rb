require './phone_find.rb'
require 'minitest/autorun'
require 'minitest/pride'

class UserValidationTest < Minitest::Test

#https://ruby-doc.org/stdlib-2.1.0/libdoc/test/unit/rdoc/Test/Unit/Assertions.html

  def test_initialize
    assert UserValidation.new('homework.csv')
  end

  def test_date
    x = UserValidation.new('homework.csv')
    invalid_join_dates = x.check_join_date
    assert_equal [1, 3, 4, 6], invalid_join_dates
  end

 def test_email
   x = UserValidation.new('homework.csv')
   invalid_emails = x.check_email
   assert_equal [1, 2], invalid_emails
 end

 def test_phone
   x = UserValidation.new('homework.csv')
   invalid_phone = x.check_phone
   assert_equal [2, 4, 5, 6], invalid_phone
 end

 def test_all
   x = UserValidation.new('homework.csv')
   invalid_rows = x.check_join_date + x.check_email + x.check_phone
   assert_equal [1, 2, 3, 4, 5, 6], invalid_rows.uniq.sort
 end
end
