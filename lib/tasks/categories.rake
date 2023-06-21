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

      path = ENV['path'] || './Category.xlsx'
      file = File.expand_path(path, __dir__)
      xlsx = Roo::Spreadsheet.open(file)

      sheets = ['Category', 'Subcategory']

      sheets.each do |i|
        sheet = xlsx.sheet(i)
        create_categories(sheet, i)
      end

      puts "Created #{Category.count} categories."
    end

    def create_categories(sheet, i)

      headers = sheet.row(1)
      puts "Creating Categories"

      sheet.each_with_index do |row, idx|
        next if idx <= 0

        category_data = Hash[[headers, row].transpose]
        id = category_data['ID'].to_int
        name = category_data['Category'].strip
        ancest = category_data['Ancestry'].to_int
        def ancestry(ancest)
            return ancest if ancest != 0
        end
        ancestry = ancestry(ancest)

        Category.where(id: id, name: name, ancestry: ancestry).first_or_create

      end
    end
  end
end
