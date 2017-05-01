require 'csv'

# helpers

# pluralize student

def student_count(n)
  n == 1 ? "#{n} great student" : "#{n} great students"
end

# pluralize result

def result_count(n)
    n == 1 ? "#{n} result" : "#{n} results"
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

@width = 50

@loaded_filename = ""
@default_filename = "students.csv"
@save_pending = false

# main program

def header_menu
  divider
  puts "-- Student Directory"
  puts "-- Using file: #{@loaded_filename}"
  divider
end

def main_menu
  header_menu
  puts
  puts "*** MAIN MENU"
  puts "1. Create students"
  puts "2. List Students"
  puts "3. Search Students"
  puts "4. Save to file " + save_pending?
  puts "5. Load from file"
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
    puts "Please enter the name of the file (i.e data.csv). Leave empty to save to #{@loaded_filename}"
    save_filename = STDIN.gets.chomp
    save_filename.empty? ? save_students : save_students(save_filename)
  when "5"
    puts "Please enter the name of the file (i.e data.csv). Leave empty to open the default file"
    load_filename = STDIN.gets.chomp
    load_filename.empty? ? load_students : load_students(load_filename)
  when "9"
    confirm_exit
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
    process_main_menu(STDIN.gets.strip)
  end
end

def interactive_search_menu
  loop do
    search_menu
    process_search_menu(STDIN.gets.strip)
  end
end

def confirm_exit
  if @save_pending == true
    puts "You have unsaved changes. Are you sure you want to exit (y/n)? "
    choice = STDIN.gets.chomp.downcase
    if choice == "y"
      exit
    elsif choice == "n"
      interactive_main_menu
    else
      puts "Invalid option."
      confirm_exit
    end
  else
    exit
  end
end

def save_pending?
  if @save_pending == true
    "(Changes Pending)"
  else
    ""
  end
end

def create_new_student
  puts "Do you want to create a new student? (y/n)".center(@width)
  continue = STDIN.gets.chomp.downcase
  if continue == "y"
    return true
  elsif continue == "n"
    return false
  else
    puts "Invalid choice.".center(@width)
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
  puts "Please enter the month number".center(@width)
  cohort = STDIN.gets.chomp
  case cohort
  when "1"
    cohort = :January
  when "2"
    cohort = :February
  when "3"
    cohort = :March
  when "4"
    cohort = :April
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
    puts "No input, the upcoming #{next_cohort} cohort will be added".center(@width)
    cohort = next_cohort
  else
    puts "Input not recognised, the upcoming #{next_cohort} cohort was added".center(@width)
  end
  cohort
end


def add_hobbies
  hobbies = []
  puts "Please enter the hobbies of the student".center(@width)
  puts "To finish, just hit return twice".center(@width)
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
    puts "Please enter the name of the student".center(@width)
    name = STDIN.gets.chomp
    cohort = add_cohort
    puts "Please enter the country of birth".center(@width)
    country_of_birth = STDIN.gets.chomp
    hobbies = add_hobbies
    save_student(name, cohort, country_of_birth, hobbies)
    @save_pending = true
    continue = create_new_student
  end
end


def save_students(filename = @default_filename)
  #open the file using CSV Class
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      # iterate over the array of students
      csv << [student[:name], student[:cohort], student[:country_of_birth], student[:hobbies]]
    end
    @loaded_filename = filename
    @save_pending = false
    puts
    puts "*** Saved successfully to #{filename} ***"
    puts
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    puts "Loading the default file: #{@default_filename}"
    puts
    @loaded_filename = @default_filename
    load_students
    return
  end
  if File.exists?(filename) # if it exists
    @loaded_filename = filename
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    puts "Loading the default file: #{@default_filename}"
    puts
    load_students
  end
end


def load_students(filename = @default_filename)
  if File.exists?(filename)
    CSV.foreach(filename) do |row|
      name, cohort, country_of_birth, hobbies = row
      save_student(name, cohort, country_of_birth, hobbies)
    end
    @loaded_filename = filename
    puts
    puts "*** File loaded successfully ***"
    puts "*** Using: #{filename}"
    puts
    puts "Loaded #{student_count(@students.count)} from #{filename}"
    puts
  else
    if filename == @default_filename
      puts "The default file #{@default_filename} was not found."
      File.write("students.csv", "")
      @loaded_filename = filename
      puts "A new #{@default_filename} was created."
    else
      puts "*** WARNING *** File #{filename} not found"
      puts "Using the default #{@default_filename}"
    end
  end
end

# I'm not sure if this is the most efficient way
def save_student(name, cohort,country_of_birth, hobbies)
  @students << {name: name, cohort: cohort, country_of_birth: country_of_birth, hobbies: hobbies}
end

def print_header
  puts "The students of Villains Academy".center(@width)
  divider
end


def print_students_by_cohort
  if @students.empty?
    puts "Oopps :( No students available".center(@width)
  else
    print_header
    cohorts = @students.map do |student|
       student[:cohort]
    end
    cohorts.uniq.each do |cohort|
      puts "** #{cohort} cohort:"
        @students.each do |student|
          puts " - #{student[:name]}" if student[:cohort] == cohort
        end
    end
    print_footer
  end
end


def print_students_list
  if @students.empty?
    puts "Oopps :( No students available".center(@width)
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
  puts "Please enter the first letter of the student name you want to search: ".center(@width)
  letter = STDIN.gets.chomp
  puts letter == '' ? "No search value was provided. Showing the full list of students".center(@width) : "Search results for names starting with #{letter.upcase} / #{letter.downcase} :".center(@width)
  divider
  number_of_matches = 0
  @students.each do |student|
    if student[:name].start_with?(letter.upcase, letter.downcase)
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
      number_of_matches += 1
    end
  end
  puts
  puts number_of_matches > 0 ? "#{result_count number_of_matches} found.".center(@width) : "Sorry, no results found".center(@width)
  divider
end


def search_by_length
  puts "Please enter the maximum length you want to search".center(@width)
  search_length = STDIN.gets.chomp.to_i
  puts "Search results for names with a maximum length of #{search_length}".center(@width)
  divider
  number_of_matches = 0
  recommendations = []
  @students.each do |student|
    student_name_length = student[:name].length
    if  student_name_length <= search_length
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
      number_of_matches += 1
    # add name as a recommendation if the length difference between the search and result is between 1 and 2
    elsif (student_name_length - search_length).between?(1, 2)
      recommendations << student[:name]
    end
  end
  puts
  puts number_of_matches > 0 ? "#{result_count number_of_matches} found.".center(@width) : "Sorry, no results found".center(@width)
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
