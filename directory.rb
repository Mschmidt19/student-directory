#Array of all student names
students = [
  ["Dr. Hannibal Lecter", :november],
  ["Darth Vader", :november],
  ["Nurse Ratched", :november],
  ["Michael Corleone", :november],
  ["Alex DeLarge", :november],
  ["The Wicked Witch of the West", :november],
  ["Terminator", :november],
  ["Freddy Krueger", :november],
  ["The Joker", :november],
  ["Joffrey Baratheon", :november],
  ["Norman Bates", :november]
]
#METHODS
#Prints header that comes before student names
def print_header
  puts "The students of Villains Academy"
  puts "-----------------"
end
#Prints all names from students array
def print(students)
  students.each do |student|
    puts "#{student[0]} (#{student[1]} cohort)"
  end
end
#Prints total number of students in directory
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#CALLING EACH METHOD
print_header
print(students)
print_footer(students)
