def input_students
    puts "Please enter the names of the students".center(80)
    puts "To finish, just hit return twice".center(80)
    #create an empty array
    students = []

    loop do 
    #get the first name
    name = gets.strip
    # while the name is not empty, repeat this code  
break if name.empty?
    # Ask for additional information
     puts "Country of birth:".center(80)
     country = gets.strip || ""

     puts "Hobbies:".center(80)
    hobbies = gets.strip || ""

    puts "Height:".center(80)
    height = gets.strip || ""

    puts "cohort:".center(80)
    cohort = gets.strip || ""

      # Add the student hash to the array
    students << {name: name, country: country, hobbies: hobbies, height: height, cohort: cohort}

if students.count > 1
        puts "Now we have #{students.count} students".center(80) 
    else
        puts "Now we have #{students.count} student".center(80) 
    end
end
    # return the array of students
    students
end

def print_header
    puts "The students of Villains Academy".center(80)
    puts "-------------".center(80)
end

def print(students)
    students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]}, #{student[:country]}, #{student[:hobbies]}, #{student[:height]}, (#{student[:cohort]} cohort)".center(80)
    end
end 

def print_cohort(cohort, students)
    cohort_students = students.select { |student| student[:cohort] == cohort }
    puts "#{cohort.capitalize} cohort:".center(80)
    cohort_students.each { |student| puts "#{student[:name]}, (#{student[:country]}, #{student[:hobbies]}, #{student[:height]}) "}
end


def print_footer(students)
    if students.count > 1
    puts "Overall, we have #{students.count} great students".center(80)
    else
        puts "Overall, we have #{students.count} great student".center(80)
    end
end

# nothing happens until we call the methods 
students = input_students
print_header
print(students)
print_cohort("december", students)
print_footer(students)


