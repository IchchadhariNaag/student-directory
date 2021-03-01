def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp # get the name
  while !name.empty? do # while the name is not empty, repeat this code
    @students << {name: name, cohort: :november} # add the student info hash to the array
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp # get another name from the user
  end
  @students # return the array of students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Enter a csv file to load from"
  puts "9. Exit"
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      puts "Please type the full name including .csv"
      try_load_students(STDIN.gets.chomp)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def save_students

  file = File.open("students.csv", "w") # open the file for writing
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students(filename)
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def interactive_menu
  loop do # print menu and ask user what to do
    print_menu
    process(STDIN.gets.chomp)
  end
end
@students = []
try_load_students(ARGV.first)
interactive_menu
