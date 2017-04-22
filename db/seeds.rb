# Users
User.create(
    name: Faker::Name.name,
    occupation: "Occupational Therapist",
    email: Faker::Internet.email,
    password: 'password1',
    password_confirmation: 'password1'
)

User.create(
    name: Faker::Name.name,
    occupation: "Recreational Therapist",
    email: Faker::Internet.email,
    password: 'password2',
    password_confirmation: 'password2'
)

User.create(
    name: Faker::Name.name,
    occupation: "Physical Therapist",
    email: Faker::Internet.email,
    password: 'password3',
    password_confirmation: 'password3'
)

User.create(
    name: "Michael Casciato",
    occupation: "Recreational Therapist",
    email: "casciatom@gmail.com",
    password: 'password21',
    password_confirmation: 'password21',
    admin: true
)

# CEUs
15.times do
    Ceu.create(
        title: Faker::Educator.course,
        date: Faker::Time.between(3.years.ago, Date.today, :all),
        duration: Faker::Number.between(30, 300),
        location: Faker::StarWars.planet,
        certificate: "National"
    )
end

10.times do
    Ceu.create(
        title: Faker::Educator.course,
        date: Faker::Time.between(3.years.ago, Date.today, :all),
        duration: Faker::Number.between(30, 300),
        location: Faker::StarWars.planet,
        certificate: "State"
    )
end

# Notes
15.times do
    Note.create(
        content: Faker::Hipster.paragraph,
        user_id: Faker::Number.between(1,4),
        ceu_id: Faker::Number.between(1,10)
    )
end
