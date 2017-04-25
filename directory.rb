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



def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name os not empty, repeat this code

  while !name.empty? do
    students << { name: name, cohort: :november }
    puts "Now we have #{student_count students.count}"
    name = gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villains Academy"
  divider
end


def print(students)
  students.each.with_index(1) { |student, index| puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)" }
  divider
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
