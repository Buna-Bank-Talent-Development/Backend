require 'roo'
# To import using this script run the command below
# rake db:seed:import_employees
namespace :db do
  namespace :seed do
    desc 'Import employee data from custom excel sheet.'
    task import_employees: :environment do
      EmployeeTraining.delete_all
      Employee.delete_all

      path = ENV['path'] || './Employee List.xlsx'
      file = File.expand_path(path, __dir__)
      xlsx = Roo::Spreadsheet.open(file)

      sheet = xlsx.sheet('Sheet1')
      create_employees(sheet)

      puts "Created #{Employee.count} employees."
    end

    def create_employees(sheet)

      headers = sheet.row(1)
      puts "Creating Employees"

      sheet.each_with_index do |row, idx|
        next if idx <= 0

        employee_data = Hash[[headers, row].transpose]
        id = employee_data['ID']
        name = employee_data['Name of Employee'].strip
        email = employee_data['Email Address'].strip
        department = employee_data['Job Title'].strip
        location = employee_data['Work Unit'].strip

        Employee.where(id: id, full_name: name, email: email, department: department, location: location).first_or_create!

      end
    end
  end
end
