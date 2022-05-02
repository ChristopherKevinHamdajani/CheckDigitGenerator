=begin
Author: Christopher Kevin Hamdajani
This program calculate the check digit of an ISBN13 barcode
=end

# This function calculte the check digit
# @param number integer series of number used(ISBN number) to calculte the check digit
# @return the check digit
def get_check_digit(number)
  total = 0
  digits_array = number.digits.reverse()
  array_length = digits_array.length()
  for index in 0..array_length - 1
    if(index % 2 == 0)
      total += digits_array[index]
    else
      total += digits_array[index] * 3
    end
  end
  mod_result = total % 10
  total_digit = 10 - mod_result
  return total_digit % 10
end

# ask input from user
def input()
  puts "Type 'q' and press enter to exit the program"
  print "Enter the ISBN13 barcode: "
  input = gets.chomp
  return input
end

# main function of the program
def main()
  program_state = true
  while program_state
    user_input = input()
    is_number = user_input.scan(/\D/).empty? #check if input contains only number
    if user_input == "q"
      puts "Thank you"
      program_state = false
    elsif is_number == false
      puts "input must only contains number"
    else
      total_digit = get_check_digit(user_input.to_i)
      puts "The check digit is #{total_digit}"
      puts "Your complete ISBN is #{user_input}#{total_digit}"
      puts ""
    end
  end
end

main()
