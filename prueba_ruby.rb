def read_alum(file_name)
  file = File.open(file_name, 'r')
  alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
  file.close
  alum
end

def print_menu
  puts 'Ingrese una opción:'
  puts '1) Mostrar el promedio de cada alumno.'
  puts '2) Mostrar inasistencias de cada alumno.'
  puts '3) Mostrar alumnos aprobados.'
  puts '4) Salir.'
  gets.to_i
end

def get_grades(student)
  student.map(&:to_f)
end

def get_average(student)
  grades = get_grades(student)
  grades.sum / (grades.length - 1) #student array length without its first position.
end

def show_average(students)
  students.each do |student|
    puts "Nombre: #{student.first}. Promedio: #{get_average(student)}"
  end
end

def show_absences(students)
  students.each do |student|
    number_of_absences = student[1..-1].count('A')
    puts "Nombre: #{student.first}. Ausencias: #{number_of_absences}"
  end
end

def show_approved(students, mark = 5.0)
  students.each do |student|
    puts student[0] if get_average(student) >= mark
  end
end

students = read_alum('notas.csv')
ask = true

while ask
  action = print_menu
  if action == 1
    show_average(students)
  elsif action == 2
    show_absences(students)
  elsif action == 3
    puts 'Ingrese la nota necesaria para aprobar:'
    mark = gets.chomp
    mark == '' ? show_approved(students) : show_approved(students,mark.to_f)
  elsif action == 4
    puts 'Adiós!'
    ask = false
  else
    puts 'Opción inválida.'
  end
  puts '=================================' unless action < 1 || action > 4
end
