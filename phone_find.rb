require 'CSV'

class UserValidation
  attr_reader :data

  def initialize(filename)
    @filename = filename
    @data = CSV.read(@filename, :headers => true)
  end

  def check_join_date
      date = @data['joined']
      count_limit = date.count
      count = 0
      invalid_rows = []

    while count < count_limit do
      unless date[count].match(/^([0][1-9]|[1][0-2]|\d{1})[-\/.]([0-2][0-9]|[3][0-1]|\d{1})[-\/.](\d{2}|\d{4})$/)
        invalid_rows << count
      end
      count += 1
    end
    invalid_rows
  end

  def check_email
      email = @data['email']
      count_limit = email.count
      count = 0
      invalid_rows = []

    while count < count_limit do
      unless email[count].match(/^[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+$/)
        invalid_rows << count
      end
      count += 1
    end
    invalid_rows
  end

  def check_phone
    phone = @data['phone']
    count_limit = phone.count
    count = 0
    invalid_rows = []

    while count < count_limit do
      unless phone[count].match(/^[1-9]\d{2}(?:|-|.|)[1-9]\d{2}(?:-|.|)\d{4}$/) #consider checking area-code parens
        invalid_rows << count
      end
      count += 1
    end
    invalid_rows
  end

  def invalid_rows
    invalid_rows =[]
    data.each_with_index do |row,check_phone|
      invalid_rows << check_phone
    end
    # data.each_with_index do |row,check_email|
    #   invalid_rows << check_email
    # end
    # data.each_with_index do |row,check_join_date|
    #   invalid_rows << check_join_date
    # end
    p invalid_rows
  end

  # def invalid_rows
  #   invalid_rows =[]
  #   data.each_with_index do |row,count|
  #     unless row[4].match(/^([0][1-9]|[1][0-2]|\d{1})[-\/.]([0-2][0-9]|[3][0-1]|\d{1})[-\/.](\d{2}|\d{4})$/) && row[1].match(/^([0][1-9]|[1][0-2]|\d{1})[-\/.]([0-2][0-9]|[3][0-1]|\d{1})[-\/.](\d{2}|\d{4})$/) && row[3].match(/^[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+$/)
  #       invalid_rows << count
  #     end
  #   end
  #   invalid_rows
  # end

  # def check_all
  #   name = @data['name']
  #   count_limit = name.count
  #   date = @data['joined']
  #   email = @data['email']
  #   phone = @data['phone']
  #   count = 0
  #   invalid_rows = []
  #
  #   while count < count_limit do
  #     unless date[count].match(/^([0][1-9]|[1][0-2]|\d{1})[-\/.]([0-2][0-9]|[3][0-1]|\d{1})[-\/.](\d{2}|\d{4})$/)
  #     AND
  #     unless email[count].match(/^[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+$/)
  #     AND
  #     unless phone[count].match(/^[1-9]\d{2}(?:|-|.|)[1-9]\d{2}(?:-|.|)\d{4}$/)
  #       invalid_rows << count
  #     end
  #     count += 1
  #   end
  #   invalid_rows
  # end

end
