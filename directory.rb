@students = [] #An empty array accessable to all methods

#METHODS

#Changed to get names from user instead
def input_students
  puts "Please enter the names of the students"
  puts "To finish, simply hit return twice"
  #Get the first name, store as name
  name = STDIN.gets.chomp
  #While name is not empty, repeat this code
  while !name.empty? do
    #Add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #Get another name from the user
    name = STDIN.gets.chomp
  end
  #return the array of students
  @students
end

#Prints header that comes before student names
def print_header
  if @students.count >= 1
    puts "The students of Villains Academy"
    puts "-----------------"
  end
end

#Prints total number of students in directory
def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  elsif @students.count > 1
    puts "Overall, we have #{@students.count} great students"
  end
end

#Prints all names from @students array
def print_students_list
  if @students.size <= 0
    puts "Sorry, there are no students to display"
  else
    @students.each_with_index do |student, index|
      #Added formatting / justification to output
      #Also added index number before each name
      index_s = "#{index + 1}: "
      name_s = "#{student[:name]}"
      cohort_s = " #{student[:cohort]} cohort"
      puts index_s.ljust(4) + name_s.ljust(32) + cohort_s.ljust(20)
    end
  end
end

#USED IN OTHER METHODS, NO HARDCODED @STUDENTS
def print(students)
  if students.size <= 0
    puts "Sorry, there are no students to display"
  else
    students.each_with_index do |student, index|
      #Added formatting / justification to output
      #Also added index number before each name
      index_s = "#{index + 1}: "
      name_s = "#{student[:name]}"
      cohort_s = " #{student[:cohort]} cohort"
      puts index_s.ljust(4) + name_s.ljust(32) + cohort_s.ljust(20)
    end
  end
end

#CHALLENGES ADDED AS NEW METHODS

#Asks user for a letter and returns all student info for student names beginning with that letter
def print_names_starting_with
  puts "Which letter would you like to search for?"
  letter = STDIN.gets.chomp
  match_array = []
  @students.each_with_index do |student, index|
    #Checks input against capital and lowercase
    if student[:name][0] == letter.upcase || student[:name][0] == letter.downcase
      match_array.push(student)
    end
  end
  print(match_array)
  if match_array.length == 1
    puts "We have found #{match_array.size} student whose name begins with #{letter.upcase}"
  elsif match_array.length > 1
    puts "We have found #{match_array.size} students whose names begin with #{letter.upcase}"
  end
end

#Asks users for an integer x and prints all student info for students whose names are less than or equal to x characters long
def print_names_less_than_x_characters
  puts "Please set the max character length of names to display"
  number = STDIN.gets.chomp
  match_array = []
  #Will not continue unless input is an integer, and avoided cases in which to_i for a string returns 0, AKA an integer
  while number.to_i.to_s != number
    puts "Please enter an integer"
    number = STDIN.gets.chomp
  end
  @students.each_with_index do |student, index|
    if student[:name].length <= number.to_i
      match_array.push(student)
    end
  end
  print(match_array)
  if match_array.length == 1
    puts "We have found #{match_array.size} student with a name of #{number} characters or less"
  elsif match_array.length > 1
    puts "We have found #{match_array.size} students with names of #{number} characters or less"
  end
end

def remove_student
  puts "Which student would you like to remove?"
  name_to_remove = STDIN.gets.chomp
  @students.each do |student|
    if student[:name] == name_to_remove
      @students.delete(student)
      puts "Removed #{name_to_remove} from the Students Directory"
    end
  end
end

def print_menu
  puts "What would you like to do?"
  puts "1. Input the students"
  puts "2. Show all students"
  puts "3. Show students whose name start with a selected letter"
  puts "4. Show students whose name is less than a selected number of characters"
  puts "5. Remove a student"
  puts "7. Load the list from students.csv"
  puts "8. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  #Open the file for writing
  file = File.open("students.csv", "w")
  #Iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Saved file"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "Loaded #{@students.count} students from #{filename}"
end

def try_load_students
  filename = ARGV.first #First argument from the command line
  return if filename.nil? #Get out of the method if no filename given
  if File.exists?(filename) #If it exists
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    print_names_starting_with
  when "4"
    print_names_less_than_x_characters
  when "5"
    remove_student
  when "7"
    load_students
  when "8"
    save_students
  when "9" #terminates the program
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

#INTERACTIVE MENU

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

#CALLING EACH METHOD
try_load_students
interactive_menu
