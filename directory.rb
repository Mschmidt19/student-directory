#Array of all student names
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
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
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
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
