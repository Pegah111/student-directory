def input_students
    puts "Please enter the names of the students".center(100)
    puts "To finish, just hit return twice".center(100)
    #create an empty array
    students = []

    loop do 
    #get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code  
break if name.empty?
    # Ask for additional information
     puts "Country of birth:".center(100)
     country = gets.chomp

     puts "Hobbies:".center(100)
    hobbies = gets.chomp

    puts "Height:".center(100)
    height = gets.chomp

      # Add the student hash to the array
    students << {name: name, country: country, hobbies: hobbies, height: height, cohort: :november}

    puts "Now we have #{students.count} students".center(100)
    end
    # return the array of students
    students
end

def print_header
    puts "The students of Villains Academy".center(100)
    puts "-------------".center(100)
end

def print(students)
    students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]}, #{student[:country]}, #{student[:hobbies]}, #{student[:height]}, (#{student[:cohort]} cohort)".center(100)
    end
end
    
def print_footer(students)
    puts "Overall, we have #{students.count} great students".center(100)
end

# nothing happens until we call the methods 
students = input_students
print_header
print(students)
print_footer(students)

