#Array of all student names
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
#Print all names from array
puts "The students of Villains Academy"
puts "-----------------"
#Iterates through students array, printing each one
students.each do |student|
  puts student
end
#Then print total number of students (all on one line)
puts "Overall, we have #{students.count} great students"
