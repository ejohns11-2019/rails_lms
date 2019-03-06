roles = ['teacher', 'ta', 'student']
10.times do
  course = Course.create(
    name: Faker::ChuckNorris.fact
  )

10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  Enrollment.create(
    role: roles.sample, #to get random element from array above
    course_id: course.id,
    user_id: user.id
  )

  end
end

puts 'All the data is seeded'
