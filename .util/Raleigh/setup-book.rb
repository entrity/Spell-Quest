require 'faker'

(0..75).each do |r|
    first_name = rand(10) == 0 ? 'John' : Faker::Name.first_name

    puts [r,
        first_name,
        Faker::Name.last_name,
        Faker::Company.name,
        Faker::PhoneNumber.phone_number,
        ].join(',')
end
