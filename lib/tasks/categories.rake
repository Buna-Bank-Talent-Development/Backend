require 'roo'
# To import using this script run the command below
# rake db:seed:import_categories
namespace :db do
  namespace :seed do
    desc 'Import categories data from custom excel sheet.'
    task import_categories: :environment do
      EmployeeTraining.delete_all
      Training.delete_all
      Category.delete_all

      path = ENV['path'] || './Categories.xlsx'
      file = File.expand_path(path, __dir__)
      xlsx = Roo::Spreadsheet.open(file)

    #   sheets = ['Category-Cert', 'Category-HRD', 'Virtual']

    #   sheets.each do |i|
    #     sheet = xlsx.sheet(i)
    #     create_categories(sheet, i)
    #   end
      sheet = xlsx.sheet('Virtual')
      create_categories(sheet)

      puts "Created #{Category.count} categories."
    end

    def create_categories(sheet, i)
      
      def first_digit(num)
        digit = num.abs.digits[-1]
        digit *= num.negative? ? -1 : 1
        return digit
      end

      headers = sheet.row(1)
      puts "Creating Categories"

      sheet.each_with_index do |row, idx|
        next if idx <= 0

        category_data = Hash[[headers, row].transpose]
        # category = training_data['Category'].to_int
        # title = training_data['Name'].strip
        # type = training_data['Type'].strip
        # parent = first_digit(category)
        id = category_data[''].to_int
        name = category_data[''].strip
        ancestry = first_digit(id)
        Category.where(id: id, name: name, ancestry: ancestry).first_or_create
      end
    end
  end
end
