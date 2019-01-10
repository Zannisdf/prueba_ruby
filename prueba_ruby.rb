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
  grades.sum / (grades.length - 1)
end

def show_average(students)
  students.each { |student| puts "Nombre: #{student[0]}. Promedio: #{get_average(student)}" }
end

students = read_alum('notas.csv')



ask = true
while ask
  action = print_menu
  if action == 1
    show_average(students)
  elsif action == 2
    puts 2
  elsif action == 3
    puts 3
  elsif action == 4
    puts 'Adiós!'
    ask = false
  else
    puts 'Opción inválida'
  end
end
