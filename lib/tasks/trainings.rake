require 'roo'
# To import using this script run the command below
# rake db:seed:import_trainings
namespace :db do
  namespace :seed do
    desc 'Import trainings data from custom excel sheet.'
    task import_trainings: :environment do
      EmployeeTraining.delete_all
      Training.delete_all

      path = ENV['path'] || './Trainings.xlsx'
      file = File.expand_path(path, __dir__) 
      xlsx = Roo::Spreadsheet.open(file)

      @categories = Category.all

      sheet = xlsx.sheet('Trainings')
      create_trainings(sheet)

      puts "Created #{Training.count} trainings."
    end

    def create_trainings(sheet)

      headers = sheet.row(1)
      puts "Creating Trainings"

      sheet.each_with_index do |row, idx|
        next if idx <= 0

        training_data = Hash[[headers, row].transpose]


        category = @categories.where.not(ancestry: nil).find_by(name: training_data['Sub-category'].strip)
        parent = @categories.find_by(name: training_data['Category'].strip, ancestry: nil)
        title = training_data['Training Title'].strip
        
        Training.where(training_title: title, parent_category: parent.id , category_id: category.id).first_or_create!
      end
    end
  end
end
