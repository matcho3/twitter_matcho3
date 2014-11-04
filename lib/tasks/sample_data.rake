namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    100.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.jp"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   image: 'taku0m056baff1734726819635522ba3841f705ea2bac335c6.jpg',
                   password: password,
                   password_confirmation: password)
    end
  end
end