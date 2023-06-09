require 'roo'
# To import using this script run the command below
# rake db:seed:import_trainings
namespace :db do
  namespace :seed do
    desc 'Import trainings data from custom excel sheet.'
    task import_trainings: :environment do
      Training.delete_all

      path = ENV['path'] || './Training Need.xlsx'
      file = File.expand_path(path, __dir__)
      xlsx = Roo::Spreadsheet.open(file)

      sheets = ['Category-Cert', 'Category-HRD', 'Virtual']

      sheets.each do |i|
        sheet = xlsx.sheet(i)
        create_trainings(sheet, i)
      end
      # sheet = xlsx.sheet('Virtual')
      # create_trainings(sheet)

      puts "Created #{Training.count} trainings."
    end

    def create_trainings(sheet, i)

      headers = sheet.row(1)
      puts "Creating #{i} Trainings"

      sheet.each_with_index do |row, idx|
        next if idx <= 0

        training_data = Hash[[headers, row].transpose]
        # debugger
        category = training_data['Category'].to_int
        title = training_data['Name'].strip
        type = training_data['Type'].strip
        Training.where(training_title: title, training_type: type, category_id: category).first_or_create!

      end
    end
  end
end
