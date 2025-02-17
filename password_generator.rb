require 'ruby2d'

set title: "Password generator"
set background: "white"
Text.new(
  "This is a password generator made with ruby.",
  x: 20, y: 20,
  style: 'bold',
  size: 20,
  color: 'blue',
  z: 10
)
LengthInputBox = Rectangle.new(
  x:20, y:60,
  width: 600, height: 50,
  color: "blue",
)

Text.new(
  "Enter the length of the password (default is 20):",
  x:22, y:62,
  style:"bold",
  size:16,
  color:"white",
)

# Creating cursor for input
input_text = ""
cursor_visible= true
cursor_timer=0

# Style
cursor = Rectangle.new(
  x: 55, y: 85, 
  width: 2, height: 20, 
  color: "black", z: 3
)

# Logic
update do
  cursor_timer += 1
  if cursor_timer >= 30
    cursor_visible = !cursor_visible
    cursor_timer = 0
  end
  cursor.color = cursor_visible ? "black" : "blue"
end

text_display = Text.new(
  input_text, x: 55, y: 85, size: 20, color: 'black', z: 2
)

on :key_down do |event|
  if event.key.match?(/\A\d\z/) # Only allow digits (0-9)
    input_text += event.key
  elsif event.key == 'backspace' # Handle backspace
    input_text.chop!
  end

  # Update the displayed text
  text_display.text = input_text

  # Update cursor position
  cursor.x = 55 + text_display.width
end


show

def generate_password(length = 20, use_uppercase = true, use_numbers = true, use_special = true)
  lowercase_letters = ('a'..'z').to_a
  uppercase_letters = ('A'..'Z').to_a
  numbers = ('0'..'9').to_a
  special_characters = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '+', '=']

  # Create a pool of characters based on user preferences
  characters = lowercase_letters
  characters += uppercase_letters if use_uppercase
  characters += numbers if use_numbers
  characters += special_characters if use_special

  # Generate the password
  password = Array.new(length) { characters.sample }.join
  password
end

# Get user input
#puts "This is a password generator made in ruby"
#print "Enter the length of the password (default is 20): "
#length = gets.chomp.to_i
#length = 20 if length <= 0

#print "Include uppercase letters? (y/n): "
#use_uppercase = gets.chomp.downcase == 'y'

#print "Include numbers? (y/n): "
#use_numbers = gets.chomp.downcase == 'y'

#print "Include special characters? (y/n): "
#use_special = gets.chomp.downcase == 'y'

# Generate and display the password
#password = generate_password(length, use_uppercase, use_numbers, use_special)
#puts "\nYour generated password is: #{password}"

