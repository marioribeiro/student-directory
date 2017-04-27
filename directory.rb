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

$cohorts = {
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


def create_new_student
  puts "Do you want to create a new student? (y/n)"
  continue = gets.chomp.downcase
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
  $cohorts.each do |month, vacancies|
    puts "(#{month_number}) #{month} - vacancies: #{vacancies}"
    month_number +=1
  end
  puts
  puts "Please enter the month number"
  cohort = gets.chomp
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
  hobby = gets.chomp
  while !hobby.empty?
    hobbies << hobby
    hobby = gets.chomp
  end
  hobbies
end

def input_students
  students = []
  continue = create_new_student
  while continue
    puts "Please enter the name of the student"
    name = gets.chomp
    cohort = add_cohort
    puts "Please enter the country of birth"
    country_of_birth = gets.chomp
    hobbies = add_hobbies
    students << { name: name, cohort: cohort, country_of_birth: country_of_birth, hobbies: hobbies }
    continue = create_new_student
  end
  students
end


def print_header
  puts "The students of Villains Academy"
  divider
end


def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort) "
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

def search_by_letter(students)
  puts "Please enter the first letter of the student name you want to search: "
  letter = gets.chomp
  puts "Search results for names starting with #{letter.upcase} / #{letter.downcase} :"
  divider
  number_of_matches = 0
  students.each do |student|
    if student[:name].start_with?(letter.upcase, letter.downcase)
      puts "#{student[:name]}"
      number_of_matches += 1
    end
  end
  puts
  puts number_of_matches > 0 ? "#{result_count number_of_matches} found." : "Sorry, no results found"
  divider
end


def search_by_length(students)
  puts "Please enter the maximum length you want to search"
  search_length = gets.chomp.to_i
  puts "Search results for names with a maximum length of #{search_length}"
  divider
  number_of_matches = 0
  recommendations = []
  students.each do |student|
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


def print_footer(names)
  puts
  puts "Overall, we have #{student_count names.count}"
  puts
end

# call the methods

students = input_students
print_header
print(students)
search_by_letter(students)
search_by_length(students)
print_footer(students)
