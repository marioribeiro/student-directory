# helpers

# pluralize student

def student_count(n)
  if n == 1 then "#{n} great student" else "#{n} great students" end
end

# pluralize result

def result_count(n)
    if n == 1 then "#{n} result" else "#{n} results" end
end

# super helpful divider

def divider
  puts "---------------------------------"
end

# data structures

@cohorts = {
  January: 0,
  February: 0,
  March: 0,
  April: 0,
  May: 4,
  June: 25,
  July: 25,
  August: 15,
  September: 25,
  October: 25,
  November: 25,
  December: 25
}

@students = []

# main program

def main_menu
  puts
  puts "1. Create students"
  puts "2. List Students"
  puts "3. Search Students"
  puts "4. Save the list to students.csv"
  puts "5. Load the list from students.csv"
  puts "9. Exit"
end

def search_menu
  puts
  puts "Student Search:"
  puts "1. Search by Letter"
  puts "2. Search by Length"
  puts "3. Back"
end


def process_search_menu(selection)
  case selection
  when "1"
    search_by_letter
  when "2"
    search_by_length
  when "3"
    interactive_main_menu
  else
    puts "Invalid option, try again."
  end
end

def process_main_menu(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    print_students_by_cohort
  when "3"
    interactive_search_menu
  when "4"
    save_students
  when "5"
    load_students
  when "9"
    exit
  else
    puts "Invalid option, try again."
  end
end


def show_students
  print_header
  print_students_list
  print_footer
end


def interactive_main_menu
  loop do
    main_menu
    process_main_menu(STDIN.gets.chomp)
  end
end

def interactive_search_menu
  loop do
    search_menu
    process_search_menu(STDIN.gets.chomp)
  end
end


def create_new_student
  puts "Do you want to create a new student? (y/n)"
  continue = STDIN.gets.chomp.downcase
  if continue == "y"
    return true
  elsif continue == "n"
    return false
  else
    puts "Invalid choice."
    create_new_student
  end
end


def add_cohort
  next_cohort = :May
  puts
  puts "Available cohorts:"
  puts "Number / Month / Vacancies"
  month_number = 1
  @cohorts.each do |month, vacancies|
    puts "(#{month_number}) #{month} - vacancies: #{vacancies}"
    month_number +=1
  end
  puts
  puts "Please enter the month number"
  cohort = STDIN.gets.chomp
  case cohort
  when "1"
    cohort = :May
  when "2"
    cohort = :May
  when "3"
    cohort = :May
  when "4"
    cohort = :May
  when "5"
    cohort = :May
  when "6"
    cohort = :June
  when "7"
    cohort = :July
  when "8"
    cohort = :August
  when "9"
    cohort = :September
  when "10"
    cohort = :October
  when "11"
    cohort = :November
  when "12"
    cohort = :December
  when ""
    puts "No input, the upcoming #{next_cohort} cohort will be added"
    cohort = next_cohort
  else
    puts "Input not recognised, the upcoming #{next_cohort} cohort was added"
  end
  cohort
end


def add_hobbies
  hobbies = []
  puts "Please enter the hobbies of the student"
  puts "To finish, just hit return twice"
  hobby = STDIN.gets.chomp
  while !hobby.empty?
    hobbies << hobby
    hobby = STDIN.gets.chomp
  end
  hobbies.join(" ")
end

def input_students
  continue = create_new_student
  while continue
    puts "Please enter the name of the student"
    name = STDIN.gets.chomp
    cohort = add_cohort
    puts "Please enter the country of birth"
    country_of_birth = STDIN.gets.chomp
    hobbies = add_hobbies
    @students << { name: name, cohort: cohort, country_of_birth: country_of_birth, hobbies: hobbies }
    continue = create_new_student
  end
end

def save_students
  #open the file
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country_of_birth], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if no argument is given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, country_of_birth, hobbies = line.chomp.split(',')
    @students << {name: name, cohort: cohort, country_of_birth: country_of_birth, hobbies: hobbies}
  end
  file.close
end

def print_header
  puts "The students of Villains Academy"
  divider
end


def print_students_by_cohort
  if @students.empty?
    puts "Oopps :( No students available"
  else
    cohorts = @students.map do |student|
       student[:cohort]
    end
    cohorts.uniq.each do |cohort|
      puts "#{cohort} cohort"
        @students.each do |student|
          puts student[:name] if student[:cohort] == cohort
        end
    end
  end
end


def print_students_list
  if @students.empty?
    puts "Oopps :( No students available"
  else
    @students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
  divider
end

def print_alt(students)
  i = 0
  while i < students.count
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
    i += 1
  end
end

def search_by_letter
  puts "Please enter the first letter of the student name you want to search: "
  letter = STDIN.gets.chomp
  puts letter == '' ? "No search value was provided. Showing the full list of students" : "Search results for names starting with #{letter.upcase} / #{letter.downcase} :"
  divider
  number_of_matches = 0
  @students.each do |student|
    if student[:name].start_with?(letter.upcase, letter.downcase)
      puts "#{student[:name]}"
      number_of_matches += 1
    end
  end
  puts
  puts number_of_matches > 0 ? "#{result_count number_of_matches} found." : "Sorry, no results found"
  divider
end


def search_by_length
  puts "Please enter the maximum length you want to search"
  search_length = STDIN.gets.chomp.to_i
  puts "Search results for names with a maximum length of #{search_length}"
  divider
  number_of_matches = 0
  recommendations = []
  @students.each do |student|
    student_name_length = student[:name].length
    if  student_name_length <= search_length
      puts "#{student[:name]}"
      number_of_matches += 1

    # add name as a recommendation if the length difference between the search and result is between 1 and 2
    elsif (student_name_length - search_length).between?(1, 2)
      recommendations << student[:name]
    end
  end
  puts
  puts number_of_matches > 0 ? "#{result_count number_of_matches} found." : "Sorry, no results found"
  puts
  # print recommendations if available
  puts "We have search recommendations:" if recommendations.any?
  recommendations.each do |recommendation|
    puts "#{recommendation}"
  end
end


def print_footer
  puts
  puts "Overall, we have #{student_count @students.count}"
  puts
end

# call the interactive menu
try_load_students
interactive_main_menu
