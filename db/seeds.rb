5.times do
  Resume.create({
    name: Faker::Name.name,
    role: Faker::Job.position,
    contact_number: Faker::PhoneNumber.phone_number
  })
end
