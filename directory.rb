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
#METHODS
#Prints header that comes before student names
def print_header
  puts "The students of Villains Academy"
  puts "-----------------"
end
#Prints all names from students array
def print(names)
  names.each do |name|
    puts name
  end
end
#Prints total number of students in directory
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#CALLING EACH METHOD
print_header
print(students)
print_footer(students)
