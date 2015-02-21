FactoryGirl.define do

  factory :user do
    email Faker::Internet.email(Faker::Name.first_name)
    password Faker::Internet.password
  end

  factory :project do
    title 'Stuff to do'
    note 'I should do this by May'
    user
  end

  factory :task do
    title 'Do boring thing'
    note 'I hate boring things'
    completed false
    project
  end
end
