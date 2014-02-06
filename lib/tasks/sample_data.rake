namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "test@gmail.com",
                         title: "Admininstrator",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    99.times do |n|
      name  = Faker::Name.first_name
      email = "example-#{n+1}@test.org"
      title = "Web Designer-#{n+1}"
      password = "password"
      User.create!(name: name,
                   email: email,
                   title: title,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
    
  end
end

