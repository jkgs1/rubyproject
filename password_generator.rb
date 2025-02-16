def generate_password(length = 20, use_uppercase = true, use_numbers = true, use_special = true)
  lowercase_letters = ('a'..'z').to_a
  uppercase_letters = ('A'..'Z').to_a
  numbers = ('0'..'9').to_a
  special_characters = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '+', '=']

  # Create a pool of characters based on user preferences
  characters = lowercase_letters
  characters += uppercase_letters if !use_uppercase
  characters += numbers if !use_numbers
  characters += special_characters if !use_special

  # Generate the password
  password = Array.new(length) { characters.sample }.join
  password
end

# Get user input
puts "This is a password generator made in ruby"
print "Enter the length of the password (default is 20): "
length = gets.chomp.to_i
length = 20 if length <= 0

print "Include uppercase letters? (y/n): "
use_uppercase = gets.chomp.downcase == 'y'

print "Include numbers? (y/n): "
use_numbers = gets.chomp.downcase == 'y'

print "Include special characters? (y/n): "
use_special = gets.chomp.downcase == 'y'

# Generate and display the password
password = generate_password(length, use_uppercase, use_numbers, use_special)
puts "\nYour generated password is: #{password}"