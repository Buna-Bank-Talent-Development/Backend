require 'roo'

namespace :db do
  namespace :seed do
    desc 'Import employee data from custom excel sheet.'
    task import_employees: :environment do
      Employee.delete_all

      path = ENV['path'] || './employees.xlsx'
      file = File.expand_path(path, __dir__)
      xlsx = Roo::Spreadsheet.open(file)

      sheet = xlsx.sheet('DATA January -2023')
      create_employees(sheet)

      puts "Created #{Employee.count} employees."
    end

    def create_employees(sheet)

      headers = sheet.row(1)
      puts "Creating Employees"

      sheet.each_with_index do |row, idx|
        next if idx <= 0

        employee_data = Hash[[headers, row].transpose]
        name = employee_data['Name of Employee'].strip
        email = employee_data['Email Address'].strip
        department = employee_data['Job Title'].strip
        location = employee_data['Place of Assignment'].strip

        Employee.where(full_name: name, email: email, department: department, location: location).first_or_create!

      end
    end
  end
end
