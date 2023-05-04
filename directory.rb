@students = []

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to to a file"
    puts "4. Load the list from a file"
    puts "9. Exit" 
  end

  def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def process(selection)   
    case selection
    when "1"
        input_students 
        puts "Students added successfully"
    when "2"
        show_students
    when "3"
        puts "Enter filename to save to:"
        filename = STDIN.gets.chomp
        save_students(filename)
        puts "Students list saved to file successflly"
    when "4"
        puts "Enter filename to load from:"
        filename = STDIN.gets.chomp
        load_students(filename)
        puts "Students list loaded from file successfully"
    when "9"
      exit 
    else
      puts "I don't know what you meant, try again"
    end
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    
    while !name.empty? do
        add_student(name, :november)
        name = STDIN.gets.chomp
    end
end

          def show_students
            print_header
            print_student_list
            print_footer
          end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_student_list
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end

  def print_footer
    puts "Overall, we have #{students.count} great students"
end

def save_students(filename)
    File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    puts "Students list saved to file successfully"
  end

  def load_students(filename = "students.csv")
    File.open("students.csv", "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_student(name, cohort.to_sym)
    end
    puts "Students list loaded from file successfully"
  end

  def add_student(name, cohort)
    @students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
  end

  def try_load_students
    filename = ARGV.first || "students.csv"
    return if filename.nil? 
    if File.exists?(filename)
      load_students(filename)
       puts "Loaded #{@students.count} from #{filename}"
    else 
      puts "Sorry, #{filename} doesn't exist."
      exit 
    end
  end

  filename = __FILE__
File.open(filename, "r") do |file|
  puts file.read
end
  
  try_load_students
  interactive_menu

