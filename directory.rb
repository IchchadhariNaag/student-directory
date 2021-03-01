def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp # get the name
  while !name.empty? do # while the name is not empty, repeat this code
    @students << {name: name, cohort: :november} # add the student info hash to the array
    puts "Now we have #{@students.count} students"
    name = gets.chomp # get another name from the user
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
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do # print menu and ask user what to do
    print_menu
    selection = gets.chomp # read the input and save it into a variable
    process(selection)
  end
end

@students = []
interactive_menu
