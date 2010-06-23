namespace :eldon do 
  desc "Load Sample Data" 
  task :load_fake_data => :environment do
    require 'Faker' 
    1..100.times do
      p = Toy.new 
      p.status = 'FOUND'
      p.description = 'Blablabla'
      p.title = 'Testtest'
      p.save
    end 
  end
end